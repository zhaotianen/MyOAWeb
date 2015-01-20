<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>部门设置</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script type="text/javascript">
	$().ready(function() {
		$("#myForm").validate();
	});
</script>
<style type="text/css">
label.error {
	margin-left: 10px;
	color: red;
}
</style>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="department_%{id == null ? 'add' : 'edit'}" id="myForm">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->

			<table cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2">
						<!-- 显示错误 --> <font color="red"><s:fielderror /> </font>
					</td>
				</tr>
				<tr>
					<td><label class="control-label">上级部门:</label></td>
					<td><s:select name="parentId" cssClass="SelectStyle"
							list="#departmentList" listKey="id" listValue="name" headerKey=""
							headerValue="==请选择部门==" /></td>
				</tr>
				<tr>
					<td><label class="control-label">部门名称:</label>
					</td>
					<td><s:textfield name="name" placeholder="部门名称"
							cssStyle="height:30px"
							cssClass="{required:true,minlength:1,maxlength:140,messages:{required:'请输入部门名称'}}" />
						*</td>
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
				<button type="submit" class="btn btn-primary btn-lg">保存</button>
				<a href="javascript:history.go(-1);" class="btn btn-info btn-lg">返回
				</a>
			</div>
		</s:form>
	</div>

</body>
</html>
