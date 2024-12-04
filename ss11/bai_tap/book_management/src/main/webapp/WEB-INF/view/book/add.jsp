<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/2/2024
  Time: 3:18 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Library</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="/books">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/books">Book</a>
                </li>
            </ul>
            <form class="d-flex">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>
<div class="container mt-5">
    <form method="post">
        <div class="mb-3">
            <label for="inputTitle" class="form-label">title</label>
            <input type="text" class="form-control" name="title" id="inputTitle">
        </div>
        <div class="mb-3">
            <label for="inputPageSize" class="form-label">PageSize</label>
            <input type="number" class="form-control" name="pageSize" id="inputPageSize" >
        </div>
        <div class="mb-3">
            <label for="inputAuthor" class="form-label">Author</label>
            <input type="text" class="form-control" name="author" id="inputAuthor" >
        </div>
        <div class="mb-3">
            <label for="inputCategory" class="form-label">Category</label>
            <input type="text" class="form-control" name="category" id="inputCategory" >
        </div>
        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
