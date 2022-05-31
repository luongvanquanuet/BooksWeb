<%@page pageEncoding="UTF-8" contentType="text/html; ISO-8859-1" language="java"%>
<!-- mã hóa dạng utf8-->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark" aria-label="Eighth navbar example">
    <div class="container">
        <a class="navbar-brand" href="#">BooksWeb</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarsExample07" aria-controls="navbarsExample07" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarsExample07">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/home">Trang chủ</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Loại Sách</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown07" data-bs-toggle="dropdown" aria-expanded="false">Sách</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown07">
                        <li><a class="dropdown-item" href="/book/add">Thêm mới</a></li>
                        <li><a class="dropdown-item" href="/book/list">Danh sách</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="dropdown07" data-bs-toggle="dropdown" aria-expanded="false">Tài khoản</a>
                    <ul class="dropdown-menu" aria-labelledby="dropdown07">
                        <li><a class="dropdown-item" href="/user/create">Thêm mới</a></li>
                        <li><a class="dropdown-item" href="/user/list">Danh sách</a></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="navbar-nav">

                <li class="nav-item dropdown">
                    <img class="nav-link dropdown-toggle" href="#" id="dropdown07" data-bs-toggle="dropdown" aria-expanded="false" src="/images/quan.jpg" width="50"></img>
                    <ul class="dropdown-menu" aria-labelledby="dropdown07">
                        <li><a class="dropdown-item" href="/user/<sec:authentication property="principal.id"></sec:authentication>">Thông tin tài khoản</a></li>
                        <li><a class="dropdown-item" href="/user/change-pass">Đổi mật khẩu</a></li>
                        <li><a class="dropdown-item" href="/logout">Thoát</a></li>
                    </ul>
                </li>
                
<%--                <li class="nav-item">
                    <a class="nav-link" aria-current="page"
                </li>--%>
            </ul>


            <form>
                <input class="form-control" type="text" placeholder="Tìm kiếm" aria-label="Search">
            </form>
        </div>
    </div>
</nav>