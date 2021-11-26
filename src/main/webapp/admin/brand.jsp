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
            <div class="body category">
                <!-- 面包屑 -->
                <ol class="breadcrumb">
                    <li><a href="javascript:;">分类管理</a></li>
                    <li class="active">商品品牌</li>
                </ol>
                <div class="page-title">
                    <a href="./brand_add.html" class="btn btn-success btn-sm pull-right">添加品牌</a>
                </div>
                <div class="panel panel-default">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th width="10%">编号</th>
                                <th>品牌名称</th>
                                <th>品牌logo</th>
                                <td>商品数量</td>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>1</td>
                                <td>Nike</td>
                                <td></td>
                                <td>8</td>
                                <td>
                                    <a href="javascript:;" class="btn btn-info btn-xs">编 辑</a>
                                    <a href="javascript:;" class="btn btn-warning btn-xs">注 销</a>
                                </td>
                            </tr>
                            <tr>
                                <td>1</td>
                                <td>Nike</td>
                                <td></td>
                                <td>8</td>
                                <td>
                                    <a href="javascript:;" class="btn btn-info btn-xs">编 辑</a>
                                    <a href="javascript:;" class="btn btn-warning btn-xs">注 销</a>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>