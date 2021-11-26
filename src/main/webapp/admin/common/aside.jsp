<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/8
  Time: 13:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- 侧边栏 -->
<div class="aside">
    <!-- 个人资料 -->
    <div class="profile">
        <!-- 头像 -->
        <div class="avatar img-circle">
            <img src="admin/uploads/avatar.jpg">
        </div>
        <h4>${sessionScope.userInfo.username}</h4>
    </div>
    <!-- 导航菜单 -->
    <div class="navs">
        <ul class="list-unstyled">
            <li>
                <a href="admin/index.jsp" class="${sessionScope.tabActive == "index" ? "active" : ""}">
                    <i class="fa fa-dashboard"></i>
                    仪表盘
                </a>
            </li>
            <li>
                <a href="UserServlet?action=page" class="${sessionScope.tabActive == "user" ? "active" : ""}">
                    <i class="fa fa-group"></i>
                    用户管理
                </a>
            </li>
            <li>
                <a href="ClassifyServlet?action=page" class="${sessionScope.tabActive == "classify" ? "active" : ""}">
                    <i class="fa fa-indent"></i>
                    分类管理
<!--                    <i class="arrow fa fa-angle-right"></i>-->
                </a>
<!--                <ul class="list-unstyled">-->
<!--                    <li>-->
<!--                        <a href="admin/category.jsp">-->
<!--                            一级分类-->
<!--                        </a>-->
<!--                    </li>-->
<!--                    <li>-->
<!--                        <a href="admin/brand.jsp">-->
<!--                            二级分类-->
<!--                        </a>-->
<!--                    </li>-->
<!--                </ul>-->
            </li>
            <li>
                <a href="GoodsServlet?action=queryGoodsAll" class="${sessionScope.tabActive == "goods" ? "active" : ""}">
                    <i class="fa fa-cubes pull-left"></i>
                    商品管理
                </a>
            </li>
        </ul>
    </div>
</div>