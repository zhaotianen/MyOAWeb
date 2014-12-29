<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>岗位列表</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>岗位管理</h2>
			</caption>
			<thead>
				<tr>
					<td width="200px">岗位名称</td>
					<td width="300px">岗位说明</td>
					<td>相关操作</td>
				</tr>
			</thead>
			<!--显示数据列表-->
			<tbody>
				<s:iterator value="#roleList">
					<tr >
						<td>${name}&nbsp;</td>
						<td>${description}&nbsp;</td>
						<td><s:a action="role_delete?id=%{id}"
								onclick="return confirm('确定要删除吗？')">删除</s:a> <s:a
								action="role_editUI?id=%{id}">修改</s:a> <s:a
								action="role_setPrivilegeUI?id=%{id}">设置权限</s:a>
						</td>
					</tr>
				</s:iterator>
			</tbody>

		</table>
		<s:a action="role_addUI" cssClass="btn btn-primary btn-lg">增加</s:a>
	</div>

</body>
</html>
