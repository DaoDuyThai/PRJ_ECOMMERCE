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

        <!-- Cloudinary -->
        <script src="https://upload-widget.cloudinary.com/latest/global/all.js" type="text/javascript"></script>

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

        <!-- FORM -->
        <div id="" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="newsletter">
                            <p><strong>REGISTER</strong></p>
                            <form>
                                <div class="row">
                                    <div class="label-auth">
                                        <b>Email</b>
                                    </div>
                                </div>
                                <div class="row">
                                    <input id="email" name="email" class="input input-auth" type="email"
                                           placeholder="Enter Your Email" required>

                                </div>
                                <div class="row">
                                    <div class="label-auth">
                                        <b>Password</b>
                                    </div>
                                </div>
                                <div class="row">
                                    <input id="password" name="password" class="input input-auth" type="password"
                                           placeholder="Enter Your Password" required>
                                </div>
                                <div class="row">
                                    <div class="label-auth">
                                        <b>Fullname</b>
                                    </div>
                                </div>
                                <div class="row">
                                    <input id="fullname" name="fullname" class="input input-auth" type="text"
                                           placeholder="Enter Your Fullname" required>
                                </div>
                                <div class="row">
                                    <div class="label-auth">
                                        <b>Avatar</b>
                                    </div>
                                </div>
                                <div class="row">
                                    <button type="button" id="upload_widget" class="cloudinary-button"
                                            style="background-color: #D10024; border: 0px;">Upload files</button>
                                    <img id="avatar-thumbnail" width="200px" height="200px" src="https://res.cloudinary.com/dmqd2y3mp/image/upload/v1719281172/PRJ_ECOMMERCE/opvfjoatonnnolkpvvuc.jpg"/>
                                </div>
                                <div class="error-message">
                                    <b>*Error Message</b>
                                </div>
                                <br />
                                <input id="image-url" name="image-url" class="input input-auth" type="text"
                                       placeholder="Image URL" style="display: none;">
                                <button type="submit" class="newsletter-btn input-auth-btn">Register</button>
                                <br />
                                <br />
                                <br />
                                <br />
                                <div class="row">Already have an account?
                                    <a href="login.html" style="cursor: pointer;">
                                        Login here.
                                    </a>
                                </div>
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
        <%@include file="footer.jsp" %>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js/jquery.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/slick.min.js"></script>
        <script src="js/nouislider.min.js"></script>
        <script src="js/jquery.zoom.min.js"></script>
        <script src="js/main.js"></script>

        <!-- Cloudinary -->
        <script type="text/javascript">
            var myWidget = cloudinary.createUploadWidget({
                cloudName: 'dmqd2y3mp',
                uploadPreset: 'square_2MB',
                cropping: true, //add a cropping step
                showSkipCropButton: false, //don't show the skip crop button
                croppingAspectRatio: 1, //crop the image to a 1:1 aspect ratio
                sources: ["local", "url"], // restrict the upload sources to URL and local files
                multiple: false, //restrict upload to a single file
                folder: "PRJ_ECOMMERCE", //upload files to the specified folder
                resourceType: "image", //specify the resource type to upload
            }, (error, result) => {
                if (!error && result && result.event === "success") {
                    console.log('Done! Here is the image info: ', result.info);
                    document.querySelector('#avatar-thumbnail').src = result.info.secure_url;
                    document.querySelector('#image-url').value = result.info.secure_url;
                }
            })

            document.getElementById("upload_widget").addEventListener("click", function () {
                myWidget.open();
            }, false);
        </script>

    </body>

</html>