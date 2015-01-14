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

<title>审批</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<sx:head extraLocales="UTF-8" />
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<s:form action="flow_sp">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">类型:</label></td>
					<td><s:select
							list="#{'事假':'事假','病假':'病假','婚假':'婚假','年假':'年假','休假':'休假'}"
							listKey="key" listValue="value" name="type" disabled="true"></s:select>
					</td>
				</tr>
				<tr>
					<td><label class="control-label">开始时间:</label></td>
					<td><sx:datetimepicker language="UTF-8" name="startTime"
							cssStyle="height:30px;width:200px" displayFormat="yyyy-MM-dd HH:mm:ss"
							value="%{new java.util.Date()}" disabled="true" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">结束时间:</label></td>
					<td><sx:datetimepicker language="UTF-8" name="stopTime"
							cssStyle="height:30px;width:200px" displayFormat="yyyy-MM-dd HH:mm:ss" disabled="true" />
					</td>
				</tr>
				<tr>
					<td><label class="control-label">理由/原因:</label></td>
					<td><s:textarea name="reason" placeholder="理由/原因"
							disabled="true"></s:textarea></td>
				</tr>
				<tr>
					<td><label class="control-label">审批意见:</label>
					</td>
					<td><s:select list="#{'同意':'同意','不同意':'不同意'}" listKey="key"
							listValue="value" name="leaderOpinion" value="同意"></s:select>
					</td>
				</tr>
			</table>
			<!-- 表单操作 -->
			<input type="submit" value="提交" class="btn btn-primary btn-lg" />
			<a href="javascript:history.go(-1);" class="btn btn-info btn-lg">返回
			</a>
		</s:form>
	</div>
</body>
</html>
