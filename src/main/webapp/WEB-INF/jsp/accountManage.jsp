<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户登录</title>
<link href="<%=request.getContextPath()%>/skin/css/style.css" rel='stylesheet' type='text/css' />
<link href="<%=request.getContextPath()%>/skin/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.text{
		margin-top: 0px !important;
	}
	img{
		margin: 10px !important;
	}
	.icon{
		font-size: 30px;
		top: 5px;
		right: -35px;
	}
	.signin input{
		font-size: 24px;
		padding: 7px;
	}
	.login-form{
		background-color: #ffffff;
	}
</style>
</head>
<body background="url('<%=request.getContextPath()%>/skin/images/bg1.jpg')">
	<h1 style="color: #7b7474">长途汽车站信息管理系统</h1>
	<div class="login-form">
		<div class="close"></div>
		<div class="head-info">
			<label class="lbl-3"> </label>
		</div>
		<div class="clear"></div>
		<div class="avtar">
			<img src="<%=request.getContextPath()%>/skin/images/logo.jpg" />
		</div>
		<form action="<%=request.getContextPath() %>/bus/userLogin" method="post">
			<div>
				<span class="icon glyphicon glyphicon-user"></span>
				<input type="text" name="username" class="tag text" placeholder="在这里输入用户名">
			</div>
			<div>
				<span class="icon glyphicon glyphicon-lock"></span>
				<input type="password" name="password" class="tag" placeholder="在这里输入密码">
			</div>
			<c:if test="${not empty param.tip}">
				<div style="margin: -25px auto 30px auto" id="tipDiv">
					<span style="color: red; font-weight: bold;">用户名或密码不正确，请重新输入</span>
				</div>
			</c:if>
			<div class="signin">
				<input type="submit" value="登录">
			</div>
		</form>
	</div>
	<div class="copy-rights">
		<p>
			Copyright &copy; 2017.Company name All rights reserved.More Infomation <a href="http://www.baidu.com/" target="_blank">BAIDU</a> - Collect from <a href="http://www.baidu.com/" target="_blank">BAIDU</a>
		</p>
	</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".tag").focus(function(){
			$(this).val("");
			$("#tipDiv").remove();
		});
	});
</script>
</html>