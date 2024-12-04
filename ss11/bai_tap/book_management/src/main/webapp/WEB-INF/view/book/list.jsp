<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/2/2024
  Time: 3:17 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- Option 1: Include in HTML -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
</head>
<body>
<%--JSP:include--%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Book Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/books">Book</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit" onclick="window.location.href='/books?action=search'">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <button class="btn btn-primary" type="button" onclick="window.location.href='/books?action=add'">Create</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>Title</th>
            <th>Page Size</th>
            <th>Author</th>
            <th>Category</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <%--        for(Student student: students)--%>
        <c:forEach var="book" items="${books}" varStatus="c">
            <tr>
                <td>${c.count}</td>
                <td>${book.title}</td>
                <td>${book.pageSize}</td>
                <td>${book.author}</td>
                <td>${book.category}</td>
                <td>
                    <button onclick="update(${book})" type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#updateModal">Update</button>
                    <!-- Modal update-->
                    <div class="modal fade" id="updateModal" tabindex="-1" aria-labelledby="updateModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <form action="books?action=update" method="post">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h1 class="modal-title fs-5" id="updateModalLabel">Sửa người dùng</h1>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        <input type="hidden" name="id" id="id">
                                        <input type="text" name="title" id="title" class="form-control" required placeholder="Tiêu đề">
                                        <input type="number" name="pageSize" id="pageSize" class="form-control" required placeholder="Số trang">
                                        <input type="text" name="author_name" id="author_name" class="form-control" required placeholder="Tác giả">
                                        <input type="text" name="category_name" id="category_name" class="form-control" required placeholder="Loại sách">
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Đóng</button>
                                        <button type="submit" class="btn btn-primary">Cập nhật</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>

                    <button class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#exampleModal${book.id}">Remove</button>

                    <!-- Modal delete-->
                    <div class="modal fade" id="exampleModal${book.id}" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Delete book</h5>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body">
                                    Do you want to delete this book has title is ${book.title}?
                                    <div style="color: red; font-style: italic">
                                        This action cannot be undone!
                                    </div>
                                </div>

                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                                    <button type="button" class="btn btn-primary"  onclick="window.location.href='/books?action=delete&id=${book.id}'">Confirm</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
<script>
    function update(book) {
        document.getElementById("id").value = book.id;
        document.getElementById("title").value = book.title;
        document.getElementById("pageSize").value = book.pageSize;
        document.getElementById("author_name").value = book.author;
        document.getElementById("category_name").value = book.category;
    }
</script>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
