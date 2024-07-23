<%@ page import="java.net.URLDecoder" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.StringTokenizer" %>

<%
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
        <a href="addtocart?action=increase&productId=a">Increase</a>
        <a href="addtocart?action=decrease&productId=a">Decrease</a>
        <a href="addtocart?action=delete&productId="a>Delete</a>
        <table border="1">
            <tr>
                <th>Product ID</th>
                <th>Quantity</th>
            </tr>
            <%
                for (String[] item : cartItems) {
                    out.println("<tr>");
                    out.println("<td>" + item[0] + "</td>");
                    out.println("<td>" + item[1] + "</td>");
                    out.println("</tr>");
                }
            %>
        </table>
        <a href="checkout.jsp">Proceed to Checkout</a>
    </body>
</html>
