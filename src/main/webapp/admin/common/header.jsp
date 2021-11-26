<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/8
  Time: 14:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 头部 -->
<div class="header">
    <nav class="navbar navbar-custom">
        <div class="navbar-header">
            <a href="javascript:;" class="navbar-brand">
                <i class="fa fa-navicon"></i>
            </a>
        </div>
        <ul class="nav navbar-nav navbar-right">
<!--            <li>-->
<!--                <a href="admin/settings.jsp">-->
<!--                    <i class="fa fa-user"></i>-->
<!--                    个人中心-->
<!--                </a>-->
<!--            </li>-->
            <li>
                <a href="UserServlet?action=logout">
                    <i class="fa fa-sign-out"></i>
                    退出
                </a>
            </li>
<!--            <li>-->
<!--                <a href="javascript:;">-->
<!--                    <i class="fa fa-tasks"></i>-->
<!--                </a>-->
<!--            </li>-->
        </ul>
    </nav>
</div>