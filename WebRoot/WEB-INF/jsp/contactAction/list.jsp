<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<html>
<head>
<title>通讯录</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>通讯录</h2>
			</caption>
			<!-- 表头-->
			<thead>
				<tr>
					<td width="100">部门名称</td>
					<td width="100">姓名</td>
					<td width="100">电话号码</td>
					<td width="200">电子邮件</td>
					<td>备注</td>
					<td>相关操作</td>
				</tr>
			</thead>

			<!--显示数据列表-->
			<tbody>
				<s:iterator value="#ContactList" var="c">
					<tr>
						<td>${c.department.name}&nbsp;</td>
						<td>${c.name}&nbsp;</td>
						<td>${c.phoneNumber}&nbsp;</td>
						<td>${c.email}&nbsp;</td>
						<td>${c.description}&nbsp;</td>
						<td><s:a action="email_send?id=%{top.id}">发电子邮件</s:a> <s:a
								action="user_editUI?id=%{top.id}">发即时信息</s:a></td>
					</tr>
				</s:iterator>

			</tbody>
		</table>
	</div>




</body>
</html>
