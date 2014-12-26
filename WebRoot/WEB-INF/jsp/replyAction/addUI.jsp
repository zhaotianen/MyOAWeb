<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>帖子回复</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<link type="text/css" rel="stylesheet"
	href="${pageContext.request.contextPath}/style/blue/forum.css" />
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
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>

		<s:form action="reply_add" cssStyle="margin: 0; padding: 0;">
			<s:hidden name="topicId"></s:hidden>

			<div id="PageHead"></div>
			<center>
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
					<table border="0" cellspacing="1" cellpadding="1" width="100%"
						id="InputArea">
						<tr>
							<td height="30" width="80px"><div>帖子主题</div>
							</td>
							<td><div>${topic.title}</div></td>
						</tr>
						<tr>
							<td height="30"><div class="InputTitle">标题</div></td>
							<td><div>
									<s:textfield name="title" cssStyle="width:100%"
										value="回复：%{#topic.title}" />
								</div></td>
						</tr>
						<tr height="240">
							<td><div>内容</div>
							</td>
							<td>
								<div>
									<s:textarea name="content" cssStyle="width:650px;height:200px;"></s:textarea>
								</div></td>
						</tr>
						<tr height="30">
							<td colspan="2" align="center">
								<!-- 表单操作 --> <input type="submit" value="提交" /> <a
								href="javascript:history.go(-1);">返回 </a></td>
						</tr>
					</table>
				</div>
			</center>
		</s:form>
	</div>
</body>
</html>
