<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>部门设置</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="department_%{id == null ? 'add' : 'edit'}">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->

			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">上级部门:</label></td>
					<td><s:select name="parentId" cssClass="SelectStyle"
							list="#departmentList" listKey="id" listValue="name" headerKey=""
							headerValue="==请选择部门==" /></td>
				</tr>
				<tr>
					<td><label class="control-label">部门名称:</label>
					</td>
					<td><s:textfield name="name"  placeholder="部门名称"
							cssStyle="height:30px" /> *</td>
				</tr>
				<tr>
					<td><label class="control-label">职能说明：</label>
					</td>
					<td><s:textarea name="description" placeholder="职能说明"></s:textarea>
					</td>
				</tr>
			</table>


			<!-- 表单操作 -->
			<div>
				<input type="submit" value="保存" /> <a
					href="javascript:history.go(-1);">返回 </a>
			</div>
		</s:form>
	</div>

</body>
</html>
