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
	<header>
		<!-- TOP HEADER -->
		<div id="top-header">
			<div class="container">
				<ul class="header-links pull-left">
					<li><a href="callto:+84796428094"><i class="fa fa-phone"></i> +84 79-6428-094</a></li>
					<li><a href="mailto:daoduythai.business@gmail.com"><i class="fa fa-envelope-o"></i>
							daoduythai.business@gmail.com</a></li>
					<li><a href="https://codewithdt.com"><i class="fa fa-send"></i>CodewithDT</a></li>
				</ul>
				<ul class="header-links pull-right">
					<li><a href="#"><i class=""></i> Login</a></li>
					<li><a href="#"><i class=""></i> Register</a></li>
					<li><a href="#"><i class="fa fa-user-o"></i> My Account</a></li>
					<li><a href="#"><i class=""></i> Logout</a></li>
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
							<a href="index.html" class="logo">
								<img src="./img/logo.png" alt="">
							</a>
						</div>
					</div>
					<!-- /LOGO -->

					<!-- SEARCH BAR -->
					<div class="col-md-6">
						<div class="header-search">
							<form>
								<select class="input-select">
									<option value="0">All Categories</option>
									<option value="1">Category 01</option>
									<option value="1">Category 02</option>
								</select>
								<input class="input" placeholder="Search here">
								<button class="search-btn">Search</button>
							</form>
						</div>
					</div>
					<!-- /SEARCH BAR -->

					<!-- ACCOUNT -->
					<div class="col-md-3 clearfix">
						<div class="header-ctn">
							<!-- Wishlist -->
							<div>
								<a href="#">
									<i class="fa fa-heart-o"></i>
									<span>Your Wishlist</span>
									<div class="qty">2</div>
								</a>
							</div>
							<!-- /Wishlist -->

							<!-- Cart -->
							<div class="dropdown">
								<a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
									<i class="fa fa-shopping-cart"></i>
									<span>Your Cart</span>
									<div class="qty">3</div>
								</a>
								<div class="cart-dropdown">
									<div class="cart-list">
										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product01.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">product name goes here</a></h3>
												<h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>

										<div class="product-widget">
											<div class="product-img">
												<img src="./img/product02.png" alt="">
											</div>
											<div class="product-body">
												<h3 class="product-name"><a href="#">product name goes here</a></h3>
												<h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
											</div>
											<button class="delete"><i class="fa fa-close"></i></button>
										</div>
									</div>
									<div class="cart-summary">
										<small>3 Item(s) selected</small>
										<h5>SUBTOTAL: $2940.00</h5>
									</div>
									<div class="cart-btns">
										<a href="#">View Cart</a>
										<a href="#">Checkout <i class="fa fa-arrow-circle-right"></i></a>
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
	<!-- /HEADER -->

	<!-- NAVIGATION -->
	<nav id="navigation">
		<!-- container -->
		<div class="container">
			<!-- responsive-nav -->
			<div id="responsive-nav">
				<!-- NAV -->
				<ul class="main-nav nav navbar-nav">
					<li><a href="index.html">Home</a></li>
					<li><a href="store.html">Hot Deals</a></li>
					<li><a href="store.html">Categories</a></li>
					<li><a href="store.html">Laptops</a></li>
					<li><a href="store.html">Smartphones</a></li>
					<li><a href="store.html">Cameras</a></li>
					<li><a href="store.html">Accessories</a></li>
				</ul>
				<!-- /NAV -->
			</div>
			<!-- /responsive-nav -->
		</div>
		<!-- /container -->
	</nav>
	<!-- /NAVIGATION -->

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
									<div class="product">
										<div class="product-img">
											<img src="./img/product01.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product02.png" alt="">
											<div class="product-label">
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product03.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product04.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product05.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
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
						<div class="section-nav">
							<ul class="section-tab-nav tab-nav">
								<li class="active"><a data-toggle="tab" href="#tab2">Laptops</a></li>
								<li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
								<li><a data-toggle="tab" href="#tab2">Cameras</a></li>
								<li><a data-toggle="tab" href="#tab2">Accessories</a></li>
							</ul>
						</div>
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
									<div class="product">
										<div class="product-img">
											<img src="./img/product06.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product07.png" alt="">
											<div class="product-label">
												<span class="new">NEW</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product08.png" alt="">
											<div class="product-label">
												<span class="sale">-30%</span>
											</div>
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product09.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
									<!-- /product -->

									<!-- product -->
									<div class="product">
										<div class="product-img">
											<img src="./img/product01.png" alt="">
										</div>
										<div class="product-body">
											<p class="product-category">Category</p>
											<h3 class="product-name"><a href="#">product name goes here</a></h3>
											<h4 class="product-price">$980.00 <del
													class="product-old-price">$990.00</del></h4>
										</div>
										<div class="add-to-cart">
											<button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to
												cart</button>
										</div>
									</div>
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
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product07.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product08.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product09.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
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
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product04.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product05.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product06.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product07.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product08.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product09.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
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
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product01.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product02.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product03.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
						</div>

						<div>
							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product04.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product05.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- /product widget -->

							<!-- product widget -->
							<div class="product-widget">
								<div class="product-img">
									<img src="./img/product06.png" alt="">
								</div>
								<div class="product-body">
									<p class="product-category">Category</p>
									<h3 class="product-name"><a href="#">product name goes here</a></h3>
									<h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
								</div>
							</div>
							<!-- product widget -->
						</div>
					</div>
				</div>

			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /SECTION -->

	<!-- NEWSLETTER -->
	<div id="newsletter" class="section">
		<!-- container -->
		<div class="container">
			<!-- row -->
			<div class="row">
				<div class="col-md-12">
					<div class="newsletter">
						<p>Sign Up for the <strong>NEWSLETTER</strong></p>
						<form>
							<input class="input" type="email" placeholder="Enter Your Email">
							<button class="newsletter-btn"><i class="fa fa-envelope"></i> Subscribe</button>
						</form>
						<ul class="newsletter-follow">
							<li>
								<a href="https://www.facebook.com/duythai.ddt/"><i class="fa fa-facebook"></i></a>
							</li>
							<li>
								<a href="https://twitter.com/codewithdt"><i class="fa fa-twitter"></i></a>
							</li>
							<li>
								<a href="https://www.instagram.com/dduy_thai/"><i class="fa fa-instagram"></i></a>
							</li>
							<li>
								<a href="https://www.youtube.com/@codewithdt"><i class="fa fa-youtube-play"></i></a>
							</li>
						</ul>
					</div>
				</div>
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
	</div>
	<!-- /NEWSLETTER -->

	<!-- FOOTER -->
	<footer id="footer">
		<!-- top footer -->
		<div class="section">
			<!-- container -->
			<div class="container">
				<!-- row -->
				<div class="row">
					<div class="col-md-4 col-xs-12">
						<div class="footer">
							<h3 class="footer-title">About Us</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor
								incididunt ut.</p>
							<ul class="footer-links">
								<li><a href="callto:+84796428094"><i class="fa fa-phone"></i> +84 79-6428-094</a></li>
								<li><a href="mailto:daoduythai.business@gmail.com"><i class="fa fa-envelope-o"></i>daoduythai.business@gmail.com</a></li>
								<li><a href="https://codewithdt.com"><i class="fa fa-send"></i>CodewithDT</a></li>
							</ul>
						</div>
					</div>

					<div class="col-md-4 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Categories</h3>
							<ul class="footer-links">
								<li><a href="store.html">Hot deals</a></li>
								<li><a href="store.html">Laptops</a></li>
								<li><a href="store.html">Smartphones</a></li>
								<li><a href="store.html">Cameras</a></li>
								<li><a href="store.html">Accessories</a></li>
							</ul>
						</div>
					</div>

					<div class="clearfix visible-xs"></div>

					<div class="col-md-4 col-xs-6">
						<div class="footer">
							<h3 class="footer-title">Service</h3>
							<ul class="footer-links">
								<li><a href="#">My Account</a></li>
								<li><a href="#">View Cart</a></li>
								<li><a href="#">Wishlist</a></li>
								<li><a href="#">Track My Order</a></li>
								<li><a href="#">Help</a></li>
							</ul>
						</div>
					</div>
				</div>
				<!-- /row -->
			</div>
			<!-- /container -->
		</div>
		<!-- /top footer -->
	</footer>
	<!-- /FOOTER -->

	<!-- jQuery Plugins -->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/slick.min.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.zoom.min.js"></script>
	<script src="js/main.js"></script>

</body>

</html>