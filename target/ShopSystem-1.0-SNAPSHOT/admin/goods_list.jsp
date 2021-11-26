<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>乐淘 - 后台管理</title>
    <%@ include file="common/resource.jsp" %>
    <style>
        tbody tr td:nth-child(3){
            max-width: 200px;
        }
        tbody tr td:nth-child(7){
            max-width: 300px;
        }
    </style>
</head>
<body>
    <%@ include file="common/aside.jsp"%>
    <!-- 主体 -->
    <div class="main">
        <div class="container-fluid">
            <%@ include file="common/header.jsp"%>
            <!-- 客户列表 -->
            <div class="body goods-list">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li><a href="javascript:;">商品管理</a></li>
                    <li class="active">商品列表</li>
                </ol>
                <div class="page-title">
                    <a href="admin/goods_add.jsp" class="btn btn-success btn-sm pull-right">添加商品</a>
                </div>
                <table class="table table-striped table-bordered table-hover">
                    <thead>
                    <tr>
                        <th>编号</th>
                        <th>封面</th>
                        <th>标题</th>
                        <th>价格</th>
                        <th>库存</th>
                        <th>分类</th>
                        <th>商品描述</th>
                        <th>操作</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.page.items}" var="item">
                        <tr>
                            <td>${item.id}</td>
                            <td>
                                <img src="admin/uploads/up/${item.img}" alt="" width="100" height="100">
                            </td>
                            <td>${item.title}</td>
                            <td>${item.price}</td>
                            <td>${item.stock}</td>
                            <td>${item.classifyName}</td>
                            <td>${item.describe}</td>
                            <td>
                                <a href="GoodsServlet?action=queryGoods&id=${item.id}" class="btn btn-primary btn-xs">修改</a>
                                <a href="GoodsServlet?action=deleteGoods&id=${item.id}" class="delete btn btn-danger btn-xs">删除</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <%@ include file="common/page.jsp"%>
            </div>
        </div>
    </div>

    <script src="./assets/jquery/jquery.min.js"></script>
    <script src="./assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="./assets/nprogress/nprogress.js"></script>
    <script src="./js/common.js"></script>
</body>
</html>