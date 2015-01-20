<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>OA</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script type="text/javascript">
	$().ready(function() {
		$("#loginForm").validate();
	});
</script>
<style type="text/css">
label.error {
	margin-left: 10px;
	color: red;
}
</style>
</head>
<body style="background-color: #0099CC">
	<!-- 显示表单 -->
	<div class="container" align="center"
		style="width: 500px;background-color: #FFFFFF;margin-top:130px">
		<h1 class="page-header">
			OA <small>登录入口</small>
		</h1>
		<s:form action="user_login" method="post" id="loginForm">
			<table>
				<tr>
					<td colspan="2">
						<!-- 显示错误 --> <font color="red"><s:fielderror /> </font></td>
				</tr>
				<tr>
					<td><label class="control-label"><span
							class="icon-user"></span>用户名:</label>
					</td>
					<td><s:textfield name="loginName" size="30" placeholder="登录名"
							cssStyle="height:30px"
							cssClass="{required:true,minlength:3,messages:{required:'用户名不为空'}}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label"><span
							class="icon-lock"></span>密码:</label></td>
					<td><s:password name="password" size="30" showPassword="true"
							placeholder="密码" cssStyle="height:30px"
							cssClass="{required:true,minlength:4,messages:{required:'密码不为空'}}" />
					</td>
				</tr>
				<tr align="center">
					<td colspan="2"><button type="submit" class="btn btn-primary ">
							<span class="icon-ok"></span> 登录
						</button>
						<button type="reset" class="btn btn-warning ">
							<span class="icon-remove"></span> 重置
						</button>
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>

</html>

