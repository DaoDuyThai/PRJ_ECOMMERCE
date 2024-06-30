<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>PRJ ECOMMERCE</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="css/slick.css" />
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css" />
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css" />
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="css/style.css" />

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
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
                    <!-- ASIDE -->
                    <div id="aside" class="col-md-3">
                        <form id="filterForm" onsubmit="return buildQuery();">
                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Categories</h3>
                                <c:forEach var="c" items="${requestScope.categoryList}">
                                    <div class="radio-filter">
                                        <div class="input-radio">
                                            <input type="radio" id="${c[0]}" name="category" value="${c[0]}" 
                                                   <c:if test="${param.category == c[0]}">checked</c:if>>
                                            <label for="${c[0]}">
                                                <span></span>
                                                ${c[0]}
                                                <small>(${c[1]})</small>
                                            </label>
                                        </div>
                                    </div>
                                </c:forEach>


                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Price</h3>
                                <div class="price-filter">
                                    <div id="price-slider"></div>
                                    <div class="input-number price-min">
                                        <input id="price-min" type="number" name="price-min" class="vnd">
                                    </div>
                                    <span>-</span>
                                    <div class="input-number price-max">
                                        <input id="price-max" type="number" name="price-max" class="vnd">
                                    </div>
                                </div>
                            </div>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Brand</h3>
                                <div class="radio-filter">
                                    <div class="input-radio">
                                        <input type="radio" id="brand-samsung" name="brand" value="SAMSUNG" <c:if test="${param.brand == 'SAMSUNG'}">checked</c:if>>
                                            <label for="brand-samsung">
                                                <span></span>
                                                SAMSUNG
                                            </label>
                                        </div>
                                        <div class="input-radio">
                                            <input type="radio" id="brand-apple" name="brand" value="APPLE" <c:if test="${param.brand == 'APPLE'}">checked</c:if>>
                                            <label for="brand-apple">
                                                <span></span>
                                                APPLE
                                            </label>
                                        </div>
                                        <div class="input-radio">
                                            <input type="radio" id="brand-asus" name="brand" value="ASUS" <c:if test="${param.brand == 'ASUS'}">checked</c:if>>
                                            <label for="brand-asus">
                                                <span></span>
                                                ASUS
                                            </label>
                                        </div>
                                        <div class="input-radio">
                                            <input type="radio" id="brand-dell" name="brand" value="DELL" <c:if test="${param.brand == 'DELL'}">checked</c:if>>
                                            <label for="brand-dell">
                                                <span></span>
                                                DELL
                                            </label>
                                        </div>
                                    </div>
                                </div>
                                <!-- /aside Widget -->
                                <br/>
                                <div style="display: flex; justify-content: center">
                                    <button type="submit" style="width: 160px; height: 40px; font-weight: 700; background: #D10024; color: #FFF; border: none; border-radius: 40px;">
                                        Search
                                    </button>
                                </div>
                                <br/>

                            </form>
                            <!-- /aside Widget -->

                            <!-- aside Widget -->
                            <div class="aside">
                                <h3 class="aside-title">Top selling</h3>
                            <c:forEach var="p" items="${requestScope.topBoughtProducts}">
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
                        </div>
                        <!-- /aside Widget -->
                    </div>
                    <!-- /ASIDE -->

                    <!-- STORE -->
                    <div id="store" class="col-md-9">
                        <!-- store top filter -->
                        <div class="store-filter clearfix">
                            <div class="store-sort">
                                <label>
                                    Sort By:
                                    <select class="input-select">
                                        <option value="price_asc" <c:if test="${param.sort == 'price_asc'}">selected</c:if>>Price Ascending</option>
                                        <option value="price_desc" <c:if test="${param.sort == 'price_desc'}">selected</c:if>>Price Descending</option>
                                        </select>
                                    </label>
                                </div>
                            </div>
                            <!-- /store top filter -->

                            <!-- store products -->
                            <div class="row">
                            <c:forEach var="p" items="${productList}">
                                <!-- product -->
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="${p[3]}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${p[4]}</p>
                                            <h3 class="product-name"><a href="#">${p[1]}</a></h3>
                                            <h4 class="product-price vnd">${p[2]}</h4>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </div>
                                    </div>
                                </div>
                                <!-- /product -->
                            </c:forEach>
                        </div>
                        <!-- /store products -->

                        <!-- store bottom filter -->
                        <div class="store-filter clearfix">
                            <ul class="store-pagination">
                                <c:if test="${currentPage > 1}">
                                    <li><a href="#" onclick="return buildQuery(${currentPage - 1});"><i class="fa fa-angle-left"></i></a></li>
                                        </c:if>

                                <c:forEach var="i" begin="1" end="${totalPages}">
                                    <li class="${i == currentPage ? 'active' : ''}">
                                        <a href="#" onclick="return buildQuery(${i});">${i}</a>
                                    </li>
                                </c:forEach>

                                <c:if test="${currentPage < totalPages}">
                                    <li><a href="#" onclick="return buildQuery(${currentPage + 1});"><i class="fa fa-angle-right"></i></a></li>
                                        </c:if>
                            </ul>
                        </div>
                        <!-- /store bottom filter -->
                    </div>
                    <!-- /STORE -->
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
                                        function buildQuery(pageNumber) {
                                            pageNumber = pageNumber || 1; // Default to page 1 if pageNumber is undefined or falsy

                                            const form = document.getElementById('filterForm');
                                            const formData = new FormData(form);
                                            const params = new URLSearchParams();

                                            // Preserve existing query parameters
                                            const urlParams = new URLSearchParams(window.location.search);
                                            for (const [key, value] of urlParams.entries()) {
                                                if (key !== 'page' && key !== 'sort') { // Exclude page and sort parameters for now
                                                    params.set(key, value); // Update existing parameter
                                                }
                                            }

                                            // Add or update dynamically selected parameters
                                            for (const [key, value] of formData.entries()) {
                                                if (value) {
                                                    params.set(key, value); // Update or set new parameter
                                                } else {
                                                    params.delete(key); // Remove parameter if value is empty (optional)
                                                }
                                            }

                                            // Add or update the page parameter
                                            params.set('page', pageNumber);

                                            // Add or update the sort parameter
                                            const sortSelect = document.querySelector('.store-sort .input-select');
                                            if (sortSelect) {
                                                const sortValue = sortSelect.value;
                                                params.set('sort', sortValue);
                                            }

                                            // Construct new URL with parameters
                                            const newUrl = '?' + params.toString();
                                            window.location.href = newUrl;
                                            return false; // Prevent the default form submit
                                        }

                                        // Add event listener to the sort select element
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const sortSelect = document.querySelector('.store-sort .input-select');
                                            if (sortSelect) {
                                                sortSelect.addEventListener('change', function () {
                                                    buildQuery();
                                                });
                                            }
                                        });
        </script>
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
