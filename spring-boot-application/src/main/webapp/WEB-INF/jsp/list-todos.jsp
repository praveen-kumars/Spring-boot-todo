<%--
  Created by IntelliJ IDEA.
  User: prave
  Date: 5/11/2022
  Time: 12:51 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="common/header.jspf"%>
<%@include file="common/navigation.jspf"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<H1>TODO LIST</H1>

<div class="container">
<table class="table table-striped">
    <caption>todos are</caption>
    <thead>
    <tr>
        <th>Description</th>
        <th>TargetDate</th>
        <th> Is it done?</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${todos}" var="todo">


    <tr>
        <td>${todo.desc}</td>
        <td><fmt:formatDate pattern="dd/MM/yyyy"
                            value="${todo.targetDate}" /></td>
        <td>${todo.done}</td>
        <td><a type="button" class="btn btn-success" href="/update-todo?id=${todo.id}">Update ${todo.id}</a> </td>
        <td><a type="button" class="btn btn-warning" href="/delete-todo?id=${todo.id}">Delete ${todo.id}</a> </td>
    </tr>
    </c:forEach>
    </tbody>
</table>

<br/>
    <div>
    <a class="button" href="/add-todo">add a todo</a></div>

<br/>

<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
    <script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
    <script>
        $('#targetDate').datepicker({
            format : 'dd/mm/yyyy'
        });
    </script>
</div>
<%@ include file="common/footer.jspf" %>
