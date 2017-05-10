<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>管理员信息维护</title>
<link href="<%=request.getContextPath() %>/skin/css/bootstrap.min.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/skin/css/index.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/skin/css/jedate.css" rel="stylesheet" type="text/css">
<style type="text/css">
	.list-group-item:hover{
		background-color:  #f1edee;
	}
	table{
		border: 1px solid #ddd !important;
	}
	select, label{
		width: 25% !important;
		padding: 5px !important;
		float: left !important;
	}
	label {
		margin-right: -45px;
	}
	.type2 select, .type2 label{
		float: none !important;
	}
</style>
</head>
<body>
<%@include file="./headBar.jsp" %>
<div class="container-fluid" style="padding-top:10px">
	<div class="row">
		<div class="col-xs-3">
			<div class="panel panel-sh">
				<div class="panel-body">
		    		<div id="treeview1" class="">
		    			<ul class="list-group">
		    				<li class="list-group-item" data-nodeid="2" style="<c:if test="${type==null||type==1}">background-color:  #f7e1e7</c:if>">
		    					<span class="icon expand-icon glyphicon glyphicon-copyright-mark"></span>
		    					<a href="javascript:void(0)" onclick="location.href='<%=request.getContextPath() %>/bus/dataManage?type=1'">城市信息维护</a>
		    				</li>
		    				<li class="list-group-item" data-nodeid="2" style="<c:if test="${type==2}">background-color:  #f7e1e7</c:if>">
		    					<span class="icon expand-icon glyphicon glyphicon-home"></span>
		    					<a href="javascript:void(0)" onclick="location.href='<%=request.getContextPath() %>/bus/dataManage?type=2'">车站信息维护</a>
		    				</li>
		    				<li class="list-group-item" data-nodeid="2" style="<c:if test="${type==3}">background-color:  #f7e1e7</c:if>">
		    					<span class="icon expand-icon glyphicon glyphicon-indent-left"></span>
		    					<a href="javascript:void(0)" onclick="location.href='<%=request.getContextPath() %>/bus/dataManage?type=3'">车次信息维护</a>
		    				</li>
		    			</ul>
		    		</div>
		    	</div>
		    </div>
		</div>
		<div class="col-xs-9">
			<div class="panel panel-sh">
				<div class="panel-heading">
						<c:if test="${type==null||type==1}"><span class="glyphicon glyphicon-copyright-mark"></span>&nbsp;城市信息维护</c:if>
						<c:if test="${type==2}"><span class="icon expand-icon glyphicon glyphicon-home"></span>&nbsp;车站信息维护</c:if>
						<c:if test="${type==3}"><span class="icon expand-icon glyphicon glyphicon-indent-left"></span>&nbsp;车次信息维护</c:if>
					<div class="btn-toolbar pull-right" style="margin-top:-4px;">
						<button type="button" class="btn btn-sm btn-default" data-toggle="modal" 
							data-target="#myModal<c:if test="${type==null||type==1}">1</c:if><c:if test="${type==2}">2</c:if><c:if test="${type==3}">3</c:if>">
							<span class="glyphicon glyphicon-plus"></span>新增</button>
<!-- 						<button type="button" onclick="" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-edit"></span>更新</button> -->
						<button type="button" onclick="deleteCity(<c:out value="${type}" />)" class="btn btn-sm btn-default"><span class="glyphicon glyphicon-minus"></span>删除</button>
					</div>
				</div>
				<c:if test="${type==null||type==1}">
					<table class="table table-bordered table-check table-sort">
						<col width="10%">
						<col width="30%">
						<col width="">
						<thead>
							<tr>
								<th class="text-center">
									<input type="checkbox" class="js-checkall">
								</th>
								<th>所属省市</th>
								<th>城市名称</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${cityList}" var="item">
								<tr>
									<td class="text-center">
										<input type="checkbox" name="ids" value="${item.cId}">
									</td>
									<td><span>北京省(市) </span><span>海淀市(区) </span></td>
									<td>${item.cName}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 编辑弹出层 -->
					<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel1">新增城市信息</h4>
								</div>
								<form role="form" action="<%=request.getContextPath() %>/bus/addCity" method="post">
									<input type="hidden" name="type" value="1">
									<div class="modal-body">
										  <div class="form-group type1">
										    <label>所属省市</label>
										    <select name="pId" class="form-control">
												<option value="1">北京</option>
											</select>
											<label>省</label>
											<select name="cTid" class="form-control" style="margin-left: -45px">
												<option value="1">海淀</option>
											</select>
											<label>市/区</label>
										  </div>
										  <div class="form-group">
										    <label>城市名称</label>
										    <input type="text" class="form-control" name="cName">
										  </div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" onclick="return vaildate(1)">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 结束 -->
				</c:if>
				<c:if test="${type==2}">
					<table class="table table-bordered table-check table-sort">
						<col width="10%">
						<col width="10%">
						<col width="30%">
						<col width="">
						<thead>
							<tr>
								<th class="text-center">
									<input type="checkbox" class="js-checkall">
								</th>
								<th>所属城市</th>
								<th>车站名称</th>
								<th>车站介绍</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${stationList}" var="item">
								<tr>
									<td class="text-center" style="vertical-align: middle;">
										<input type="checkbox" name="ids" value="${item.sId}">
									</td>
									<td>${item.cName}</td>
									<td>${item.sName}</td>
									<td>${item.sIntro}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 编辑弹出层 -->
					<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel2" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel2">新增车站信息</h4>
								</div>
								<form role="form" action="<%=request.getContextPath() %>/bus/addStation" method="post">
									<input type="hidden" name="type" value="2">
									<div class="modal-body">
										  <div class="form-group type2">
										    <label>所属城市</label>
										    <select name="cId" class="form-control" style="width: 100% !important;">
												<c:forEach items="${cityList}" var="cityItem">
													<option value="${cityItem.cId}">${cityItem.cName}</option>
												</c:forEach>
											</select>
										  <div class="form-group">
										    <label class="mt10">车站名称</label>
										    <input type="text" class="form-control" name="sName">
										  </div>
										  <div class="form-group">
										    <label>车站介绍</label>
										    <textarea rows="5" class="form-control" name="sIntro"></textarea>
										  </div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" onclick="return vaildate(2)">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 结束 -->
				</c:if>
				<c:if test="${type==3}">
					<table class="table table-bordered table-check table-sort">
						<col width="5%">
						<col width="20%">
						<col width="15%">
						<col width="">
						<col width="">
						<col width="">
						<thead>
							<tr>
								<th class="text-center">
									<input type="checkbox" class="js-checkall">
								</th>
								<th>所属车站</th>
								<th>车次编号</th>
								<th>出发时间</th>
								<th>达到时间</th>
								<th>剩余票数</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${departureList}" var="item">
								<tr>
									<td class="text-center" style="vertical-align: middle;">
										<input type="checkbox" name="ids" value="${item.dId}">
									</td>
									<td>${item.cName}</td>
									<td>${item.dCode}</td>
									<td>
										<fmt:formatDate value="${item.dStartTime}" type="time" pattern="HH:mm:ss"/>
									</td>
									<td>
										<fmt:formatDate value="${item.dEndTime}" type="time" pattern="HH:mm:ss"/>
									</td>
									<td>${item.dTicket}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<!-- 编辑弹出层 -->
					<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel3" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
									<h4 class="modal-title" id="myModalLabel3">新增车次信息</h4>
								</div>
								<form role="form" action="<%=request.getContextPath() %>/bus/addDeparture" method="post">
									<input type="hidden" name="type" value="3">
									<div class="modal-body">
										  <div class="form-group type2">
										    <label>所属车站</label>
										    <select name="cId" class="form-control" style="width: 100% !important;">
												<c:forEach items="${stationList}" var="stationItem">
													<option value="${stationItem.sId}">${stationItem.sName}</option>
												</c:forEach>
											</select>
										  <div class="form-group">
										    <label class="mt10">车次编号</label>
						                     <div class="input-group">
											    <input type="text" class="form-control" name="dCode" readonly="readonly" placeholder="请点击右侧按钮以随机生成编号">
							                    <span class="input-group-btn">
												    <button type="button" class="form-control" onclick="createCode(this)">获取编号</button>
							                    </span>
							                </div>
										    <label>出发时间</label>
										    <input type="text" class="form-control" name="dStartTimeStr" readonly="readonly">
										    <label>到达时间</label>
										    <input type="text" class="form-control" name="dEndTimeStr" readonly="readonly">
										    <label>每日放出总票数</label>
										    <input type="number" class="form-control" name="dTicket" value="100" size="3">
										  </div>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-primary" onclick="return vaildate(3)">提交</button>
									</div>
								</form>
							</div>
						</div>
					</div>
					<!-- 结束 -->
				</c:if>
			</div>
			<div class="panel-footer text-right">
				
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/bootstrap.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/skin/js/jquery.jedate.js"></script>
<script type="text/javascript">
	$(function(){
		$(".js-checkall").click(function(){
			$("input[name='ids']").prop("checked", $(this).prop("checked"));
		});
		$("input[name='dStartTimeStr'], input[name='dEndTimeStr']").jeDate({
            format:"hh:mm",
        })
	});
	
	function deleteCity(type){
		var idsTag = $("input[name='ids']:checked");
		if(idsTag.length > 0){
			if(confirm("确认要删除当前选中项吗？"))
				var ids = new Array();
				for (var i = 0; i < idsTag.length; i++) {
					ids[i] = idsTag.eq(i).val();
				}
				var target;
				if(type == 1)
					target = "deleteCity";
				else if(type == 2)
					target = "deleteStation";
				else if(type == 3)
					target = "deleteDeparture";
				if(target.length > 0)
					location.href = "<%=request.getContextPath() %>/bus/" + target + "?ids=" + ids + "&type=" + type;
		}
	}
	function createCode(tag){
		var code = String.fromCharCode(Math.floor(Math.random() * 26 + 65));
			code += String.fromCharCode(Math.floor(Math.random() * 26 + 65));
		for (var i = 0; i < 6; i++) {
			code += Math.floor(Math.random() * 6 + 1).toString();
		}
		$(tag).parent().prev().val(code);
	}
	
	function vaildate(type){
		var flag = true;
		if(type == 1){
			var param1 = $("#myModal"+type+" input[name='cName']").val();
			if(param1.length==0) flag = false;
		}else if(type == 2){
			var param1 = $("#myModal"+type+" input[name='sName']").val();
			var param2 = $("#myModal"+type+" input[name='sIntro']").val();
			if(param1==""||param2=="") flag = false;
		}else if(type == 3){
			var param1 = $("#myModal"+type+" input[name='dCode']").val();
			var param2 = $("#myModal"+type+" input[name='dStartTimeStr']").val();
			var param3 = $("#myModal"+type+" input[name='dEndTimeStr']").val();
			var param4 = $("#myModal"+type+" input[name='dTicket']").val();
			if(param1==""||param2==""||param3==""||param4=="") flag = false;
		}
		if(!flag){
			alert("请先完善信息");
		}
		debugger;
		return flag;
	}
</script>
</html>