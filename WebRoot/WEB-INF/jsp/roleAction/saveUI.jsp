<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>岗位设置</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script type="text/javascript">
	$().ready(function() {
		$("#myForm").validate();
	});
</script>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="role_%{ id == null ? 'add' : 'edit' }" id="myForm">
			<s:hidden name="id"></s:hidden>
			<!-- 表单内容显示 -->
			<table cellpadding="0" cellspacing="0">
				<tr>
					<td><label class="control-label">岗位名称:</label></td>
					<td><s:textfield name="name" size="30" placeholder="岗位名称"
							cssStyle="height:30px"
							cssClass="{required:true,minlength:1,maxlength:140,messages:{required:'请输入岗位名称'}}" />
						*</td>
				</tr>
				<tr>
					<td><label class="control-label">岗位说明:</label></td>
					<td><s:textarea name="description" placeholder="岗位说明"></s:textarea>
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

