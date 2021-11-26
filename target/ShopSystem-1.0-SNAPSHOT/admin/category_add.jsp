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
                    <form action="ClassifyServlet?action=${empty requestScope.classify ? 'addClassify' : 'updateClassify'}" method="post" class="form-horizontal col-xs-offset-2">
                        <c:if test="${requestScope.classify != null }">
                            <input type="hidden" name="id" value="${requestScope.classify.id}">
                        </c:if>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">类别名称</label>
                            <div class="col-xs-4">
                                <input type="text" class="form-control input-sm" placeholder="类别名称" name="name" value="${requestScope.classify.name}">
                            </div>
                            <span style="line-height: 30px;color: red;font-size: 12px;"></span>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">是否显示</label>
                            <div class="col-xs-2">
                                <select name="isShow" class="form-control input-sm">
                                    <c:if test="${requestScope.get(\"classify\").isShow == 1 || empty requestScope.get(\"classify\")}">
                                        <option value="0">否</option>
                                        <option value="1" selected>是</option>
                                    </c:if>
                                    <c:if test="${requestScope.get(\"classify\").isShow == 0}">
                                        <option value="0" selected>否</option>
                                        <option value="1">是</option>
                                    </c:if>
                                </select>
                            </div>
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
</html>