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
                    <h2>Thêm sách</h2>
                    <br>
                    <c:if test="${message !=null}"><span style="color:red">${message}</span> </c:if>

                </div>

                <div class="row g-5">
                    <div class="col-md-2 col-lg-2"></div>
                    <div class="col-md-8 col-lg-8">
                        <form:form modelAttribute="book" class="needs-validation" enctype="multipart/form-data" novalidate="" action="/book/save" method="post">
                            <form:input path="id" type="hidden"></form:input>
                            <form:input path="publisherId" type="hidden"></form:input>
                            //hidden :khong cho phep sua id
                            <div class="row g-3">
                                <div class="col-sm-6">
                                    <label for="name" class="form-label">Tên sách</label>
                                    <form:input type="text" class="form-control" id="name" placeholder="" value="" required="" path="name"/>
                                    <form:errors path="name" class="error" />
                                </div>

                                <div class="col-sm-6">
                                    <label for="author" class="form-label">Tác giả</label>
                                    <form:input type="text" class="form-control" id="author" path="author" placeholder="" value="" required="" />
                                    <form:errors path="author" class="error" />
                                </div>

                                <%--<div class="col-4">
                                    <label for="publisher" class="form-label">Tên NXB</label>
                                    <div class="input-group has-validation">
                                        <form:input type="text" class="form-control" id="publisher" path="publisher" placeholder="Nhà xuất bản" required=""></form:input>
                                        <form:errors path="publisher" class="error" />
                                    </div>
                                </div>

                                <div class="col-4">
                                    <label for="publisher" class="form-label">Địa chỉ NXB</label>
                                    <div class="input-group has-validation">
                                        <form:input type="text" class="form-control" id="address" path="address" placeholder="Địa chỉ NXB" required=""></form:input>
                                    </div>
                                </div>

                                <div class="col-4">
                                    <label for="publisher" class="form-label">Số đt NXB</label>
                                    <div class="input-group has-validation">
                                        <form:input type="text" class="form-control" id="phone" path="phone" placeholder="Số đt NXB" required=""></form:input>
                                    </div>
                                </div>--%>

                                <div class="col-12">
                                    <label for="numberPage" class="form-label">Số trang </label>
                                    <form:input type="number" class="form-control" path="numberPage" id="numberPage" placeholder="Số trang"></form:input>
                                    <form:errors path="numberPage" class="error" />
                                </div>
                                <div class="col-md-5">
                                    <label for="language" class="form-label">Ngôn ngữ</label>
                                    <form:select class="form-select" path="language" id="language" required="" >
                                        <form:option value="">Chọn ngôn ngữ...</form:option>
                                        <form:option value="vi">Tiếng Việt</form:option>
                                        <form:option value="en">United States</form:option>
                                    </form:select>
                                    <div class="invalid-feedback">
                                        Please select a valid country.
                                    </div>
                                </div>
<%--                                <div class="col-md-7">
                                    <label for="language" class="form-label">upload ảnh</label>
                                    <form:input type="file" path="images" multiple="multiple"/>
                                    <form:errors path="images" class="error" />
                                    </div>
                                </div>--%>

                            <div class="col-md-12">
                                <label class="form-label">Image</label>
                                <c:forEach items="${book.bookImages}" var="book">
                                    <img src="/book-image/${book.path}"/>
                                </c:forEach>
                            </div>

                            </div>
                                <hr class="my-4">
                                <hr class="my-4">
                            <button class="w-100 btn btn-primary btn-lg" type="submit">Thêm sách</button>
                        </form:form>
                    </div>
                </div>
            </main>
            <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
    </body>
</html>