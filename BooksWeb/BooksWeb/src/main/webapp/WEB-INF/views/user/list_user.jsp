<%@page pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" language="java"%>
<!-- mã hóa dạng utf8-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<%--nhúng phần head import css và js--%>
<jsp:include page="/WEB-INF/views/common/head.jsp"></jsp:include>
<body>
<jsp:include page="/WEB-INF/views/common/nav.jsp"></jsp:include>
<div class="container">
    <main>
        <div class="py-5 text-center">
            <%--<img class="d-block mx-auto mb-4" src="/docs/5.0/assets/brand/bootstrap-logo.svg" alt="" width="72" height="57">--%>
            <h2>Danh sách tài khoản</h2>
            <br>
            <%--<p class="lead">Below is an example form built entirely with Bootstrap’s form controls. Each required form group has a validation state that can be triggered by attempting to submit the form without completing it.</p>--%>
        </div>
        <table class="table">
            <thead>
            <tr>
                <th scope="col">STT</th>
                <th scope="col">
                    <a href="/book/list?page=${currentPage}&sort=asc"><i class="bi bi-arrow-down-circle-fill"></i></a>
                    <a href="/book/list?page=${currentPage}&sort=desc"><i class="bi bi-arrow-up-circle-fill"></i></a>
                    Tên đăng nhập</th>
                <th scope="col">Tác giả</th>
                <th scope="col">Số trang</th>
                <th scope="col">Thao tác</th>

            </tr>
            </thead>
            <tbody>
            <c:set var="stt" value="1"></c:set>
            <c:forEach items="${data}" var="book">
                <tr>
                    <th scope="row">${stt}</th>
                    <td>${book.name}</td>
                    <td>${book.author}</td>
                    <td>${book.numberPage}</td>
                    <td><a href="/book/edit/${book.id}">Sửa</a></td>
                </tr>
                <c:set var="stt" value="${stt=stt+1}"></c:set>
            </c:forEach>
            </tbody>

        </table>
        <nav aria-label="...">
            <ul class="pagination">
                <li class="page-item <c:if test="${currentPage==1}">disabled</c:if>">
                    <a class="page-link" href="/book/list?page=${currentPage-1}" tabindex="-1" <c:if test="${currentPage==1}">aria-disabled="true"</c:if> >Trước</a>
                </li>
                <c:forEach begin="1" end="${totalPage}" var="page">
                    <li class="page-item <c:if test="${page==currentPage}">active</c:if>">
                        <a class="page-link" href="/book/list?page=${page}">${page}</a>
                    </li>
                </c:forEach>
                <li class="page-item <c:if test="${currentPage==totalPage}">disabled</c:if>">
                    <a <c:if test="${currentPage==totalPage}">aria-disabled="true"</c:if> class="page-link" href="/book/list?page=${currentPage+1}">Sau</a>
                </li>
            </ul>
        </nav>
    </main>
    <jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
</div>
</body>
</html>