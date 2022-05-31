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
            <h2>Thay đổi mật khẩu</h2>
                <br>
            <form id="change-pass" class="needs-validation">

                <div class="row">
                    <div class="col-sm-4">
                        <label class="form-label">Nhập mật khẩu cũ </label>
                        <input id="password" type="password" class="form-control" name="oldPassword" placeholder="" value="" required="true"/>
                    </div>
                    <div class="col-sm-4">
                        <label class="form-label">Nhập mật khẩu mới </label>
                        <input id="password" type="password" class="form-control" name="newPassword" placeholder="" value="" required="true"/>
                    </div>

                    <div class="col-sm-4">
                        <label class="form-label">Cập nhật mật khẩu</label>
                        <input type="password" class="form-control" name="reTypeNewPassword" placeholder="" value="" required=true"/>
                    </div>
                </div>

                <hr class="my-4">

                <div class="row">
                    <div class="col-sm-5"></div>
                    <div class="col-sm-2">
                        <button class="w-100 btn btn-primary btn-lg" type="submit">Thay đổi mật khẩu</button>
                    </div>
                </div>

            </form>
        </div>
    </main>

</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
    $(document).ready(function () {
        $("#change-pass").validate({
            rules: {
                // simple rule, converted to {required:true}
                oldPassword: {
                    required: true
                },
                // compound rule
                newPassword: {
                    required: true,
                    minlength: 6
                },
                reTypeNewPassword: {
                    required: true,
                    minlength: 6
                }
            },
            /*messages:{
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
            },*/
            submitHandler: function() {
                //bước lấy dữ liệu từ form dựa vào html
                var data=  serialzeArrayToObject($("#change-pass"));
                /*alert("Submitted!")*/
                //submit form lên web thì sử dụng ajax
                $.ajax({
                    type: "POST",
                    url: "/user/change-password",
                    data: JSON.stringify(data),
                    contentType: "application/json",
                    dataType: "json",
                    success: function (response){
                        alert(response.data);
                    },
                    error: function (err){
                        alert("Thay đổi mật khẩu thất bại");
                    }
                });
            }
        });
    })
    function serialzeArrayToObject($form){
        var array=$form.serializeArray();
        var result={};
        for(var i=0; i<array.length;i++){
            if(array[i].name!=null && array[i].name!=undefined){
                result[array[i].name]=array[i].value;
            }
        }
        return result;
    }

</script>
</body>
</html>
