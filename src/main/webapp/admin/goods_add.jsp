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
            <!-- 讲师资料 -->
            <div class="body">
                <div class="goods-add">
                    <form action="GoodsServlet?action=${empty requestScope.goods ? "addGoods" : "updateGoods"}" method="post" class="form-horizontal" enctype="multipart/form-data">
                        <c:if test="${requestScope.goods != null}">
                            <input type="hidden" name="id" value="${requestScope.goods.id}">
                            <input type="hidden" name="imgName" value="${requestScope.goods.img}">
                        </c:if>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">商品封面</label>
                            <div class="col-xs-2 preview">
                                <c:choose>
                                    <c:when test="${empty requestScope.goods}">
                                        <img src="admin/images/default.png" id="cover" height="100%">
                                    </c:when>
                                    <c:otherwise>
                                        <img src="admin/uploads/up/${requestScope.goods.img}" id="cover" height="100%">
                                    </c:otherwise>
                                </c:choose>
                                <input type="file" id="upfile" name="img">
                                <div class="cover">
                                    <i class="fa fa-upload"></i>                  
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">商品名称</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm" name="title" value="${requestScope.goods.title}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">所属品牌</label>
                            <div class="col-xs-5">
                                <select name="classifyId" id="classify" class="form-control input-sm"></select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">商品价格</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm" name="price" value="${requestScope.goods.price}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">库存量</label>
                            <div class="col-xs-5">
                                <input type="text" class="form-control input-sm" name="stock" value="${requestScope.goods.stock}">
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="" class="col-xs-3 control-label">商品描述</label>
                            <div class="col-xs-5 ckeditor">
                                <textarea id="describe" name="describe" rows="5" class="form-control input-sm" name="describe"></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-xs-8">
                                <input type="submit" class="btn btn-success btn-sm pull-right" value="保 存">
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

        // 修改时回显textarea数据
        $("#describe").val("${requestScope.goods.describe}");

        // 用户选完图片就立即显示
        $("#upfile").change(function(e) {
            var file = e.target.files[0];
            if (window.FileReader) {
                var fr = new FileReader();
                fr.onloadend = function(e) {
                    $("#cover").attr("src", e.target.result);
                    // document.getElementById("portrait").src = e.target.result;
                };
                fr.readAsDataURL(file);
            }
        })

        // 查询出所有分类
        $.ajax({
            type: "POST",
            url: "GoodsServlet?action=queryAllClassify",
            data: {},
            dataType: "json",
            success: function(data) {
                var html = '';
                for (let i = 0; i < data.classify.length; i++) {
                    if ("${requestScope.goods.classifyId}" == data.classify[i].id) {
                        html += '<option value="' + data.classify[i].id + '" selected="selected">' + data.classify[i].name + '</option>'
                    }else {
                        html += '<option value="' + data.classify[i].id + '">' + data.classify[i].name + '</option>'
                    }
                }
                $("#classify").append(html);
            }
        })
    })
</script>
</html>