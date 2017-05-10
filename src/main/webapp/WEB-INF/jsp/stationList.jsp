<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列车车次表</title>
<link href="<%=request.getContextPath() %>/skin/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/skin/css/index.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/skin/css/jedate.css" rel="stylesheet" type="text/css">
<style type="text/css">
	th{
		background-color: #f1f1f1;
		text-align: center;
	}
	td{
		text-align: left;
	    text-overflow: ellipsis;
	    overflow: hidden;
	    white-space: nowrap;
	}
	.modal-body div, .modal-title{
		text-align: left;
	}
	.sCodeStyle:hover{
		cursor: pointer;
    	color: indianred;
	}
	.tag{
		width: 100px;
		display: inline !important;
	}
	.mix-content{
		margin: 5px 5%; 
		background-color: white;
		border-radius: 5px;
		padding: 5px;
	}
</style>
</head>
<body>
	<%@include file="./headBar.jsp" %>
	<div class="mix-content">
		<div class="panel mb0">
			<form action="<%=request.getContextPath() %>/bus/showList" method="post">
				<table>
					<tr>
						<td style="width: 8%; text-align: center; font-size: 16px;">选择地区</td>
						<td style="width: 40%;">
							<select class="form-control tag">
								<option value="1">北京</option>
							</select>&nbsp;省(市)
							<select class="form-control tag">
								<option value="1">海淀</option>
							</select>&nbsp;市(区)
							<select class="form-control tag" name="searchCityId" style="width: 150px; margin-left: 40px">
								<option value="">全部</option>
								<c:forEach items="${cityList}" var="item">
									<option value="${item.cId}">${item.cName}</option>
								</c:forEach>
							</select>&nbsp;城区
						</td>
						<td style="padding-left: 10px; text-align: left;">
							<button type="submit" class="btn btn-primary btn-sm">
								<span class="glyphicon glyphicon-search"></span> 立即查询
							</button>
						</td>
					</tr>
				</table>
			</form>
		</div>
		<div class="panel-body">
			<table border="1" class="table table-bordered list table-check">
				<tr type="thead" class="thead">
					<th width="8%">序号</th>
					<th width="15%">车站名称</th>
					<th width="20%">车站简介</th>
					<th width="">车次信息</th>
					<th width="15%">操作</th>
				</tr>
				<c:forEach var="item" items="${resultList}" varStatus="state">
					<tr data="${item.sId}" class="trlist">
						<td class="text-center">${state.index+1}</td>
						<td class="text-center">${item.sName}</td>
						<td>${item.sIntro}</td>
						<td class="text-center"></td>
						<td class="text-center">
							<button type="button" class="btn btn-default btn-xs" data-toggle="modal" data-target="#myModal${state.index}">查看详情</button>
							<!-- 详情弹出层 -->
							<div class="modal fade" id="myModal${state.index}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel${state.index}" aria-hidden="true">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
											<h4 class="modal-title" id="myModalLabel${state.index}">查看车站信息</h4>
										</div>
										<form role="form">
										<div class="modal-body">
											  <div class="form-group">
											    <label for="name">车站名称</label>
											    <div>${item.sName}</div>
											  </div>
											  <div class="form-group">
											    <label for="name">车站介绍</label>
											    <div style="white-space: normal;">${item.sIntro}</div>
											  </div>
										</div>
										<div class="modal-footer">
											<button type="button" class="btn btn-primary" data-dismiss="modal">关闭</button>
										</div>
										 </form>
									</div>
								</div>
							</div>
							<!-- 结束 -->
							<button type="button" class="btn btn-danger btn-xs" data-toggle="modal" data-target="#myModal" onclick="buyTicket('${item.sId}')">预订车票</button>
						</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</body>

<!-- 订票弹出层 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
				<h4 class="modal-title" id="myModalLabel">预订车票</h4>
			</div>
			<form role="form">
			<div class="modal-body">
				  <div class="form-group">
				    <label for="name">选择车次</label>
				    <select class="form-control sCode">
				    </select>
				  </div>
				  <div class="form-group">
				    <label for="name">出发时间</label>
				    <input type="text" class="form-control" readonly="readonly"/>
				  </div>
				  <div class="form-group">
				    <label for="name">到达时间</label>
				   <input type="text" class="form-control" readonly="readonly"/>
				  </div>
				  <div class="form-group">
				    <label for="name">剩余票数</label>
				    <input type="text" class="form-control" readonly="readonly"/>
				  </div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="orderTicket()">提交订单</button>
			</div>
			</form>
		</div>
	</div>
</div>
<!-- 结束 -->

<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.jedate.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function(){
		//获取当前车站的所有车次信息
		$(".trlist").each(function(){
			var tag = $(this);
			var sid = tag.attr("data");
			$.get("<%=request.getContextPath() %>/bus/getScodeList?sid=" + sid, function(data, status){
				var tagList = "";
				for (var i = 0; i < data.length; i++)
					tagList += "<span class='sCodeStyle' onclick=\"depDetail('" + data[i].dId + "')\">【" + data[i].dCode + "】</span>";
				tag.find("td").eq(3).html(tagList);
			});
		});
		$(".sCode").change(function(){
			getDepInfo($(this).val());
		});
	});
	function buyTicket(sid){
		$.get("<%=request.getContextPath() %>/bus/getScodeList?sid=" + sid, function(data, status){
			if(data.length > 0){
				var tagList = "";
				for (var i = 0; i < data.length; i++)
					tagList += "<option value='" + data[i].dId + "'>" + data[i].dCode + "</option>";
				$("#myModal").find(".sCode").html(tagList)
				getDepInfo(data[0].dId);
			}
		});
	}
	function getDepInfo(did){
		if(did != ""){
			$.get("<%=request.getContextPath() %>/bus/getScodeList?did=" + did, function(data, status){
				if(data.length > 0){
					var date = new Date(data[0].dStartTime);
					$("#myModal .modal-body input").eq(0).val(date.getHours() + ":" + date.getMinutes());
						date = new Date(data[0].dEndTime);
					$("#myModal .modal-body input").eq(1).val(date.getHours() + ":" + date.getMinutes());
					$("#myModal .modal-body input").eq(2).val(data[0].dTicket);
				}			
			});
		}
	}
	function orderTicket(){
		if($("#myModal .modal-body input").eq(2).val() > 0){
			var tag = $(".sCode");
			if(confirm("确认要订购【" + tag.find("option:selected").text() + "】次长途车吗？")){
				$.get("<%=request.getContextPath() %>/bus/orderTicket?did=" + tag.val(), function(data, status){
					alert("订购成功，请准时取票！");
				});
			}
		}else{
			alert("对不起，此车票已售光！");
		}
	}
</script>
</html>