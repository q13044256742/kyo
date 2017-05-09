<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="top">
	<div class="container-fluid" style="height: inherit; background: url(${contextPath}/images/logo.png) no-repeat 25px center">
		<div class="login loginInfo">
			<li class="dropdown" style="list-style-type: none; margin-right: 1em">
		        <a class="dropdown-toggle" data-toggle="dropdown" href="#">&emsp;我的工作台
		            <span class="caret"></span></a>
		        <ul class="dropdown-menu">
		            <li><a href="<%=request.getContextPath() %>/bus/showList">列表首页</a></li>
		            <li><a href="<%=request.getContextPath() %>/bus/dataManage?type=1">数据管理</a></li>
		            <li><a href="<%=request.getContextPath() %>/bus/accountManage">账户管理</a></li>
		            <li class="divider"></li>
		            <li><a href="javascript:void(0)" onclick="logout()">退出登录</a></li>
		        </ul>
		    </li>
		</div>
	</div>
</div>
<div id="console-window" class="modal fade">
     <div class="modal-dialog" style="margin-top:20px">
         <div class="modal-content">
             <div class="modal-header">
                 <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">×</span></button>
                 <h4 class="modal-title fc-red"></h4>
             </div>
             <div class="modal-body" style="padding:5px 0 0">
                 <iframe src="" frameborder="0" width="100%"></iframe>
             </div>
         </div><!-- /.modal-content -->
     </div><!-- /.modal-dialog -->
 </div> 
<style>
	.hrefLink, .hrefLink:hover, .hrefLink:focus {
		color: #D80020;
		text-decoration: underline;
		margin-right: 10px;
	}
	.pull-right {
	    float: right !important;
	    margin-left: 10px;
	}
	.login {
		font-weight: normal;
		margin-top: 4px;
		line-height: 29px;
	}
	.top{
		height: 36px;
	    line-height: 36px;
	    background: #ececec;
	}
	.dropdown-menu li a:hover{
		background-color: #ead7d7;
	}
</style>
<script>
	function logout(){
		if(confirm('您确定注销吗？')){
			window.location.href="${contextPath}/logout.jsp";
		}
	}
</script>