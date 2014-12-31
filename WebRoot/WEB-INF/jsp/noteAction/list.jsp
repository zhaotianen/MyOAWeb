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

<title>便签列表</title>

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
				<h2>便签</h2>
			</caption>
			<thead>
				<tr>
					<th>便签名称</th>
					<th>修改时间</th>
					<th>内容</th>
					<th>备注</th>
					<th>操作</th>
				</tr>
			</thead>
			<tbody>
				<s:iterator value="#noteList">
					<tr>
						<td>${name}</td>
						<td>${time}</td>
						<td>${content}</td>
						<td>${description}</td>
						<td><s:a action="notes_delete?id=%{id}"
								onclick="return window.confirm('您确定要删除吗？')">删除</s:a> <s:a
								action="notes_editUI?id=%{id}">修改</s:a></td>
					</tr>
				</s:iterator>

			</tbody>

		</table>
		<s:a action="notes_addUI" cssClass="btn btn-primary btn-lg">增加</s:a>
	</div>
</body>
</html>
