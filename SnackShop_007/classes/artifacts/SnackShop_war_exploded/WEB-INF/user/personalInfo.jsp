<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//Dtd HTML 4.01 transitional//EN" "http://www.w3.org/tr/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>个人中心</title>
    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/leftMune.css" rel="stylesheet" type="text/css"/>

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
        <c:if test="${sessionScope.frontuser!=null}">
            <li class="personalInfo">
                <a href="${pageContext.request.contextPath}/user/userPersonalInfo">会员中心</a>
            </li>
        </c:if>
        <c:if test="${sessionScope.frontuser==null}">
            <li class="personalInfo">
                <a href="${pageContext.request.contextPath}/shop/userLoginGet">会员中心</a>
            </li>
        </c:if>
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
<div class="container">
    <div style="width: 100%;float: left;">
        <div style="width: 10%;height:640px;float: left;background-color: #1E6BAE">
            <table cellSpacing="0" cellPadding="0" width="170" border="0">
                <tr>
                    <td valign="top" align="middle">
                        <table id=child1 style="DISPLaY: block;" cellSpacing=0 cellPadding=0 width=150 border=0>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color: white;margin-left: 35px;"
                                       href="${pageContext.request.contextPath}/user/userInfo" target="right">个人中心</a>
                                </td>
                            </tr>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color: white;margin-left: 35px"
                                       class="menuChild" href="${pageContext.request.contextPath}/user/userGoOrder"
                                       target="right">我的订单</a>
                                </td>
                            </tr>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color:white;margin-left: 35px;background-color: #1E6BAE;
                                       href="${pageContext.request.contextPath}/user/userGoSuccessOrder" target="right">历史订单</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <iframe frameborder="1" height="550px" width="90%" scrolling="no" name="right">
        </iframe>
    </div>
</div>
<div class="container footer">
    <div class="span24">
        <div class="copyright">零零柒商城 版权所有</div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/personalInfo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</body>
</html>