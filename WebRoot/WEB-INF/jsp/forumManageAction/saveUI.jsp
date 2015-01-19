<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>版块设置</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="forumManage_%{id == null ? 'add' : 'edit'}">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->

			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">版块名称:</label></td>
					<td><s:textfield name="name" size="30" placeholder="版块名称"
							cssStyle="height:30px" /> *</td>
				</tr>
				<tr>
					<td><label class="control-label">版块说明:</label>
					</td>
					<td><s:textarea name="description" placeholder="版块说明"></s:textarea>
					</td>
				</tr>
			</table>
			<!-- 表单操作 -->
			<button type="submit" class="btn btn-primary btn-lg">保存</button>
			<a href="javascript:history.go(-1);" class="btn btn-info btn-lg">返回 </a>
		</s:form>
	</div>
</body>
</html>
