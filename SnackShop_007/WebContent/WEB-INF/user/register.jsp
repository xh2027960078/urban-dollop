<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<link href="${pageContext.request.contextPath}/css/common.css" rel="stylesheet" type="text/css"/>
<link href="${pageContext.request.contextPath}/css/register.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="http://webapi.amap.com/maps?v=1.4.3&key=0ece8b3995ab2c2ca58fe0a284e94723&plugin=AMap.Geocoder"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/maps.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/libs/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/views/register.js"></script>

</head>
<body onload="regeocoder()">
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
<div class="container register">
		<div class="span24">
			<div class="wrap"  style="display: flex;justify-content: center;align-items: center;">
				<div class="main clearfix" style="background-color: #a4be53;border: none;">
					<div class="title">
						<strong>用户注册</strong>零零柒零食商城欢迎您的到来!
					</div>
					<form id="registerForm"  method="post" novalidate="novalidate" >
						<table >
							<tbody>
							<tr>
								<th>
									<span class="requiredField">*</span>用户名:
								</th>
								<td>
									<input type="text" id="uUsername" name="uUsername" class="text" maxlength="20">
									<span style="color:red" id="msg"></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>密&nbsp;&nbsp;码:
								</th>
								<td>
									<input type="password" id="uPassword" name="uPassword" class="text" maxlength="20" autocomplete="off">
                                    <span style="color:red" id="passmsg"></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>确认密码:
								</th>
								<td>
									<input type="password" name="rePassword" class="text" maxlength="20" autocomplete="off" id="rpassword">
                                     <span style="color:red" id="rpassmsg"></span>
								</td>
							</tr>
							<tr>
								<th>
									<span class="requiredField">*</span>E-mail:
								</th>
								<td>
									<input type="text" id="uEmail" name="uEmail" class="text" maxlength="200">
									 <span style="color:red" id="emailmsg"></span>
								</td>
							</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>姓名:
										</th>
										<td>
											<input type="text" id="uRealname" name="uRealname" class="text" maxlength="200">
											<span style="color:red" id="uRealnamemsg"></span>
										</td>
									</tr>
									
									<tr>
										<th>
											<span class="requiredField">*</span>性别:
										</th>
										<td>
											<input type="radio" id="man" name="sex" value="男"><label for="man">男</label>
											<input type="radio" id="woman" name="sex" value="女"><label for="woman">女</label>
											<span style="color:red" id="sexmsg"></span>
										</td>
									</tr>
									<tr>
										<th>
											<span class="requiredField">*</span>联系方式:
										</th>
										<td>
											<input type="text" id="uPhone" name="uPhone" class="text" maxlength="200">
											<span style="color:red" id="uPhonemsg"></span>
										</td>
									</tr>
									
									<tr>
										<th>
											<span class="requiredField">*</span>地址:
										</th>
										<td>
											<input type="text" id="addr" name="uAddress" class="text" maxlength="200">
											<!-- <span>已经根据您位置定位,如有错误请修改！</span> -->
										</td>
									</tr>
									<tr>
										<th>&nbsp;
										</th>
										<td>
											<input type="button" id="registerbtn" value="注册" id="button">
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