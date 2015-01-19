<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>更改密码</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script type="text/javascript">
	$().ready(function() {
		$("#myForm").validate();
	});
</script>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<s:form action="password_editPassword" method="post" id="myForm">
			<table>
				<tr>
					<td colspan="3">
						<!-- 显示错误 --> <font color="red"><s:fielderror /> </font></td>
				</tr>
				<tr>
					<s:hidden name="userId" />
				</tr>
				<tr>
					<td><label class="control-label">原密码:</label></td>
					<td colspan="2"><s:password label="原密码" placeholder="原密码"
							name="password"
							cssClass="input-lg form-control,{required:true,minlength:4,messages:{required:'请输入密码'}}"
							cssStyle="height:30px" required="true" showPassword="true"
							id="passwordId" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">新密码:</label></td>
					<td colspan="2"><s:password label="新密码" placeholder="新密码"
							name="newPassword"
							cssClass="input-lg form-control,{required:true,minlength:4,messages:{required:'请输入新密码'}}"
							cssStyle="height:30px" required="true" showPassword="true"
							id="newPasswordId" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">重复新密码:</label></td>
					<td colspan="2"><s:password label="重复新密码" placeholder="重复新密码"
							name="reNewPassword"
							cssClass="input-lg form-control,{required:true,minlength:4,equalTo:'#newPasswordId',messages:{required:'请再次输入新密码'}}"
							cssStyle="height:30px" required="true" showPassword="true"
							id="reNewPasswordId" />
					</td>
				</tr>
				<tr>
					<td><button type="submit" class="btn btn-primary btn-lg">保存</button>
					</td>
					<td><s:reset value="重置" align="left"
							cssClass="btn btn-warning" />
					</td>
				</tr>
			</table>
		</s:form>
	</div>



</body>
</html>
