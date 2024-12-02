<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Student</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
<div class="container mt-5">
    <c:if test="${not empty message}">
        <div class="alert alert-warning">${message}</div>
    </c:if>

    <button class="btn btn-primary" type="button" onclick="window.location.href='/students?action=add'">Create</button>
    <table class="table table-hover">
        <thead>
        <tr>
            <th>STT</th>
            <th>Name</th>
            <th>Score</th>
            <th>Classification</th>
            <th>DOB</th>
            <th>Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="student" items="${students}" varStatus="c">
            <tr>
                <td>${c.count}</td>
                <td>${student.name}</td>
                <td>${student.score}</td>
                <td>${student.classification}</td>
                <td>${student.dob}</td>
                <td>
                    <button class="btn btn-warning">Update</button>
                    <button class="btn btn-danger">Remove</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</html>
