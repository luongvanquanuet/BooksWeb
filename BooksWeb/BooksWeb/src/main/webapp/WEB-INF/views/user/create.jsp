<%@page pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" language="java"%>
<!-- mã hóa dạng utf8-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<%--nhúng phần head import css và js--%>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<style>
    .error{
        color: red;
    }
</style>
<div class="container">
    <main>
        <div class="py-5 text-center">

            <%--<img class="d-block mx-auto mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
            <h2>Tạo mới user</h2>
                <br>
            <form id="create-user" class="needs-validation row">
                <div class="row">
                    <div class="col-sm-4">
                        <label class="form-label">Tên đăng nhập</label>
                        <input type="text" class="form-control" name="userName" placeholder="" value="" required="true"/>
                    </div>

                    <div class="col-sm-4">
                        <label class="form-label">Họ và tên</label>
                        <input type="text" class="form-control" name="fullName" placeholder="" value="" required="true"/>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">email</label>
                        <input type="text" class="form-control" name="email" placeholder="" value="" required="true"/>
                    </div>

                </div>
                <div class="row">
                    <div class="col-sm-4">
                        <label class="form-label">Mật khẩu</label>
                        <input id="password" type="password" class="form-control" name="password" placeholder="" value="" required="true"/>
                    </div>

                    <div class="col-sm-4">
                        <label class="form-label">Nhập lại mật khẩu</label>
                        <input type="password" class="form-control" name="reTypePassword" placeholder="" value="" required=true"/>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">Quyền</label>
                        <select class="form-select" name="role">
                            <option value="ADMIN">ADMIN</option>
                            <option value="USER">USER</option>
                            <option value="BOOK">BOOK</option>
                        </select>
                    </div>
                </div>

                <hr class="my-4">

                <div class="row">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-2">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">Tạo mới user</button>
                    </div>
                </div>

            </form>
        </div>
    </main>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $("#create-user").validate({
            rules: {
                // simple rule, converted to {required:true}
                userName: {
                    required: true
                },
                // compound rule
                email: {
                    required: true,
                    email: true
                },
                password: {
                    required: true,
                    minlength: 6
                },
                reTypePassword:{
                    required: true,
                    equalTo: "#password"
                }
            },
            messages:{
                userName:{
                    required: "Tên đăng nhập không được rỗng"
                },
                email:{
                    required: "Email không được rỗng",
                    email: "Không đúng định dạng email"
                },
                password: {
                    required:"Bắt buộc phải nhập",
                    minlength: "Độ dài ít nhất 6 ký tự"
                },
                reTypePassword: {
                    required: "Bắt buộc phải nhập",
                    equalTo: "Không khớp với mật khẩu"

                }
            },
            submitHandler: function() {
                //bước lấy dữ liệu từ form dựa vào html
                var data=  serialzeArrayToObject($("#create-user"));
                /*alert("Submitted!")*/
                //submit form lên web thì sử dụng ajax
                $.ajax({
                    type: "POST",
                    url: "/user/save",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (msg){
                        alert("lưu thành công");
                    },
                    error: function (err){
                        alert("Lưu thất bại");
                    }
                });
            }
        });
    })


</script>
</body>
</html>
