<%--
  Created by IntelliJ IDEA.
  User: prave
  Date: 5/11/2022
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="common/header.jspf"%>
<%@include file="common/navigation.jspf"%>

<div class="container">
<form method="post">
    name: <input type="text" name="name"/>
    password: <input type="password" name="password">
    <input type="submit"/>

</form>
</div>
<%@ include file="common/footer.jspf" %>
