<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>版块列表</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>版块列表</h2>
			</caption>
			<!-- 表头-->
			<thead>
				<tr>
					<td width="250px">版块名称</td>
					<td width="300px">版块说明</td>
					<td>相关操作</td>
				</tr>
			</thead>

			<!--显示数据列表-->
			<tbody>

				<s:iterator value="#forumList" status="status">
					<tr>
						<td>${name}&nbsp;</td>
						<td>${description}&nbsp;</td>
						<td><s:a action="forumManage_delete?id=%{id}"
								onclick="return delConfirm()">删除</s:a> <s:a
								action="forumManage_editUI?id=%{id}">修改</s:a> <!-- 最上面的不能上移 -->
							<s:if test="#status.first">
								<span class="disabled">上移</span>
							</s:if> <s:else>
								<s:a action="forumManage_moveUp?id=%{id}">上移</s:a>
							</s:else> <!-- 最下面的不能下移 --> <s:if test="#status.last">
								<span class="disabled">下移</span>
							</s:if> <s:else>
								<s:a action="forumManage_moveDown?id=%{id}">下移</s:a>
							</s:else>
						</td>
					</tr>
				</s:iterator>

			</tbody>
		</table>

		<!-- 其他功能超链接 -->
		<s:a action="forumManage_addUI">
					新建
				</s:a>

	</div>



</body>
</html>
