<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/8
  Time: 13:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String baseUrl = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/";
%>

<base href="<%= baseUrl%>">

<link rel="stylesheet" href="admin/assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="admin/assets/font-awesome/css/font-awesome.css">
<!--<link rel="stylesheet" href="admin/assets/nprogress/nprogress.css">-->
<link rel="stylesheet" href="admin/css/index.css">


<script src="admin/assets/jquery/jquery.min.js"></script>
<script src="admin/js/dreamMsg.min.js"></script>
<script src="admin/assets/bootstrap/js/bootstrap.min.js"></script>
<!--<script src="admin/assets/nprogress/nprogress.js"></script>-->
<script src="admin/js/common.js"></script>
