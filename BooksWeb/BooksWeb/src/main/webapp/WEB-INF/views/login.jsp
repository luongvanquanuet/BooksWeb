<%@page pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" language="java"%>
<!-- mã hóa dạng utf8-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%--nhúng phần head import css và js--%>
<%--<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>--%>
<head>
    <meta charset="utf-8">
    <title>Login | ThemeKit - Admin Template</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="../favicon.ico" type="image/x-icon" />

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="../plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="../plugins/ionicons/dist/css/ionicons.min.css">
    <link rel="stylesheet" href="../plugins/icon-kit/dist/css/iconkit.min.css">
    <link rel="stylesheet" href="../plugins/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" href="../dist/css/theme.min.css">
    <script src="../src/js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<div class="auth-wrapper">
    <div class="container-fluid h-100">
        <div class="row flex-row h-100 bg-white">
            <div class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none">
                <div class="lavalite-bg" style="background-image: url('/images/login-bg.jpg')">
                    <div class="lavalite-overlay"></div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
                <div class="authentication-form mx-auto">
                    <div class="logo-centered">
                        <a href="#"><img src="/images/brand.svg" alt=""></a>
                    </div>
                    <h3>Sign In to ThemeKit</h3>
                    <p style="color: red">${message}</p>
                    <form action="/doLogin" method="post" class="needs-validation">
                        <div class="form-group">
                            <input type="text" class="form-control" name="username" placeholder="User name" required="" value="johndoe@admin.com">
                            <i class="ik ik-user"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" name="password" required="" value="123456">
                            <i class="ik ik-lock"></i>
                        </div>
                        <div class="row">
                            <div class="col text-left">
                                <label class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="item_checkbox" name="item_checkbox" value="option1">
                                    <span class="custom-control-label">&nbsp;Remember Me</span>
                                </label>
                            </div>
                            <div class="col text-right">
                                <a href="forgot-password.html">Forgot Password ?</a>
                            </div>
                        </div>
                        <div class="sign-btn text-center">
                            <button class="btn btn-theme">Sign In</button>
                        </div>
                    </form>
                    <div class="register">
                        <p>Don't have an account? <a href="/register">Create an account</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script>window.jQuery || document.write('<script src="../src/js/vendor/jquery-3.3.1.min.js"><\/script>')</script>
<script src="/plugins/popper.js/dist/umd/popper.min.js"></script>
<script src="/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/plugins/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
<script src="/plugins/screenfull/dist/screenfull.js"></script>
<script src="/dist/js/theme.js"></script>
<!-- Google Analytics: change UA-XXXXX-X to be your site's ID. -->
<script>
    (function(b,o,i,l,e,r){b.GoogleAnalyticsObject=l;b[l]||(b[l]=
        function(){(b[l].q=b[l].q||[]).push(arguments)});b[l].l=+new Date;
        e=o.createElement(i);r=o.getElementsByTagName(i)[0];
        e.src='https://www.google-analytics.com/analytics.js';
        r.parentNode.insertBefore(e,r)}(window,document,'script','ga'));
    ga('create','UA-XXXXX-X','auto');ga('send','pageview');
</script>
</body>
</html>

<%--<div class="container">
    <main>
        <div class="py-5 text-center">

            &lt;%&ndash;<img class="d-block mx-auto mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">&ndash;%&gt;
            <h2>Đăng nhập</h2>
            <br>
                <img src="/images/anh.jpg" width="100">
            <form id="login" action="/doLogin" method="post" class="needs-validation">
                <div class="row">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-6">
                        <label class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" name="username" placeholder="" value="" required="true"/>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-3">
                    </div>
                    <div class="col-sm-6">
                        <label class="form-label">Mật khẩu</label>
                        <input id="password" type="password" class="form-control" name="password" placeholder="" value="" required="true"/>
                    </div>
                </div>
                <hr class="my-4">

                <div class="row">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-2">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">Đăng nhập</button>
                    </div>
                </div>

            </form>
        </div>
    </main>

</div>--%>
<%--<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>--%>

