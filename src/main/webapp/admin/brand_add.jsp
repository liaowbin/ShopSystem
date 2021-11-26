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
                    <li class="active">添加品牌</li>
                </ol>
                <div class="category-add">
                    <form action="" class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">品牌 logo</label>
                            <div class="col-xs-1 preview">
                                <img src="./images/default.png">
                                <input type="file" id="upfile">
                                <div class="cover">
                                    <i class="fa fa-upload"></i>                  
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">名称</label>
                            <div class="col-xs-3">
                                <input type="text" class="form-control input-sm" placeholder="填写品牌名称">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">级别</label>
                            <div class="col-xs-2">
                                <select name="" class="form-control input-sm">
                                    <option value="">所属分类</option>
                                    <option value="">前端开发</option>
                                    <option value="">后端开发</option>
                                    <option value="">数据库</option>
                                    <option value="">视觉设计</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-4 control-label">是否热门</label>
                            <div class="col-xs-3">
                                <label class="checkbox-inline">
                                    <input type="checkbox" checked> 是
                                </label>
                                <label class="checkbox-inline">
                                    <input type="checkbox"> 否
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-8">
                                <a href="javascript:;" class="btn btn-success btn-sm pull-right">保存</a>
                            </div>                          
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>