<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>用户信息</title>
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

		<s:form action="user_%{id == null ? 'add' : 'edit'}" id="myForm">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2">
						<!-- 显示错误 --> <font color="red"><s:fielderror /> </font>
					</td>
				</tr>
				<tr>
					<td width="100"><label class="control-label">所属部门:</label></td>
					<td><s:select name="departmentId"
							cssClass="{required:true,messages:{required:'请选择'}}"
							list="#departmentList" listKey="id" listValue="name" headerKey=""
							headerValue="==请选择部门==" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">登录名:</label></td>
					<td><s:textfield name="loginName" size="30" placeholder="登录名"
							id="loginName" cssStyle="height:30px"
							disabled="%{id==null?'false':'true'}"
							cssClass="{required:true,minlength:3,maxlength:20,messages:{required:'请输入合法登录名'}}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">姓名:</label></td>
					<td><s:textfield name="name" size="30" placeholder="姓名"
							cssStyle="height:30px"
							cssClass="{required:true,minlength:2,maxlength:20,messages:{required:'请输入真实姓名'}}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">性别:</label></td>
					<td><s:radio name="gender" list="{'男', '女'}"
							cssClass="{required:true,messages:{required:'请选择性别'}}" /></td>
				</tr>
				<tr>
					<td><label class="control-label">联系电话:</label></td>
					<td><s:textfield name="phoneNumber" size="30"
							placeholder="联系电话" cssStyle="height:30px"
							cssClass="{required:true,messages:{required:'请输入正确的联系电话'},digits:true}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">E-mail:</label></td>
					<td><s:textfield name="email" size="30" placeholder="E-mail"
							cssStyle="height:30px"
							cssClass="{required:true,messages:{required:'请输入正确的电子邮件'},email:true}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">备注:</label></td>
					<td><s:textarea name="description" placeholder="备注"></s:textarea>
					</td>
				</tr>
			</table>

			<!-- 表单内容显示 -->

			<table cellpadding="0" cellspacing="0">
				<tr>
					<td width="100"><label class="control-label">岗位:</label></td>
					<td><s:select name="roleIds" multiple="true" size="10"
							list="#roleList" listKey="id" listValue="name"
							cssClass="{required:true,messages:{required:'请选择岗位'}}" />
						按住Ctrl键可以多选或取消选择</td>
				</tr>
			</table>
			<!-- 表单操作 -->
			<button type="submit" class="btn btn-primary btn-lg">保存</button>
			<a href="javascript:history.go(-1);" class="btn btn-info btn-lg">返回
			</a>
		</s:form>
	</div>
</body>
</html>
