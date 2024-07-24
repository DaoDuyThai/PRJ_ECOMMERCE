<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="dal.ProductDAO" %>
<%@ page import="jakarta.servlet.http.Cookie" %>
<%@ page import="jakarta.servlet.http.HttpServletRequest" %>
<%@ page import="jakarta.servlet.http.HttpServletResponse" %>

<%
    // Retrieve the cart from cookies
    Cookie[] cookies = request.getCookies();
    String cart = "";
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("cart")) {
                cart = URLDecoder.decode(cookie.getValue(), "UTF-8");
                break;
            }
        }
    }

    // Parse cart items
    List<String[]> cartItems = new ArrayList<>();
    if (!cart.isEmpty()) {
        String[] items = cart.split(",");
        for (String item : items) {
            String[] parts = item.split(":");
            String productId = parts[0];
            String quantity = parts[1];
            cartItems.add(new String[]{productId, quantity});
        }
    }

    // Retrieve product details from ProductDAO
    ProductDAO productDAO = new ProductDAO();
    List<Object[]> productDetails = new ArrayList<>();
    for (String[] cartItem : cartItems) {
        int productId = Integer.parseInt(cartItem[0]);
        Object[] product = productDAO.getProductById(productId);
        if (product != null) {
            productDetails.add(new Object[]{
                product[0],  // Product ID
                product[1],  // Product Name
                product[4],  // Product Price
                cartItem[1], // Quantity
                product[2],  // Product Description
                product[3],  // Product Image URL
                product[5]   // Product Category
                
            });
        }
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Your Cart</title>
    </head>
    <body>
        <h1>Your Cart</h1>
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Product Name</th>
                <th>Price</th>
                <th>Quantity</th>
                <th>Description</th>
                <th>Image</th>
                <th>Category</th>
                <th>Actions</th>
            </tr>
            <%
                for (Object[] product : productDetails) {
                    String productId = product[0].toString();
                    String productName = (String) product[1];
                    String productPrice = product[2].toString();
                    String quantity = (String) product[3];
                    String productDescription = (String) product[4];
                    String productImage = (String) product[5];
                    String productCategory = (String) product[6];
            %>
            <tr>
                <td><%= productId %></td>
                <td><%= productName %></td>
                <td><%= productPrice %></td>
                <td><%= quantity %></td>
                <td><%= productDescription %></td>
                <td><img src="<%= productImage %>" alt="Product Image" width="100" /></td>
                <td><%= productCategory %></td>
                <td>
                    <a href="updatecart?action=increase&productId=<%= productId %>">Increase</a> |
                    <a href="updatecart?action=decrease&productId=<%= productId %>">Decrease</a> |
                    <a href="updatecart?action=delete&productId=<%= productId %>">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </body>
</html>
