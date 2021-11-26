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
            <%@ include file="common/header.jsp"%>
            <div class="body user">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li><a href="javascript:;">用户管理</a></li>
                    <li class="active">用户添加</li>
                </ol>
                <div class="user-add">
                    <form action="UserServlet?action=${empty requestScope.user ? 'addUser' : 'updateUser'}" method="post" class="form-horizontal col-xs-offset-2">
                        <c:if test="${requestScope.user != null }">
                            <input type="hidden" name="id" value="${requestScope.user.id}">
                        </c:if>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">姓名</label>
                            <div class="col-xs-4">
                                <input type="text" id="username" class="form-control input-sm" placeholder="用户名称" name="username" value="${requestScope.user.username}">
                            </div>
                            <span style="line-height: 30px;color: red;font-size: 12px;"></span>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">密码</label>
                            <div class="col-xs-4">
                                <input type="password" class="form-control input-sm" name="password">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">手机号码</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control input-sm" name="phone" value="${requestScope.user.phone}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">类型</label>
                            <div class="col-xs-2">
                                <select name="userType" class="form-control input-sm">
                                    <c:if test="${requestScope.get(\"user\").userType == \"1\" || empty requestScope.get(\"user\")}">
                                        <option value="0">普通</option>
                                        <option value="1" selected>管理员</option>
                                    </c:if>
                                    <c:if test="${requestScope.get(\"user\").userType == \"0\"}">
                                        <option value="0" selected>普通</option>
                                        <option value="1">管理员</option>
                                    </c:if>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">性别</label>
                            <c:choose>
                                <c:when test="${requestScope.get(\"user\") != null}">
                                    <div class="col-xs-4">
                                        <label class="radio-inline">
                                            <c:choose>
                                                <c:when test="${requestScope.get(\"user\").sex == \"男\"}">
                                                    <input type="radio" name="sex" data-test="sass" value="男" checked> 男
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="radio" name="sex" value="男"> 男
                                                </c:otherwise>
                                            </c:choose>
                                        </label>
                                        <label class="radio-inline">
                                            <c:choose>
                                                <c:when test="${requestScope.get(\"user\").sex == \"女\"}">
                                                    <input type="radio" name="sex" value="女" checked> 女
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="radio" name="sex" value="女"> 女
                                                </c:otherwise>
                                            </c:choose>
                                        </label>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="col-xs-4">
                                        <label class="radio-inline">
                                            <input type="radio" name="sex" value="男" checked> 男
                                        </label>
                                        <label class="radio-inline">
                                            <input type="radio" name="sex" value="女"> 女
                                        </label>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-7">
                                <input type="submit" class="btn btn-success btn-sm pull-right" value="添 加">
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    $(function(){
        $("#username").blur(function(){
            $.ajax({
                type: "POST",
                url: "UserServlet?action=queryNameIsUsable",
                data: {
                    username: $(this).val()
                },
                dataType: "json",
                success: function(data){
                    data.name ? $("#username").parent().siblings("span").text("用户名可用") : $("#username").parent().siblings("span").text("用户名不可用");
                }
            });
        })
    })
</script>
</html>