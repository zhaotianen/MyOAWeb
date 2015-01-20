<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sx" uri="/struts-dojo-tags"%>
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

<title>新建/更新</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

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
<sx:head extraLocales="UTF-8" />
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<s:form action="flow_%{id == null ? 'add' : 'edit'}" id="myForm">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">类型:</label></td>
					<td><s:select
							list="#{'事假':'事假','病假':'病假','婚假':'婚假','年假':'年假','休假':'休假'}"
							listKey="key" listValue="value" name="type"></s:select></td>
				</tr>
				<tr>
					<td><label class="control-label">开始时间:</label></td>
					<td><sx:datetimepicker language="UTF-8" toggleType="explode"
							name="startTime" cssStyle="height:30px;width:200px"
							displayFormat="yyyy-MM-dd HH:mm:ss" value="%{'today'}"
							formatLength="long" displayWeeks="5" weekStartsOn="1"
							cssClass="{required:true,messages:{required:'请选择开始时间'}}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">结束时间:</label></td>
					<td><sx:datetimepicker language="UTF-8" toggleType="explode"
							name="stopTime" cssStyle="height:30px;width:200px"
							displayFormat="yyyy-MM-dd HH:mm:ss" formatLength="long"
							displayWeeks="5"
							cssClass="{required:true,messages:{required:'请选择结束时间'}}" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">理由/原因:</label></td>
					<td><s:textarea name="reason" placeholder="理由/原因"
							cssClass="{required:true,minlength:5,maxlength:140,messages:{required:'请输入理由/原因'}}"></s:textarea>
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
