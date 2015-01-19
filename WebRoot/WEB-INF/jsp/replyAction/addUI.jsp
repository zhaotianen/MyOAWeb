<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>帖子回复</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script language="javascript"
	src="${pageContext.request.contextPath}/fckeditor/fckeditor.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		var fck = new FCKeditor("content");
		fck.Width = "99%";
		fck.Height = "100%";
		fck.ToolbarSet = "bbs";
		fck.BasePath = "${pageContext.request.contextPath}/fckeditor/";
		//fck.Config['SkinPath'] = "${pageContext.request.contextPath}/scriipt/fckeditoreditor/skins/office2003/";
		//fck.Config['SkinPath'] = "http://bbs.itcast.cn:80/widgets/fckeditor/editor/skins/office2003/";
		fck.ReplaceTextarea();
	});
</script>
<script type="text/javascript">
	$().ready(function() {
		$("#myForm").validate();
	});
</script>
</head>
<body>
	<!--显示表单内容-->
	<div class="container" style="overflow:auto;overflow-x: hidden">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="reply_add" cssStyle="margin: 0; padding: 0;" id="myForm">
			<s:hidden name="topicId"></s:hidden>

			<div id="PageHead"></div>

			<div>
				<div width=85% style="float:left">
					<font> &gt; </font>
					<s:a action="forum_list">论坛</s:a>
					<font> &gt; </font>
					<s:a action="forum_show?id=%{#topic.forum.id}">${topic.forum.name}</s:a>
					<font> &gt;&gt; </font> 帖子回复
				</div>
			</div>
			<div>
				<table border="0" cellspacing="0" cellpadding="0" width="100%"
					id="InputArea">
					<tr>
						<td height="30" width="80px"><div>帖子主题</div></td>
						<td><div>${topic.title}</div>
						</td>
					</tr>
					<tr>
						<td><label class="control-label"><font size="5px">标题:</font>
						</label>
						</td>
						<td><div>
								<s:textfield name="title" cssStyle="width:100%;height:30px"
									size="30" placeholder="标题" value="回复：%{#topic.title}" cssClass="{required:true,minlength:1,maxlength:140,messages:{required:'请输入标题'}}"/>
							</div>
						</td>
					</tr>
					<tr>
						<td><label class="control-label"><font size="5px">内容:</font>
						</label></td>
						<td>
							<div>
								<s:textarea name="content" cssStyle="width:650px;height:200px"
									placeholder="内容" cssClass="{required:true,minlength:1,maxlength:140,messages:{required:'请输入内容'}}"></s:textarea>
							</div>
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div align="center">
								<!-- 表单操作 -->
								<button type="submit" class="btn btn-primary btn-lg">保存</button>
								<a href="javascript:history.go(-1);"
									class="btn btn-warning btn-lg">返回 </a>
							</div>
						</td>
					</tr>
				</table>
			</div>

		</s:form>
	</div>
</body>
</html>
