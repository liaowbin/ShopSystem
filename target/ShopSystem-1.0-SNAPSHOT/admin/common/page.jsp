<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2021/11/13
  Time: 21:24
  分页
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!-- 分页 -->
<ul class="pagination pull-right">
    <c:if test="${requestScope.page.pageNo > 1}">
        <li><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo - 1}">上一页</a></li>
    </c:if>
    <c:choose>
        <c:when test="${requestScope.page.pageTotal <= 5}">
            <c:set var="begin" value="1"></c:set>
            <c:set var="end" value="${requestScope.page.pageTotal}"></c:set>
            <%--                        <c:forEach begin="1" end="${requestScope.page.pageTotal}" var="i">--%>
            <%--                            <c:choose>--%>
            <%--                                <c:when test="${requestScope.page.pageNo == i}">--%>
            <%--                                    <li class="active"><a href="javascript:;">${i}</a></li>--%>
            <%--                                </c:when>--%>
            <%--                                <c:otherwise>--%>
            <%--                                    <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>--%>
            <%--                                </c:otherwise>--%>
            <%--                            </c:choose>--%>
            <%--                        </c:forEach>--%>
        </c:when>
        <c:otherwise>
            <c:choose>
                <c:when test="${requestScope.page.pageNo <= 3}">
                    <c:set var="begin" value="1"></c:set>
                    <c:set var="end" value="5"></c:set>
                    <%--                                <c:forEach begin="1" end="5" var="i">--%>
                    <%--                                    <c:choose>--%>
                    <%--                                        <c:when test="${requestScope.page.pageNo == i}">--%>
                    <%--                                            <li class="active"><a href="javascript:;">${i}</a></li>--%>
                    <%--                                        </c:when>--%>
                    <%--                                        <c:otherwise>--%>
                    <%--                                            <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>--%>
                    <%--                                        </c:otherwise>--%>
                    <%--                                    </c:choose>--%>
                    <%--                                </c:forEach>--%>
                </c:when>
                <c:when test="${requestScope.page.pageNo > requestScope.page.pageTotal - 3}">
                    <c:set var="begin" value="${requestScope.page.pageTotal - 4}"></c:set>
                    <c:set var="end" value="${requestScope.page.pageTotal}"></c:set>
                    <%--                                <c:forEach begin="${requestScope.page.pageTotal - 4}" end="${requestScope.page.pageTotal}" var="i">--%>
                    <%--                                    <c:choose>--%>
                    <%--                                        <c:when test="${requestScope.page.pageNo == i}">--%>
                    <%--                                            <li class="active"><a href="javascript:;">${i}</a></li>--%>
                    <%--                                        </c:when>--%>
                    <%--                                        <c:otherwise>--%>
                    <%--                                            <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>--%>
                    <%--                                        </c:otherwise>--%>
                    <%--                                    </c:choose>--%>
                    <%--                                </c:forEach>--%>
                </c:when>
                <c:otherwise>
                    <c:set var="begin" value="${requestScope.page.pageNo - 2}"></c:set>
                    <c:set var="end" value="${requestScope.page.pageNo + 2}"></c:set>
                    <%--                                <c:forEach begin="${requestScope.page.pageNo - 2}" end="${requestScope.page.pageNo + 2}" var="i">--%>
                    <%--                                    <c:choose>--%>
                    <%--                                        <c:when test="${requestScope.page.pageNo == i}">--%>
                    <%--                                            <li class="active"><a href="javascript:;">${i}</a></li>--%>
                    <%--                                        </c:when>--%>
                    <%--                                        <c:otherwise>--%>
                    <%--                                            <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>--%>
                    <%--                                        </c:otherwise>--%>
                    <%--                                    </c:choose>--%>
                    <%--                                </c:forEach>--%>
                </c:otherwise>
            </c:choose>
        </c:otherwise>
    </c:choose>
    <c:forEach begin="${begin}" end="${end}" var="i">
        <c:choose>
            <c:when test="${requestScope.page.pageNo == i}">
                <li class="active"><a href="javascript:;">${i}</a></li>
            </c:when>
            <c:otherwise>
                <li><a href="${requestScope.page.url}&pageNo=${i}">${i}</a></li>
            </c:otherwise>
        </c:choose>
    </c:forEach>
    <c:if test="${requestScope.page.pageNo < requestScope.page.pageTotal}">
        <li><a href="${requestScope.page.url}&pageNo=${requestScope.page.pageNo+ 1}">下一页</a></li>
    </c:if>
</ul>