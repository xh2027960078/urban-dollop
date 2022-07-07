<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>会员登录</title>

    <link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
    <link href="${pageContext.request.contextPath}/css/login.css" rel="stylesheet" type="text/css"/>

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
<div class="container login" style="display: flex;justify-content: center;align-items: center">
    <div class="span12 last">
        <div class="wrap">
            <div class="main">
                <div class="title">
                    <strong>会员登录</strong>USER LOGIN
                </div>
                <form id="loginForm" method="post" novalidate="novalidate"
                      action="${pageContext.request.contextPath}/shop/userLoginPost">
                    <table>
                        <tbody>
                        <tr>
                            <span style="margin-left: 20px;">${msg}</span>
                            <th>
                                用户名/E-mail:
                            </th>
                            <td>
                                <input type="text" id="uUsername" name="uUsername" class="text" maxlength="20"/>

                            </td>
                        </tr>
                        <tr>
                            <th>
                                密&nbsp;&nbsp;码:
                            </th>
                            <td>
                                <input type="password" id="uPassword" name="uPassword" class="text" maxlength="20"
                                       autocomplete="off"/>
                            </td>
                        </tr>


                        <tr>
                            <th>&nbsp;

                            </th>
                            <td>
                                <input type="submit" class="submit" value="登 录"/>
                            </td>
                        </tr>
                        <tr class="register">
                            <th>&nbsp;

                            </th>
                            <td>
                                <dl>
                                    <dt>还没有注册账号？</dt>
                                    <dd>
                                        立即注册即可体验在线购物！
                                        <a href="${pageContext.request.contextPath}/user/userRegisterGet">立即注册</a>
                                    </dd>
                                </dl>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form>
            </div>
        </div>
    </div>
</div>
<div class="container footer">
    <div class="span24">
        <div class="copyright">零零柒商城 版权所有</div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</body>
</html>