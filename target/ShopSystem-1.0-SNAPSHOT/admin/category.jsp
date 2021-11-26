<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>乐淘 - 后台管理</title>
    <%@ include file="common/resource.jsp" %>
</head>
<body>
    <%@ include file="common/aside.jsp"%>
    <!-- 主体 -->
    <div class="main">
        <div class="container-fluid">
            <!-- 头部 -->
            <%@ include file="common/header.jsp"%>
            <div class="body category">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li><a href="javascript:;">分类管理</a></li>
                    <li class="active">商品分类</li>
                </ol>
                <div class="page-title">
                    <a href="admin/category_add.jsp" class="btn btn-success btn-sm pull-right">添加分类</a>
                </div>
                <div class="panel panel-default">
                    <table class="table table-bordered table-striped">
                        <thead>
                            <tr>
                                <th width="10%">id</th>
                                <th>分类名称</th>
                                <th>是否显示</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${requestScope.page.items}" var="items">
                                <tr>
                                    <td>${items.id}</td>
                                    <td>${items.name}</td>
                                    <td>${items.isShow == 1 ? "是" : "否"}</td>
                                    <td>
                                        <a href="GoodsServlet?action=queryGoodsByClassifyId&classifyId=${items.id}" class="btn btn-success btn-xs">查看商品</a>
                                        <a href="ClassifyServlet?action=queryClassify&id=${items.id}" class="btn btn-primary btn-xs">修改</a>
                                        <a href="ClassifyServlet?action=deleteClassify&id=${items.id}" class="delete btn btn-danger btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%@ include file="common/page.jsp"%>
            </div>
        </div>
    </div>
</body>
</html>