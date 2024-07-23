<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.StringTokenizer" %>
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
        StringTokenizer items = new StringTokenizer(cart, ",");
        while (items.hasMoreTokens()) {
            String item = items.nextToken();
            StringTokenizer product = new StringTokenizer(item, ":");
            String productId = product.nextToken();
            String quantity = product.nextToken();
            cartItems.add(new String[]{productId, quantity});
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
                <th>Quantity</th>
                <th>Actions</th>
            </tr>
            <%
                for (String[] item : cartItems) {
                    String productId = item[0];
                    String quantity = item[1];
            %>
            <tr>
                <td><%= productId %></td>
                <td><%= quantity %></td>
                <td>
                    <a href="updatecart?action=increase&productId=1">Increase</a> |
                    <a href="updatecart?action=decrease&productId=1">Decrease</a> |
                    <a href="updatecart?action=delete&productId=1">Delete</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </body>
</html>
