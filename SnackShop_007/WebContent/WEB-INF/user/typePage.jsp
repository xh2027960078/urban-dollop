<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>分类页面</title>
<link href="${pageContext.request.contextPath}/css/slider.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/common.css"
	rel="stylesheet" type="text/css" />
<link href="${pageContext.request.contextPath}/css/index.css"
	rel="stylesheet" type="text/css" />

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/libs/jquery.min.js"></script>
</head>
<body>
	<div class="container header">
		<div class="span24">
			<ul class="mainNav">
				<li>
					<a href="${pageContext.request.contextPath}/shop/index">首页</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/puffingType?type=2">膨化类</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/puffingType?type=1">肉制类</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/puffingType?type=3">饮料类</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/puffingType?type=6">进口类</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/puffingType?type=4">其他</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/sorder/gotocar?type=7">购物车</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/shop/userLoginGet?type=8">登录账号</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/user/userRegisterGet?type=9">注册账号</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/admin/login/adminLogin?type=10">管理员登录</a>
					|
				</li>
				<li>
					<a href="${pageContext.request.contextPath}/sorder/gotocar">购物车</a>
					|
				</li>
			</ul>
		</div>
	</div>

	<div class="container index">
		<div class="span24">
			<div id="hotProduct" class="hotProduct clearfix">
				<div class="title">
					<strong>${TypeSnackTitle}</strong>
				</div>
				<div class="tab" style="text-align: right;">
					<input type="hidden" value="${TypeNum}" id="TypeNum"> <input
						type="text" id="snackName"> <span id="typeSearch"
						style="font-size: 12px; cursor: pointer">搜索</span>
				</div>
				<ul class="tabContent" style="display: block;">
					<c:forEach items="${TypeSnackList}" var="list">
						<li style=""><a
							href="${pageContext.request.contextPath}/shop/proDatail?sId=${list.sId}">
								<img
								src="${pageContext.request.contextPath}/image/${list.sPictureurl}"
								style="display: block;" /> <span>${list.sName}<br /></span>
						</a> ￥${list.sPrice}</li>
					</c:forEach>
					<c:if test="${empty TypeSnackList}">
						<div style="font-size: 20px">没有搜索到哦!</div>
					</c:if>
				</ul>
			</div>
			<div class="friendLink"></div>
		</div>
	</div>
	<div class="container footer">
		<div class="span24">
			<div class="copyright">网上商城 版权所有</div>
		</div>
	</div>
</body>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/views/typePage.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/libs/common.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/views/productType.js"></script>
</html>