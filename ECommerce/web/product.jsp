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
                    <!-- Product main img -->
                    <div class="col-md-5 col-md-push-2">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->

                    <!-- Product thumb imgs -->
                    <div class="col-md-2  col-md-pull-5">
                        <div id="product-imgs">
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                            <div class="product-preview">
                                <img src="${requestScope.product[3]}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product thumb imgs -->

                    <!-- Product details -->
                    <div class="col-md-5">
                        <div class="product-details">
                            <h2 class="product-name">${requestScope.product[1]}</h2>
                            <div>
                                <h3 class="product-price vnd">${requestScope.product[4]}</h3>
                            </div>
                            <p>${requestScope.product[2]}</p>

                            <div class="add-to-cart">
                                <center>
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </center>
                            </div>

                            <ul class="product-links">
                                <li>Category: </li>
                                <li><a href="store?category=${requestScope.product[5]}">${requestScope.product[5]}</a></li>
                            </ul>

                            <ul class="product-links">
                                <li>Share:</li>
                                <li><a href="https://www.facebook.com/duythai.ddt/"><i class="fa fa-facebook"></i></a></li>
                                <li><a href="https://twitter.com/codewithdt"><i class="fa fa-twitter"></i></a></li>
                                <li><a href="https://www.instagram.com/dduy_thai/"><i class="fa fa-instagram"></i></a></li>
                                <li><a href="https://www.youtube.com/@codewithdt"><i class="fa fa-youtube-play-play"></i></a></li>
                            </ul>

                        </div>
                    </div>
                    <!-- /Product details -->

                    <!-- Product tab -->
                    <div class="col-md-12">
                        <div id="product-tab">
                            <!-- product tab nav -->
                            <ul class="tab-nav">
                                <li class="active"><a data-toggle="tab" href="#tab1">Details</a></li>
                            </ul>
                            <!-- /product tab nav -->

                            <!-- product tab content -->
                            <div class="tab-content">
                                <!-- tab1  -->
                                <div id="tab1" class="tab-pane fade in active">
                                    <div class="row">
                                        <div class="col-md-12">
                                            <p>${requestScope.product[2]}
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <!-- /tab1  -->
                            </div>
                            <!-- /product tab content  -->
                        </div>
                    </div>
                    <!-- /product tab -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- Section -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <div class="col-md-12">
                        <div class="section-title text-center">
                            <h3 class="title">Related Products</h3>
                        </div>
                    </div>
                    <c:forEach var="p" items="${requestScope.relatedProducts}">
                        <!-- product -->
                        <div class="col-md-3 col-xs-6">
                            <div class="product">
                                <div class="product-img">
                                    <img src="${p[3]}" alt="">
                                </div>
                                <div class="product-body">
                                    <p class="product-category">${p[4]}</p>
                                    <h3 class="product-name"><a href="product?id=${p[0]}">${p[1]}</a></h3>
                                    <h4 class="product-price">${p[2]}</h4>
                                </div>
                                <div class="add-to-cart">
                                    <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                </div>
                            </div>
                        </div>
                        <!-- /product -->
                    </c:forEach>
                    <div class="clearfix visible-sm visible-xs"></div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /Section -->

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
                return number.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
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