<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>发表新主题</title>
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
</head>
<body>


	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>


		<s:form action="topic_add" cssStyle="margin: 0; padding: 0;">
			<s:hidden name="forumId"></s:hidden>

			<div id="PageHead"></div>

			<div>
				<div width=85% style="float:left">
					<font> &gt; </font>
					<s:a action="forum_list">论坛</s:a>
					<font> &gt; </font>
					<s:a action="forum_show?id=%{#forum.id}">${forum.name}</s:a>
					<font> &gt;&gt; </font> 发表新主题
				</div>
			</div>
			<div>
				<table border="0" cellspacing="0" cellpadding="0" width="100%"
					id="InputArea">
					<tr>
						<td><label class="control-label"><font size="5px">标题:</font>
						</label>
						</td>
						<td><s:textfield name="title"
								cssStyle="width:100%;height:30px" size="30" placeholder="标题" />
						</td>
					</tr>
					<tr height="240">
						<td><label class="control-label"><font size="5px">内容:</font>
						</label>
						</td>
						<td><s:textarea name="content"
								cssStyle="width:650px;height:200px" placeholder="内容"></s:textarea>
						</td>

					</tr>

				</table>
				<!-- 表单操作 -->
				<input type="submit" value="保存" /> <a
					href="javascript:history.go(-1);">返回 </a>
			</div>

		</s:form>
	</div>



</body>
</html>
