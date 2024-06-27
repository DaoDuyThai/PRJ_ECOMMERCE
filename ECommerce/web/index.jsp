<%-- 
    Document   : index
    Author     : codewithdt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->

        <title>PRJ ECOMMERCE</title>

        <!-- Google font -->
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css" />
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
                  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
                  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
                <![endif]-->

    </head>

    <body>
        <!-- HEADER -->
        <%@include file="header.jsp" %>
        <!-- /HEADER -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Collection</h3>
                                <a href="store.html" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop03.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Accessories<br>Collection</h3>
                                <a href="store.html" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="./img/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Cameras<br>Collection</h3>
                                <a href="store.html" class="cta-btn">Shop now <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">New Products</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <c:forEach var="p" items="${requestScope.top6NewestProductList}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${p[3]}" alt="">
                                                    <div class="product-label">
                                                        <span class="new">NEW</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${p[4]}</p>
                                                    <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                                    <h4 class="product-price vnd">${p[2]}</h4>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                        cart</button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->
        <div id="hot-deal" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Days</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Hours</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Mins</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Secs</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">hot deal this week</h2>
                            <p>New Collection Up to 50% OFF</p>
                            <a class="primary-btn cta-btn" href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Top selling</h3>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->
                                        <c:forEach var="p" items="${requestScope.mostBoughtLaptopList}">
                                            <div class="product">
                                                <div class="product-img">
                                                    <img src="${p[3]}" alt="">
                                                    <div class="product-label">
                                                        <span class="sale">TOP SELLING</span>
                                                    </div>
                                                </div>
                                                <div class="product-body">
                                                    <p class="product-category">${p[4]}</p>
                                                    <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                                    <h4 class="product-price vnd">${p[2]}</h4>
                                                </div>
                                                <div class="add-to-cart">
                                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
                                                        cart</button>
                                                </div>
                                            </div>
                                        </c:forEach>
                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.firstSmartphoneList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>

                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.lastSmartphoneList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.firstCameraList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>

                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.lastCameraList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Top selling</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.firstAccessoriesList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>

                            <div>
                                <!-- product widget -->
                                <c:forEach var="p" items="${requestScope.lastAccessoriesList}">
                                    <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${p[3]}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p[4]}</p>
                                        <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                        <h4 class="product-price vnd">${p[2]}</h4>
                                    </div>
                                </div>
                                </c:forEach>
                                <!-- /product widget -->
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- FOOTER -->
        <%@include file="footer.jsp" %>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script>
		function formatNumberToVND(number) {
			return number.toLocaleString('vi-VN', { style: 'currency', currency: 'VND' });
		}

		function formatVND() {
			// Get all elements with the class name 'vnd'
			const elements = document.getElementsByClassName('vnd');

			// Loop through the elements and format the content
			for (let i = 0; i < elements.length; i++) {
				const value = parseInt(elements[i].textContent, 10);
				if (!isNaN(value)) {
					elements[i].textContent = formatNumberToVND(value);
				}
			}
		}

		document.addEventListener('DOMContentLoaded', formatVND);
	</script>
        
    </body>

</html>