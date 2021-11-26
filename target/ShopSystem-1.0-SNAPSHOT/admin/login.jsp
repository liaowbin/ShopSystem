<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>乐淘 - 后台管理</title>
    <%@ include file="common/resource.jsp" %>
</head>
<body>
    <!-- 登录 -->
    <div class="login">
        <div class="login-wrap">
            <div class="avatar">
                <img src="admin/uploads/monkey.png" class="img-circle" alt="">
            </div>
            <form action="UserServlet?action=login" method="post" class="col-xs-offset-1 col-xs-10">
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">
                        <i class="fa fa-user"></i>
                    </span>
                    <input type="text" class="form-control" placeholder="用户名" name="username" value="${sessionScope.userInfo.username}">
                </div>
                <div class="input-group input-group-lg">
                    <span class="input-group-addon">
                        <i class="fa fa-key"></i>
                    </span>
                    <input type="password" class="form-control" placeholder="密码" name="password" value="${sessionScope.userInfo.password}">
                </div>
<!--                <div class="input-group input-group-lg">-->
<!--                    <span class="input-group-addon">-->
<!--                        <i class="fa fa-code"></i>-->
<!--                    </span>-->
<!--                    <div class="col-sm-8">-->
<!--                        <input type="text" class="form-control col-lg-7" placeholder="验证码">-->
<!--                    </div>-->
<!--                    <div class="col-sm-4">-->
<!--                        <img src="admin/images/code.bmp" class="col-lg-3" alt="" style="height: 46px">-->
<!--                    </div>-->
<!--                </div>-->
                <button type="submit" class="btn btn-lg btn-primary btn-block">登 录</button>
            </form>
        </div>
    </div>
</body>
</html>