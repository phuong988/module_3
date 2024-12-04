<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 12/2/2024
  Time: 4:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h3>book</h3>
<table border="1">
    <tr>
        <td>id</td>
        <td>${book.id}</td>
    </tr>
    <tr>
        <td>title</td>
        <td>${book.title}</td>
    </tr>
    <tr>
        <td>Page Size</td>
        <td>${book.pageSize}</td>
    </tr>
    <tr>
        <td>Author</td>
        <td>${book.author}</td>
    </tr>
    <tr>
        <td>category</td>
        <td>${book.category}</td>
    </tr>
</table>
</body>
</html>
