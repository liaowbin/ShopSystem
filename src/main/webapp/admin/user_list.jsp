<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>乐淘 - 后台管理</title>
    <%@ include file="common/resource.jsp"%>
</head>
<body>
    
    <%@ include file="common/aside.jsp"%>
    <!-- 主体 -->
    <div class="main">
        <div class="container-fluid">
            <%@ include file="common/header.jsp"%>
            <!-- 讲师列表 -->
            <div class="body user-list">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li><a href="javascript:;">用户管理</a></li>
                    <li class="active">用户列表</li>
                </ol>
                <div class="page-title">
                    <a href="admin/user_add.jsp" class="btn btn-success btn-sm pull-right">添加用户</a>
                </div>
                <div class="panel panel-default">
                    <div class="panel-body">
                        <div class="form-inline">
                            <div class="input-group">
                                <input type="text" id="search" class="form-control input-sm" placeholder="请输入要搜索的用户名">
                                <span class="input-group-btn">
                                    <button class="btn btn-success btn-sm" id="search-btn">搜索</button>
                                </span>
                            </div>
                        </div>
                    </div>
                    <table class="table table-striped table-bordered table-hover">
                        <thead>
                            <tr>
                                <th>编号</th>
                                <th>用户名</th>
                                <th>性别</th>
                                <th>手机号码</th>
                                <th>是否管理员</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${empty requestScope.page ? requestScope.userList : requestScope.page.items}" var="item">
                                <tr>
                                    <td>${item.id}</td>
                                    <td>${item.username}</td>
                                    <td>${item.sex}</td>
                                    <td>${item.phone}</td>
                                    <td>${item.userType == "1" ? '管理员' : "普通用户"}</td>
                                    <td>
                                        <a href="UserServlet?action=queryUser&id=${item.id}" class="btn btn-primary btn-xs">修改</a>
                                        <a href="UserServlet?action=deleteUser&id=${item.id}" class="delete btn btn-danger btn-xs">删除</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <%@ include file="common/page.jsp"%>
        </div>
    </div>
</body>
<script>
    $(".delete").click(function() {
        var name = $(this).parents("tr").find("td").eq(1).html();
        if (!confirm("您确定要删除" + name + "吗？")) {
            return false;
        }
    })
    $("#search-btn").click(function() {
        $("tbody td").remove();
        $.ajax({
            type: "POST",
            url: "UserServlet?action=search",
            data: {
                search: $("#search").val()
            },
            dataType: "json",
            success: function(data) {
                var html = '';
                data = data.data;
                if (data.length == 0) {
                    Dreamer.warning("没有找到相关用户！",true);
                    return;
                }
                for (let i = 0; i < data.length; i++) {
                    html += '<tr>' +
                        '<td>' + data[i].id + '</td>' +
                        '<td>' + data[i].username + '</td>' +
                        '<td>' + data[i].sex + '</td>' +
                        '<td>' + data[i].phone + '</td>' +
                        '<td>' + (data[i].userType == "1" ? '管理员' : "普通用户") + '</td>' +
                        '<td>' +
                            '<a href="UserServlet?action=queryUser&id=' + data[i].id + '" class="btn btn-primary btn-xs">修改</a>&nbsp;' +
                            '<a href="UserServlet?action=deleteUser&id=' + data[i].id + '" class="delete btn btn-danger btn-xs">删除</a>' +
                        '</td>' +
                        '</tr>';
                }
                $("tbody").append(html);
            }
        })
    })
</script>
</html>