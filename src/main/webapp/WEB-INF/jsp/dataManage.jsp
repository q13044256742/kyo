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
	.tblist{
		margin-bottom: 5px
	}
	.tblist th, .tblist td{
		text-align: center;
	}
	.tblist input{
		width: 80px;
	    border: none;
	    border-bottom: 1px solid #b6caca;
	    text-align: center;
	    outline: none;
	}
	.divOnOff{
	    max-height: 220px;
    	overflow-y: scroll;
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
									<td><input type="text" value="${item.cName}" class="form-control" onclick="updateInfo(this, 1, '${item.cId}')" /></td>
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
									<td>
										<input type="text" value="${item.sName}" class="form-control" onclick="updateInfo(this, 2, '${item.sId}')">
									</td>
									<td>
										<textarea rows="5" class="form-control" onclick="updateInfo(this, 3, '${item.sId}')">${item.sIntro}</textarea>
									</td>
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
								<th>起始站点</th>
								<th>首班时间</th>
								<th>末班时间</th>
								<th>剩余票数</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${departureList}" var="item" varStatus="state">
								<tr>
									<td class="text-center" style="vertical-align: middle;">
										<input type="checkbox" name="ids" value="${item.dId}">
									</td>
									<td>${item.cName}</td>
									<td>${item.dCode}</td>
									<td>${item.dStartName}</td>
									<td>
										<fmt:formatDate value="${item.dStartTime}" type="time" pattern="HH:mm:ss"/>
									</td>
									<td>
										<fmt:formatDate value="${item.dEndTime}" type="time" pattern="HH:mm:ss"/>
									</td>
									<td>${item.dTicket}</td>
									<td>
										<button type="button" class="btn btn-default btn-xs"  data-toggle="modal" data-target="#myModalUp${state.index}">编辑站点</button>
										<!-- 修改页面弹出层 -->
										<div class="modal fade" id="myModalUp${state.index}" tabindex="-1" role="dialog" aria-labelledby="updateLabel${state.index}" aria-hidden="true">
											<div class="modal-dialog">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
														<h4 class="modal-title" id="updateLabel${state.index}">编辑车次信息</h4>
													</div>
													<form role="form" action="<%=request.getContextPath() %>/bus/updateDeparture" method="post">
														<input type="hidden" name="dId" value="${item.dId}" />
														<input type="hidden" name="type" value="3">
														<div class="modal-body">
															  <div class="form-group type2">
															    <label>所属车站</label>
															    <input type="text" value="${item.cName}" readonly="readonly" class="form-control" />
															  <div class="form-group">
															    <label class="mt10">车次编号</label>
											                     <div class="input-group">
																    <input type="text" class="form-control" name="dCode" value="${item.dCode}" readonly="readonly" placeholder="请点击右侧按钮以随机生成编号">
												                    <span class="input-group-btn">
																	    <button type="button" class="form-control" onclick="createCode(this)">获取编号</button>
												                    </span>
												                </div>
												                <label>起始站点</label>
															    <input type="text" class="form-control" name="dStartName" value="${item.dStartName}">
															    <label>首班时间</label>
															    <input type="text" class="form-control" name="dStartTimeStr" readonly="readonly" value="<fmt:formatDate value="${item.dStartTime}" pattern="HH:mm"/>">
															    <label>途经站点</label>
															    <div class="btn-group specgroup" style="width: 100%">
																	<button type="button" class="btn btn-default" onclick="btnOnOff(1)" style="width: 30%">
																		点击编辑站点<span class="caret" style="margin-left: 10px"></span>
																	</button>
																	<input type="hidden" class="arrayvalue" value="${item.dTheWayName}" />
																	<input type="hidden" class="arrayvalue" value="${item.dTheWayTime}" />
																	<input type="hidden" class="arrayvalue" value="${item.dTakePrice}" />
																	<input type="hidden" class="arrayvalue" value="${item.dType}" />
																	<input type="hidden" class="arrayvalue" value="${item.dDistance}" />
																	<div class="dropdown-menu divOnOff hide" role="menu" style="padding: 5px">
																		<table class="table tblist">
																			<tr>
																				<th>站点名</th>
																				<th>到达时间</th>
																				<th>票价(元)</th>
																				<th>车型</th>
																				<th>距离</th>
																				<th>操作</th>
																			</tr>
																			<tr>
																				<td><input type="text"></td>
																				<td><input type="text" readonly="readonly" id="arrTime"></td>
																				<td><input type="number" maxlength="8"></td>
																				<td><input type="text"></td>
																				<td><input type="number" maxlength="8"></td>
																				<td></td>
																			</tr>
																		</table>
																		<div style="text-align: right;">
																			<button type="button" class="btn btn-info btn-xs" style="margin-right: 8px" onclick="addTbList(this)">
																				<span class="glyphicon glyphicon-hand-right"></span> 添加
																			</button>
																		</div>
																	</div>
																</div>
															    <label>末班时间</label>
															    <input type="text" class="form-control" name="dEndTimeStr" readonly="readonly" value="<fmt:formatDate value="${item.dEndTime}" pattern="HH:mm"/>">
															    <label>剩余票数</label>
															    <input type="number" class="form-control" name="dTicket" value="${item.dTicket}" size="3">
															  </div>
														</div>
														<div class="modal-footer">
															<button type="submit" class="btn btn-primary">提交</button>
														</div>
													</form>
												</div>
											</div>
										</div>
										<!-- 结束 -->
									</td>
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
							                <label>起始站点</label>
										    <input type="text" class="form-control" name="dStartName">
										    <label>首班时间</label>
										    <input type="text" class="form-control" name="dStartTimeStr" readonly="readonly">
										    <label>途经站点</label>
										    <div class="btn-group" style="width: 100%">
												<button type="button" class="btn btn-default" onclick="btnOnOff(0)" style="width: 30%">
													点击编辑站点<span class="caret" style="margin-left: 10px"></span>
												</button>
												<div class="dropdown-menu divOnOff hide" role="menu" style="padding: 5px">
													<table class="table tblist">
														<tr>
															<th>站点名</th>
															<th>到达时间</th>
															<th>票价(元)</th>
															<th>车型</th>
															<th>距离</th>
														</tr>
														<tr>
															<td><input type="text"></td>
															<td><input type="text" readonly="readonly" id="arrTime"></td>
															<td><input type="number" maxlength="8"></td>
															<td><input type="text"></td>
															<td><input type="number" maxlength="8"></td>
														</tr>
													</table>
													<div style="text-align: right;">
														<button type="button" class="btn btn-info btn-xs" style="margin-right: 8px" onclick="addTbList(this)">
															<span class="glyphicon glyphicon-hand-right"></span> 添加
														</button>
													</div>
												</div>
											</div>
										    <label>末班时间</label>
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
		$("input[name='dStartTimeStr'], input[name='dEndTimeStr'], #arrTime").jeDate({
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
		return flag;
	}
	function btnOnOff(type){
		var tag = $(".divOnOff"); 
		if(tag.hasClass("hide")){
			tag.removeClass("hide");
			tag.addClass("show");
			if(type == 1 && $(".specgroup tr").length == 2){
				var names = $(".arrayvalue").eq(0).val().split('&');
				var times = $(".arrayvalue").eq(1).val().split('&');
				var price = $(".arrayvalue").eq(2).val().split('&');
				var types = $(".arrayvalue").eq(3).val().split('&');
				var dists = $(".arrayvalue").eq(4).val().split('&');
				for (var i = 0; i < names.length; i++) {
					var nameTag = "<td><input type='text' name='dTheWayNameArray' value='" + names[i] + "'></td>";
					var timeTag = "<td><input type='text' name='dTheWayTimeArray' readonly='readonly' data='arrTimeUpdate' value='"+times[i]+"'></td>";
					var pricTag = "<td><input type='number' name='dTakePriceArray' value='"+price[i]+"'></td>";
					var typeTag = "<td><input type='text' name='dTypeArray' value='"+types[i]+"'></td>";
					var distTag = "<td><input type='number' name='dDistanceArray' value='"+dists[i]+"'></td>";
					var deleTag = "<td><button type='button' class='btn btn-danger btn-xs' onclick='$(this).parent().parent().remove()'>删除</button></td>";
					$(".specgroup tr:first").after("<tr>"+nameTag + timeTag + pricTag + typeTag + distTag + deleTag + "</tr>");
				}
				$("input[data='arrTimeUpdate']").jeDate({format:"hh:mm"})
			}
		}
		else{
			tag.addClass("hide");
			tag.removeClass("show");						
		}
	}
	function addTbList(tag){
		var firstTag = $(tag).parent().prev().find("tr:first");
		var sourceTag = $(tag).parent().prev().find("tr:last").find("td");
		var flag = true;
		$(sourceTag.find("input").each(function(){
			if($(this).val()==""){
				flag = false;
			}
		}))
		if(flag){
			var targetTag = "<tr><td><input type='hidden' name='dTheWayNameArray' value='" + sourceTag.eq(0).find("input").val() + "' />" + sourceTag.eq(0).find("input").val() + "</td>" +
				"<td><input type='hidden' name='dTheWayTimeArray' value='" + sourceTag.eq(1).find("input").val() + "' />"+sourceTag.eq(1).find("input").val()+"</td>" +
				"<td><input type='hidden' name='dTakePriceArray' value='" + sourceTag.eq(2).find("input").val() + "' />"+sourceTag.eq(2).find("input").val()+"</td>" + 
				"<td><input type='hidden' name='dTypeArray' value='" + sourceTag.eq(3).find("input").val() + "' />"+sourceTag.eq(3).find("input").val()+"</td>" +
				"<td><input type='hidden' name='dDistanceArray' value='" + sourceTag.eq(4).find("input").val() + "' />"+sourceTag.eq(4).find("input").val()+"</td></tr>";
			firstTag.after(targetTag);
			sourceTag.find("input").each(function(){
				$(this).val("");
			});
		}else{
			alert("请先完善信息！");
		}
	}
	function updateInfo(tag, type, id){
		var obj = $(tag).val();
		$(tag).blur(function(){
			if($(this).val()!=obj){
				if(confirm("是否保存修改?")){
					location.href = "<%=request.getContextPath() %>/bus/updateInfoById?value=" + encodeURI(encodeURI($(this).val())) + "&type=" + type + "&id=" + id + "&tp=" + ${type};
				}else{
					$(this).val(obj);
				}
			}
		});
	}
</script>
</html>