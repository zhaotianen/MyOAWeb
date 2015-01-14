<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>待我审批列表</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>

<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<div class='container-fluid'>
			<!--
    选项卡：通过BS的类来控制选项卡的样式
  -->
			<ul class='nav nav-tabs'>
				<li class='active'><a href='#tab1' data-toggle='tab'>待我审批列表</a>
				</li>
				<li><a href='#tab2' data-toggle='tab'>我已审批列表</a></li>
			</ul>

			<!--
    选项卡的内容定义
  -->
			<div class='tab-content'>
				<div class='tab-pane active' id='tab1'>
					<table class="table table-hover">
						<caption>
							<h2>待我审批列表</h2>
						</caption>
						<thead>
							<tr>
								<th>类型</th>
								<th>申请者</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>理由</th>
								<th>状态</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<s:iterator value="#myTaskList" var="f">
								<tr style="color: red;">
									<td>${type}</td>
									<td>${createUser.name}</td>
									<td>${startTime}</td>
									<td>${stopTime}</td>
									<td>${reason}</td>
									<td>${stauts}</td>
									<td><s:a action="flow_spUI?id=%{id}">审批</s:a>
									</td>
								</tr>
							</s:iterator>

						</tbody>

					</table>

				</div>
				<div class='tab-pane' id='tab2'>
					<table class="table table-hover">
						<caption>
							<h2>我已审批列表</h2>
						</caption>
						<thead>
							<tr>
								<th>类型</th>
								<th>申请者</th>
								<th>开始时间</th>
								<th>结束时间</th>
								<th>理由</th>
								<th>状态</th>

							</tr>
						</thead>
						<tbody>
							<s:iterator value="#myTaskList1" var="f1">
								<tr>
									<td>${type}</td>
									<td>${createUser.name}</td>
									<td>${startTime}</td>
									<td>${stopTime}</td>
									<td>${reason}</td>
									<td>${stauts}</td>

								</tr>
							</s:iterator>

						</tbody>

					</table>
				</div>
			</div>

		</div>









		<!--<table class="table table-hover">
			<caption>
				<h2>待我审批列表</h2>
			</caption>
			<thead>
				<tr>
					<th>类型</th>
					<th>申请者</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>理由</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#myTaskList" var="f">
					<tr>
						<td>${type}</td>
						<td>${createUser.name}</td>
						<td>${startTime}</td>
						<td>${stopTime}</td>
						<td>${reason}</td>
						<td>${stauts}</td>
						<td><s:a action="flow_spUI?id=%{id}">审批</s:a>
						</td>
					</tr>
				</s:iterator>

			</tbody>

		</table> -->
	</div>
</body>
</html>
