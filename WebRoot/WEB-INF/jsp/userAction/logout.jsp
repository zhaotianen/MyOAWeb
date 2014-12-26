<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>退出</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>

</head>

<body style="background-color: #99CCCC">
	<div class="container" align="center"
		style="width: 500px;height:200px;background-color: #FFFFFF;margin-top:130px">
		<br/>
		<br/>
		<br/>
		<a href="${pageContext.request.contextPath}/user_loginUI.action"
			class="btn btn-info">重新进入系统</a> <a
			href="javascript: window.open('','_self');window.close();"
			class="btn btn-danger">关闭当前窗口</a>
	</div>
</body>
</html>
