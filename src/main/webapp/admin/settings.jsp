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
            <!-- 讲师资料 -->
            <div class="body">
                <div class="settings">
                    <form action="" class="form-horizontal">
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">姓名</label>
                            <div class="col-xs-5">
                                <p class="form-control-static">某某某</p>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">头像</label>
                            <div class="col-xs-2 preview">
                                <img src="./images/default.png">
                                <input type="file" id="upfile">
                                <div class="cover">
                                    <i class="fa fa-upload"></i>                  
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">昵称</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">性别</label>
                            <div class="col-xs-3">
                                <label class="radio-inline">
                                    <input type="radio" checked> 男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio"> 女
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">出生日期</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">籍贯</label>
                            <div class="col-xs-5">
                                <select name="" class="form-control input-sm">
                                    <option value="">河北省</option>
                                    <option value="">山东省</option>
                                    <option value="">北京市</option>
                                </select>
                                <select name="" class="form-control input-sm">
                                    <option value="">河北省</option>
                                    <option value="">山东省</option>
                                    <option value="">北京市</option>
                                </select>
                                <select name="" class="form-control input-sm">
                                    <option value="">河北省</option>
                                    <option value="">山东省</option>
                                    <option value="">北京市</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">手机号码</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">电子邮箱</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">入职日期</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">个人介绍</label>
                            <div class="col-xs-5 ckeditor">
                                <textarea name="" rows="15" class="form-control input-sm"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-8">
                                <a href="./course_add_step2.html" class="btn btn-success btn-sm pull-right">保 存</a>
                                <a href="./repass.html" class="btn btn-link btn-sm pull-right">更改密码？</a>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>