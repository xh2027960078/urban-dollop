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
    <div class="span5">
        <div class="logo">
            <img id="logoPic" src="${pageContext.request.contextPath}/image/trimImg/snackBZ.jpg" style="display: block;"
                 alt="食尚零食"/>
        </div>
    </div>
    <div class="span9">
        <div class="headerad">
            <img src="${pageContext.request.contextPath}/image/header.jpg" width="320" height="50" alt="正品保障"
                 title="正品保障"/>
        </div>
    </div>
    <div class="span24">
        <div id="newProduct" class="newProduct clearfix">
            <div class="title">
                <strong>最新商品</strong>
            </div>
            <ul class="tab">
            </ul>
            <ul class="tabContent" style="display: block;">
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
            </ul>
        </div>
        <div class="friendLink">
        </div>
    </div>
</div>
<div class="container">
    <div style="width: 100%;float: left;">
        <div style="width: 20%;height:500px;float: left;background-image:url(${pageContext.request.contextPath}/image/userBG.jpg)">
            <table cellSpacing="0" cellPadding="0" width="170" border="0">
                <tr>
                    <td valign="top" align="middle">
                        <table cellSpacing=0 cellPadding=0 width=150 border=0>
                            <tr height=22>
                                <td style="PaDDING-LEFT: 30px">
                                    <a class="menuParent" onclick='expand(1)' href="javascript:void(0);"
                                       style="font-size: 20px">账户中心</a>
                                </td>
                            </tr>
                        </table>
                        <table id=child1 style="DISPLaY: block;" cellSpacing=0 cellPadding=0 width=150 border=0>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color: red;margin-left: 35px;"
                                       href="${pageContext.request.contextPath}/user/userInfo" target="right">个人中心</a>
                                </td>
                            </tr>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color: red;margin-left: 35px"
                                       class="menuChild" href="${pageContext.request.contextPath}/user/userGoOrder"
                                       target="right">我的订单</a>
                                </td>
                            </tr>
                            <tr height=20>
                                <td>
                                    <a style="cursor: pointer;font-size: 15px;color: red;margin-left: 35px"
                                       class="menuChild"
                                       href="${pageContext.request.contextPath}/user/userGoSuccessOrder" target="right">历史订单</a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
        <iframe frameborder="1" height="550px" width="80%" scrolling="no" name="right">
        </iframe>
    </div>
</div>
<div class="container footer" style="position: relative;bottom: 0px ">
    <div class="copyright">零零柒商城 版权所有</div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/personalInfo.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</body>
</html>