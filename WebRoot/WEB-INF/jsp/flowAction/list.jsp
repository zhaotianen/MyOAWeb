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

<title>请假列表</title>

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
				<h2>我的申请列表</h2>
			</caption>
			<thead>
				<tr>
					<th>类型</th>
					<th>申请者</th>
					<th>开始时间</th>
					<th>结束时间</th>
					<th>理由</th>
					<th>审批者</th>
					<th>状态</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#flowList" var="f">
					<tr>
						<td>${type}</td>
						<td>${createUser.name}</td>
						<td>${startTime}</td>
						<td>${stopTime}</td>
						<td>${reason}</td>
						<td>${leaderUser.name}【${leaderUser.department.name}】</td>
						<td>${stauts}</td>
						<td><s:a action="flow_delete?id=%{id}"
								onclick="return window.confirm('您确定要删除吗？')">删除</s:a> <s:if
								test="%{#f.stauts=='提交申请'}">
								<s:a action="flow_editUI?id=%{id}">修改</s:a>
							</s:if></td>
					</tr>
				</s:iterator>

			</tbody>

		</table>
		<s:a action="flow_addUI" cssClass="btn btn-primary btn-lg">增加</s:a>
	</div>
</body>
</html>
