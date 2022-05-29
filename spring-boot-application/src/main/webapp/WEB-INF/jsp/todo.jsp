<%--
  Created by IntelliJ IDEA.
  User: prave
  Date: 5/11/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@include file="common/header.jspf"%>
<%@include file="common/navigation.jspf"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>


<div class="container">
    <form:form method="post" modelAttribute="todo" commandName="todo">
        <form:hidden path="id"/>
        <fieldset class="form-group">
            <form:label path="desc">Description</form:label>
            <form:input path="desc" name="desc" type="text"
                        class="form-control" required="required"/>
            <form:errors path="desc" cssClass="text-warning"/>

        </fieldset>
        <fieldset class="form-group">
            <form:label path="targetDate">Description</form:label>
            <form:input path="targetDate" type="text"
                        class="form-control" required="required"/>
            <form:errors path="targetDate" cssClass="text-warning"/>

        </fieldset>

        <button type="submit" class="btn btn-success">Add</button>
    </form:form>
</div>
<%@ include file="common/footer.jspf" %>
