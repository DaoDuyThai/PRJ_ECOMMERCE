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
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div class="section">
            <div class="container">
                <div class="row">
                    <div id="aside" class="col-md-3">
                        <form id="filterForm" onsubmit="return buildQuery();">
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
                            <div class="aside">
                                <h3 class="aside-title">Brand</h3>
                                <div class="radio-filter">
                                    <c:forEach var="b" items="${brandList}">
                                        <div class="input-radio">
                                            <input type="radio" id="brand-${b[0]}" name="brand" value="${b[0]}" <c:if test="${param.brand == b[0]}">checked</c:if>>
                                            <label for="brand-${b[0]}">
                                                <span></span>
                                                ${b[0]}
                                            </label>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            <br/>
                            <div style="display: flex; justify-content: center">
                                <button type="submit" style="width: 160px; height: 40px; font-weight: 700; background: #D10024; color: #FFF; border: none; border-radius: 40px;">
                                    Search
                                </button>
                            </div>
                            <br/>
                        </form>
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
                    </div>
                    <div id="store" class="col-md-9">
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
                            <div class="row">
                            <c:forEach var="p" items="${productList}">
                                <div class="col-md-4 col-xs-6">
                                    <div class="product">
                                        <div class="product-img">
                                            <img src="${p[3]}" alt="">
                                        </div>
                                        <div class="product-body">
                                            <p class="product-category">${p[4]}</p>
                                            <h3 class="product-name"><a href="product?id=${p[0]}">${p[1]}</a></h3>
                                            <h4 class="product-price vnd">${p[2]}</h4>
                                        </div>
                                        <div class="add-to-cart">
                                            <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
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
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>
        <script>
                                        function buildQuery(pageNumber) {
                                            pageNumber = pageNumber || 1;
                                            const form = document.getElementById('filterForm');
                                            const formData = new FormData(form);
                                            const params = new URLSearchParams();
                                            const urlParams = new URLSearchParams(window.location.search);
                                            for (const [key, value] of urlParams.entries()) {
                                                if (key !== 'page' && key !== 'sort') {
                                                    params.set(key, value);
                                                }
                                            }
                                            for (const [key, value] of formData.entries()) {
                                                if (value) {
                                                    params.set(key, value);
                                                } else {
                                                    params.delete(key);
                                                }
                                            }
                                            params.set('page', pageNumber);
                                            const sortSelect = document.querySelector('.store-sort .input-select');
                                            if (sortSelect) {
                                                const sortValue = sortSelect.value;
                                                params.set('sort', sortValue);
                                            }
                                            const newUrl = '?' + params.toString();
                                            window.location.href = newUrl;
                                            return false;
                                        }
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const sortSelect = document.querySelector('.store-sort .input-select');
                                            if (sortSelect) {
                                                sortSelect.addEventListener('change', function () {
                                                    buildQuery();
                                                });
                                            }
                                        });
                                        function formatNumberToVND(number) {
                                            return number.toLocaleString('vi-VN', {style: 'currency', currency: 'VND'});
                                        }
                                        function formatVND() {
                                            const elements = document.getElementsByClassName('vnd');
                                            for (let i = 0; i < elements.length; i++) {
                                                const value = parseInt(elements[i].textContent, 10);
                                                if (!isNaN(value)) {
                                                    elements[i].textContent = formatNumberToVND(value);
                                                }
                                            }
                                        }
                                        document.addEventListener('DOMContentLoaded', formatVND);
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const urlParams = new URLSearchParams(window.location.search);
                                            const priceMin = urlParams.get('price-min') || 0;
                                            const priceMax = urlParams.get('price-max') || 100000000;
                                            document.getElementById('price-min').value = priceMin;
                                            document.getElementById('price-max').value = priceMax;
                                            priceSlider.noUiSlider.set([priceMin, priceMax]);
                                        });

                                        var priceInputMax = document.getElementById('price-max'),
                                                priceInputMin = document.getElementById('price-min');

                                        priceInputMax.addEventListener('change', function () {
                                            updatePriceSlider($(this).parent(), this.value);
                                        });

                                        priceInputMin.addEventListener('change', function () {
                                            updatePriceSlider($(this).parent(), this.value);
                                        });

                                        function updatePriceSlider(elem, value) {
                                            if (elem.hasClass('price-min')) {
                                                priceSlider.noUiSlider.set([value, null]);
                                            } else if (elem.hasClass('price-max')) {
                                                priceSlider.noUiSlider.set([null, value]);
                                            }
                                        }

                                        var formatForSlider = {
                                            from: function (formattedValue) {
                                                return Number(formattedValue);
                                            },
                                            to: function (numericValue) {
                                                return Math.round(numericValue);
                                            }
                                        };

                                        var priceSlider = document.getElementById('price-slider');
                                        if (priceSlider) {
                                            noUiSlider.create(priceSlider, {
                                                start: [0, 100000000],
                                                connect: true,
                                                step: 1000000,
                                                range: {
                                                    'min': 0,
                                                    'max': 100000000
                                                },
                                                format: formatForSlider,
                                            });

                                            priceSlider.noUiSlider.on('update', function (values, handle) {
                                                var value = values[handle];
                                                handle ? priceInputMax.value = value : priceInputMin.value = value
                                            });
                                        }
        </script>
    </body>
</html>
