<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>更新信息</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<font color="red"><s:fielderror /> </font>
		<s:form action="data_edit">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">登录名:</label></td>
					<td><s:textfield name="loginName" size="30" placeholder="登录名"
							cssStyle="height:30px" /> * （登录名不能重复）</td>
				</tr>
				<tr>
					<td><label class="control-label">姓名:</label></td>
					<td><s:textfield name="name" size="30" placeholder="姓名"
							cssStyle="height:30px" /> *</td>
				</tr>
				<tr>
					<td><label class="control-label">性别:</label></td>
					<td><s:radio name="gender" list="{'男', '女'}" /></td>
				</tr>
				<tr>
					<td><label class="control-label">联系电话:</label></td>
					<td><s:textfield name="phoneNumber" size="30"
							placeholder="联系电话" cssStyle="height:30px" /></td>
				</tr>
				<tr>
					<td><label class="control-label">E-mail:</label></td>
					<td><s:textfield name="email" size="30" placeholder="E-mail"
							cssStyle="height:30px" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">备注:</label></td>
					<td><s:textarea name="description" placeholder="备注"></s:textarea>
					</td>
				</tr>
			</table>
			<!-- 表单操作 -->
			<input type="submit" value="保存" class="btn btn-primary btn-lg" />
			<a href="javascript:history.go(-1);" class="btn btn-info btn-lg">返回
			</a>
		</s:form>
	</div>
</body>
</html>
