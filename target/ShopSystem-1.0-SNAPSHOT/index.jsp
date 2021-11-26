<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
    <c:when test="${empty sessionScope.userInfo}">
        <jsp:forward page="admin/login.jsp"></jsp:forward>
    </c:when>
    <c:otherwise>
        <jsp:forward page="admin/index.jsp"></jsp:forward>
    </c:otherwise>
</c:choose>