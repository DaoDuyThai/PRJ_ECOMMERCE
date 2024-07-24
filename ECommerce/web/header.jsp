<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
    
    int totalProducts = 0;
    long subtotal = 0L;
    
    for (String[] cartItem : cartItems) {
        int productId = Integer.parseInt(cartItem[0]);
        Object[] product = productDAO.getProductById(productId);
        if (product != null) {
            int quantity = Integer.parseInt(cartItem[1]);
            long price = (long) product[4];
            
            totalProducts += quantity;
            subtotal += quantity * price;
        
            productDetails.add(new Object[]{
                product[0],  // Product ID
                product[1],  // Product Name
                price,       // Product Price
                cartItem[1], // Quantity
                product[2],  // Product Description
                product[3],  // Product Image URL
                product[5]   // Product Category
            });
        }
    }
%>

<header>
    <!-- TOP HEADER -->
    <div id="top-header">
        <div class="container">
            <ul class="header-links pull-left">
                <li><a href="callto:+84796428094"><i class="fa fa-phone"></i> +84 79-6428-094</a></li>
                <li><a href="mailto:daoduythai.business@gmail.com"><i class="fa fa-envelope-o"></i> daoduythai.business@gmail.com</a></li>
                <li><a href="https://codewithdt.com"><i class="fa fa-send"></i> CodewithDT</a></li>
            </ul>
            <ul class="header-links pull-right">
                <c:if test="${account == null}">
                    <li><a href="login"><i class=""></i> Login</a></li>
                    <li><a href="register"><i class=""></i> Register</a></li>
                    </c:if>
                    <c:if test="${account != null}">
                    <li><a href="profile"><i class="fa fa-user-o"></i>${account.fullname}</a></li>
                    <li><a href="login"><i class=""></i> Logout</a></li>
                    </c:if>
            </ul>
        </div>
    </div>
    <!-- /TOP HEADER -->

    <!-- MAIN HEADER -->
    <div id="header">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">
                <!-- LOGO -->
                <div class="col-md-3">
                    <div class="header-logo">
                        <a href="index" class="logo">
                            <img src="./img/logo.png" alt="">
                        </a>
                    </div>
                </div>
                <!-- /LOGO -->

                <!-- SEARCH BAR -->
                <div class="col-md-6">
                    <div class="header-search">
                        <form id="searchForm" onsubmit="return searchProducts()">
                            <input id="searchInput" class="input" type="text" placeholder="Search here" style="width: calc(100% - 100px);border-radius: 40px 0px 0px 40px;" value="${param.search}">
                            <button type="submit" class="search-btn">Search</button>
                        </form>
                    </div>
                </div>
                <!-- /SEARCH BAR -->

                <!-- ACCOUNT -->
                <div class="col-md-3 clearfix">
                    <div class="header-ctn">
                        <!-- Cart -->
                        <div class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                <i class="fa fa-shopping-cart"></i>
                                <span>Your Cart</span>
                                <div class="qty"><%= totalProducts %></div>
                            </a>
                            <div class="cart-dropdown">
                                <div class="cart-list">
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

                                    <div class="product-widget">
                                        <div class="product-img">
                                            <img src="<%= productImage %>" alt="">
                                        </div>
                                        <div class="product-body">
                                            <h3 class="product-name"><a href="product?id=<%= productId %>"><%= productName %></a></h3>
                                            <h4 class="product-price"><span class="qty"><%= quantity %>x</span><span class="vnd"><%= productPrice %></span></h4>
                                        </div>
                                        <a href="updatecart?action=delete&productId=<%= productId %>">
                                            <button class="delete"><i class="fa fa-close"></i></button>
                                        </a>
                                    </div>

                                    <%
                                        }
                                    %>
                                </div>
                                <div class="cart-summary">
                                    <h5>SUBTOTAL: <span class="total-price vnd"><%= subtotal %></span></h5>
                                </div>
                                <div class="cart-btns">
                                    <c:if test="${account == null}">
                                        <a href="login">Login to continue <i class="fa fa-arrow-circle-right"></i></a>
                                        </c:if>
                                        <c:if test="${account != null}">
                                        <a href="checkout">Checkout <i class="fa fa-arrow-circle-right"></i></a>
                                        </c:if>
                                </div>
                            </div>
                        </div>
                        <!-- /Cart -->

                        <!-- Menu Toogle -->
                        <div class="menu-toggle">
                            <a href="#">
                                <i class="fa fa-bars"></i>
                                <span>Menu</span>
                            </a>
                        </div>
                        <!-- /Menu Toogle -->
                    </div>
                </div>
                <!-- /ACCOUNT -->
            </div>
            <!-- row -->
        </div>
        <!-- container -->
    </div>
    <!-- /MAIN HEADER -->
</header>
<!-- NAVIGATION -->
<nav id="navigation">
    <!-- container -->
    <div class="container">
        <!-- responsive-nav -->
        <div id="responsive-nav">
            <!-- NAV -->
            <ul class="main-nav nav navbar-nav">
                <li><a href="index">Home</a></li>
                <li><a href="store?price-min=0&price-max=100000000&page=1&sort=price_asc">Hot Deals</a></li>
                <li><a href="store?category=Laptop">Laptops</a></li>
                <li><a href="store?category=Smartphone">Smartphones</a></li>
                <li><a href="store?category=Camera">Cameras</a></li>
                <li><a href="store?category=Accessories">Accessories</a></li>
            </ul>
            <!-- /NAV -->
        </div>
        <!-- /responsive-nav -->
    </div>
    <!-- /container -->
</nav>
<!-- /NAVIGATION -->

<script>
    function searchProducts() {
        const searchInput = document.getElementById('searchInput').value.trim();

        const params = new URLSearchParams();

        // Add search input parameter if provided
        if (searchInput !== '') {
            params.set('search', searchInput);
            params.set('sort', 'price_asc');
        }

        // Construct new URL with parameters
        const newUrl = '/ecommerce/store?' + params.toString();
        window.location.href = newUrl;
        return false; // Prevent the default form submit
    }
</script>
