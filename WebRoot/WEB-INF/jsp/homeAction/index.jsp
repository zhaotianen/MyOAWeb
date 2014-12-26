<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
<title>OA</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/script/jquery_treeview/jquery.cookie.js"></script>
</head>
<!-- 
<frameset rows="30%,*" framespacing=0 border=0 frameborder="0">

	<frame src="${pageContext.request.contextPath}/home_top.action">
	<frame src="${pageContext.request.contextPath}/home_main.action">

</frameset> -->

<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		index.jsp
	</div>
</body>


<!-- <frameset rows="100,*,25" framespacing=0 border=0 frameborder="0">
	<frame noresize name="TopMenu" scrolling="no"
		src="${pageContext.request.contextPath}/home_top.action">
	<frameset cols="180,*" id="resize">
		<frame noresize name="menu" scrolling="yes"
			src="${pageContext.request.contextPath}/home_left.action">

	</frameset>

</frameset> 
<noframes>
	<body>
	</body>
</noframes>

-->




</html>



