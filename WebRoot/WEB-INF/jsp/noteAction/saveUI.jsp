<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>更新</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>

</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<s:form action="notes_%{id == null ? 'add' : 'edit'}">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">便签名称:</label>
					</td>
					<td><s:textfield name="name" size="30" placeholder="便签名称"
							cssStyle="height:30px" /> *</td>
				</tr>
				<tr>
					<td><label class="control-label">便签内容:</label>
					</td>
					<td><s:textarea name="content" placeholder="便签内容"></s:textarea>
					</td>
				</tr>
				<tr>
					<td><label class="control-label">便签说明:</label>
					</td>
					<td><s:textarea name="description" placeholder="便签说明"></s:textarea>
					</td>
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
