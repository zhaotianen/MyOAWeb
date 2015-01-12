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
					<tr>
						<td>${type}</td>
						<td>${createUser.name}</td>
						<td>${startTime}</td>
						<td>${stopTime}</td>
						<td>${reason}</td>
						<td>${stauts}</td>
						<td><s:a action="flow_spUI?id=%{id}">审批</s:a></td>
					</tr>
				</s:iterator>

			</tbody>

		</table>
	</div>
</body>
</html>
