<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>用户列表</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>用户列表</h2>
			</caption>
			<!-- 表头-->
			<thead>
				<tr>
					<td width="100">登录名</td>
					<td width="100">姓名</td>
					<td width="100">所属部门</td>
					<td width="200">岗位</td>
					<td>备注</td>
					<td>相关操作</td>
				</tr>
			</thead>

			<!--显示数据列表-->
			<tbody>
				<s:iterator value="recordList">
					<tr>
						<td>${loginName}&nbsp;</td>
						<td>${name}&nbsp;</td>
						<td>${department.name}&nbsp;</td>
						<td><s:iterator value="roles">
                		${name}
                	</s:iterator>
						</td>
						<td>${description}&nbsp;</td>
						<td><s:a action="user_delete?id=%{id}"
								onclick="return delConfirm()">删除</s:a> <s:a
								action="user_editUI?id=%{id}">修改</s:a> <s:a
								action="user_initPassword?id=%{id}"
								onclick="return window.confirm('您确定要初始化密码为1234吗？')">初始化密码</s:a>
						</td>
					</tr>
				</s:iterator>

			</tbody>
		</table>

		<!-- 其他功能超链接 -->
		<s:a action="user_addUI" cssClass="btn btn-primary btn-lg">
					增加
				</s:a>
		<div align="right">
			<!-- 分页信息 -->
			<%@ include file="/WEB-INF/jsp/public/pageView.jspf"%>
			<s:form action="user_list"></s:form>
		</div>
	</div>




</body>
</html>
