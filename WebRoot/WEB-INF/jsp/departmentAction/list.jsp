<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>部门列表</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>部门列表</h2>
			</caption>
			<thead>
				<tr>
					<td width="150px">部门名称</td>
					<td width="150px">上级部门名称</td>
					<td width="200px">职能说明</td>
					<td>相关操作</td>
				</tr>
			</thead>

			<!--显示数据列表-->
			<tbody>
				<s:iterator value="#departmentList">
					<tr>
						<td><s:a action="department_list?parentId=%{id}">${name}</s:a>&nbsp;</td>
						<td>${parent.name}&nbsp;</td>
						<td>${description}&nbsp;</td>
						<td><s:a
								action="department_delete?id=%{id}&parentId=%{parent.id}"
								onclick="return window.confirm('这将删除所有的下级部门，您确定要删除吗？')">删除</s:a>
							<s:a action="department_editUI?id=%{id}">
						修改
					</s:a> &nbsp;</td>
					</tr>
				</s:iterator>

			</tbody>
		</table>

		<!-- 其他功能超链接 -->

		<div>
			<s:a action="department_addUI?parentId=%{parentId}" class="btn btn-primary btn-lg">
					新建
				</s:a>
			<s:a action="department_list?parentId=%{#parent.parent.id}" class="btn btn-info btn-lg">
					返回到上一级
				</s:a>
		</div>
	</div>

</body>
</html>
