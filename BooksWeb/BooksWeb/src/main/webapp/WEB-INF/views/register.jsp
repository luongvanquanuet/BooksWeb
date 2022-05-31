<%@page pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" language="java"%>
<!-- mã hóa dạng utf8-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html class="no-js" lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Sign Up | ThemeKit - Admin Template</title>
    <meta name="description" content="">
    <meta name="keywords" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="icon" href="../favicon.ico" type="image/x-icon" />

    <link href="https://fonts.googleapis.com/css?family=Nunito+Sans:300,400,600,700,800" rel="stylesheet">

    <link rel="stylesheet" href="/plugins/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
    <link rel="stylesheet" href="/plugins/ionicons/dist/css/ionicons.min.css">
    <link rel="stylesheet" href="/plugins/icon-kit/dist/css/iconkit.min.css">
    <link rel="stylesheet" href="/plugins/perfect-scrollbar/css/perfect-scrollbar.css">
    <link rel="stylesheet" href="/dist/css/theme.min.css">
    <script src="/src/js/vendor/modernizr-2.8.3.min.js"></script>
</head>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>

<%--<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>--%>
<body>
<div class="auth-wrapper">
    <div class="container-fluid h-100">
        <div class="row flex-row h-100 bg-white">
            <div class="col-xl-8 col-lg-6 col-md-5 p-0 d-md-block d-lg-block d-sm-none d-none">
                <div class="lavalite-bg" style="background-image: url('/images/register-bg.jpg')">
                    <div class="lavalite-overlay"></div>
                </div>
            </div>
            <div class="col-xl-4 col-lg-6 col-md-7 my-auto p-0">
                <div class="authentication-form mx-auto">
                    <div class="logo-centered">
                        <a href="/login"><img src="/src/img/brand.svg" alt=""></a>
                    </div>
                    <h3>New to ThemeKit</h3>
                    <p>Join us today! It takes only few steps</p>
                    <form action="register" method="post" id="register">
                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="Email" name="email" required="">
                            <i class="ik ik-user"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Password" id="password" name="password" required="">
                            <i class="ik ik-lock"></i>
                        </div>
                        <div class="form-group">
                            <input type="password" class="form-control" placeholder="Confirm Password" name="repassword" required="">
                            <i class="ik ik-eye-off"></i>
                        </div>
                        <div class="row">
                            <div class="col-12 text-left">
                                <label class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="item_checkbox" name="item_checkbox" value="option1">
                                    <span class="custom-control-label">&nbsp;I Accept <a href="#">Terms and Conditions</a></span>
                                </label>
                            </div>
                        </div>
                        <div class="sign-btn text-center">
                            <button class="btn btn-theme">Create Account</button>
                        </div>
                    </form>
                    <div class="register">
                        <p>Already have an account? <a href="/login">Sign In</a></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function () {
        $("#register").validate({
            rules: {
                // simple rule, converted to {required:true}

                // compound rule
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                repassword:{
                    required: true,
                    equalTo: "#password"
                }
            },
            messages:{
                email:{
                    required: "Email không được rỗng",
                    email: "Không đúng định dạng email"
                },
                password: {
                    required:"Bắt buộc phải nhập",
                    minlength: "Độ dài ít nhất 6 ký tự"
                },
                repassword: {
                    required: "Bắt buộc phải nhập",
                    equalTo: "Không khớp với mật khẩu"

                }
            },
            submitHandler: function() {
                //bước lấy dữ liệu từ form dựa vào html
                var data=  serialzeArrayToObject($("#register"));
                /*alert("Submitted!")*/
                //submit form lên web thì sử dụng ajax
                $.ajax({
                    type: "POST",
                    url: "/register",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (msg){
                        alert(msg.data);
                    },
                    error: function (err){
                        alert("Lưu thất bại");
                    }
                });
            }
        });
    })
</script>
<script src="/plugins/popper.js/dist/umd/popper.min.js"></script>
<script src="/plugins/bootstrap/dist/js/bootstrap.min.js"></script>
<script src="/plugins/perfect-scrollbar/dist/perfect-scrollbar.min.js"></script>
<script src="/plugins/screenfull/dist/screenfull.js"></script>
<script src="/dist/js/theme.js"></script>

</body>
</html>
