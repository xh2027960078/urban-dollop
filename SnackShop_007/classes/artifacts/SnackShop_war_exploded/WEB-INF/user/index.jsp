<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>零零柒零食商城首页</title>
    <link href="${pageContext.request.contextPath}/css/slider.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/jquery.min.js"></script>
</head>
<body>
<div class="container header">
    <%--    <div class="span24">--%>
    <ul class="mainNav" style="display: flex; justify-content: space-between">
        <li>
            <a href="${pageContext.request.contextPath}/shop/index">首页</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/puffingType?type=2">膨化类</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/puffingType?type=1">肉制类</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/puffingType?type=3">饮料类</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/puffingType?type=6">进口类</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/shop/puffingType?type=4">其他</a>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/sorder/gotocar?type=7">购物车</a>
        </li>
        <li>
            <c:if test="${sessionScope.frontuser==null}">
                <a href="${pageContext.request.contextPath}/shop/userLoginGet?type=8">登录</a>
            </c:if>
            <c:if test="${sessionScope.frontuser!=null}">
                <a href="javascript:void()">欢迎:${sessionScope.frontuser}</a>
            </c:if>
        </li>
        <li>
            <c:if test="${sessionScope.frontuser==null}">
                <a href="${pageContext.request.contextPath}/user/userRegisterGet?type=9">注册账号</a>
            </c:if>
            <c:if test="${sessionScope.frontuser!=null}">

            </c:if>
        </li>
        <li>
            <a href="${pageContext.request.contextPath}/admin/login/adminLogin?type=10">管理员登录</a>
        </li>
        <li>
            <c:if test="${sessionScope.frontuser==null}">
            </c:if>
            <c:if test="${sessionScope.frontuser!=null}">
                <a href="${pageContext.request.contextPath}/shop/userlogout">注销账号</a>
            </c:if>
        </li>
    </ul>
    <%--    </div>--%>
</div>

<div class="container index">
    <div class="span24">
        <div id="hotProduct" class="hotProduct clearfix">
            <%--            <div class="title"><h4 style="color: white;font-size: 20px;">精选商品</h4>--%>
            <%--            </div>--%>
            <div class="tab" style="width: 100%;background-color: #1E6BAE">
                <div style="text-align: left;color: white;font-size: 20px;" class="title"><strong>精选商品</strong></div>
                <div style="text-align: right;"><input type="hidden" value="${TypeNum}" id="TypeNum">
                    <input type="text" id="snackName">
                    <span id="typeSearch" style="font-size: 12px; cursor: pointer;color: white">搜索</span></div>

            </div>
            <ul class="tabContent" style="display: block;position: relative;top: 10px;width: 100%">
                <c:forEach items="${newSnackList}" var="list">
                    <li style="price-text">
                        <a href="${pageContext.request.contextPath}/shop/proDatail?sId=${list.sId}">
                            <img src="${pageContext.request.contextPath}/image/${list.sPictureurl}"
                                 style="display: block;"/>
                            <span>${list.sName}<br/></span>
                        </a>
                        ￥${list.sPrice}
                    </li>
                </c:forEach>
                <c:if test="${empty newSnackList}">
                    <div style="font-size: 20px">没有搜索到哦!</div>
                </c:if>
            </ul>
        </div>
    </div>
</div>

<div class="container footer" style="position: relative;bottom: 0px ">
    <div class="copyright">零零柒商城 版权所有</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/index.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</body>
</html>