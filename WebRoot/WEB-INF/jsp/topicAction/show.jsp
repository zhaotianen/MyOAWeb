<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>查看主题：${topic.title}</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
<script language="javascript"
	src="${pageContext.request.contextPath}/script/fckeditor/fckeditor.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		var fck = new FCKeditor("content");
		fck.Width = "90%";
		fck.ToolbarSet = "bbs";
		fck.BasePath = "${pageContext.request.contextPath}/script/fckeditor/";
		fck.ReplaceTextarea();
	});
</script>
</head>
<body>

	<!--显示表单内容-->
	<div class="container" style="overflow:auto;overflow-x: hidden">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<div id="PageHead"></div>

		<div style="width: 98%">
			<font> &gt; </font>
			<s:a action="forum_list">论坛</s:a>
			<font> &gt; </font>
			<s:a action="forum_show?id=%{#topic.forum.id}">${topic.forum.name}</s:a>
			<font> &gt;&gt; </font> 帖子阅读 <span style="margin-left:30px;">
				<s:a action="topic_addUI?forumId=%{#topic.forum.id}"
					cssClass="btn btn-primary">
						发新帖
					</s:a> </span>
		</div>

		<div>

			<!--显示主题标题等-->
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="bottom">
					<td width="3" class="ForumPageTableTitleLeft">&nbsp;</td>
					<td><b>本帖主题：${topic.title}</b></td>
					<td align="right" style="padding-right:12px;"><s:a
							action="reply_addUI?topicId=%{#topic.id}" cssClass="btn btn-info">
							&nbsp;回复&nbsp;
						</s:a>
					</td>
					<td width="3">&nbsp;</td>
				</tr>
			</table>

			<!-- ~~~~~~~~~~~~~~~ 显示主帖（主帖只在第1页显示） ~~~~~~~~~~~~~~~ -->
			<s:if test="currentPage == 1">
				<div>
					<table border="0" cellpadding="0" cellspacing="1" width="100%">
						<tr>
							<td rowspan="3" width="130" align="center" valign="top">
								<!--作者头像-->
								<div>
									<img border="0" width="110" height="110"
										src="${pageContext.request.contextPath}/style/images/defaultAvatar.gif"
										onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
								</div> <!--作者名称-->
								<div>${topic.author.name}</div>
							</td>
							<td align="left">
								<!-- 文章的标题 --> ${topic.title}</td>
						</tr>
						<tr>
							<!-- 文章内容 -->
							<td align="left">
								<div>${topic.content}</div>
							</td>
						</tr>
						<tr>
							<!--显示楼层等信息-->
							<td height="28" align="center" valign="bottom">
								<ul style="margin: 0px; width: 98%;">
									<li style="float: left; line-height:18px;"><font
										color=#C30000>[楼主]</font> ${topic.postTime}</li>
									<li style="float: right;"><a href="javascript:scroll(0,0)">
											▲ </a>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</s:if>
			<!-- ~~~~~~~~~~~~~~~ 显示主帖结束 ~~~~~~~~~~~~~~~ -->


			<!-- ~~~~~~~~~~~~~~~ 显示回复列表 ~~~~~~~~~~~~~~~ -->
			<s:iterator value="recordList" status="status">
				<div>
					<table border="0" cellpadding="0" cellspacing="1" width="100%">
						<tr>
							<td rowspan="3" width="130" align="center" valign="top">
								<!--作者头像-->
								<div>
									<img border="0" width="110" height="110"
										src="${pageContext.request.contextPath}/style/images/defaultAvatar.gif"
										onerror="this.onerror=null; this.src='${pageContext.request.contextPath}/style/images/defaultAvatar.gif';" />
								</div> <!--作者名称-->
								<div>${author.name}</div>
							</td>
							<td align="right"><a
								href="${pageContext.request.contextPath}/BBS_Topic/saveUI.html"><img
									border="0"
									src="${pageContext.request.contextPath}/style/images/edit.gif" />编辑</a>
								<a href="#" onClick="return confirm('确定要删除本帖吗？')"><img
									border="0"
									src="${pageContext.request.contextPath}/style/images/delete.gif" />删除</a>
							</td>
						</tr>
						<tr>
							<!-- 文章内容 -->
							<td valign="top" align="left">
								<div>
									<!-- 文章表情与标题 -->
									${title}
								</div>
								<div>${content}</div>
							</td>
						</tr>
						<tr>
							<!--显示楼层等信息-->
							<td height="28" align="center" valign="bottom">
								<ul style="margin: 0px; width: 98%;">
									<li style="float: left; line-height:18px;"><font
										color=#C30000>[${(currentPage - 1) * pageSize +
											status.count}楼]</font> ${postTime}</li>
									<li style="float: right;"><a href="javascript:scroll(0,0)">
											▲ </a>
									</li>
								</ul>
							</td>
						</tr>
					</table>
				</div>
			</s:iterator>
			<!-- ~~~~~~~~~~~~~~~ 显示回复列表结束 ~~~~~~~~~~~~~~~ -->
		</div>

		<div align="right">
			<!--分页信息-->
			<%@ include file="/WEB-INF/jsp/public/pageView.jspf"%>
			<s:form action="topic_show?id=%{id}"></s:form>
		</div>




		<!--快速回复-->

		<!--<div style="margin-top: 25px;" align="right">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr valign="bottom">
					<td width="3" class="ForumPageTableTitleLeft">&nbsp;</td>
					<td><b>快速回复</b></td>
					<td width="3">&nbsp;</td>
				</tr>
				<tr height="1">
					<td colspan="3"></td>
				</tr>
			</table>
		</div> 
		<form action="">
			<div style="padding-left: 3px;">
				<table border="0" cellspacing="1" width="98%" cellpadding="5">
					<tr height="30">
						<td width="50px"><b>标题</b>
						</td>
						<td><input type="text" name="title" value="回复：昨天发现在表单里删除的图片"
							style="width:90%" /></td>
					</tr>
					<tr height="200">
						<td valign="top" rowspan="2"><b>内容</b>
						</td>
						<td valign="top"><textarea name="content"
								style="width: 95%; height: 300px"></textarea></td>
					</tr>
					<tr height="30">
						<td colspan="2" align="center"><input type="submit"
							value="提交" class="btn btn-primary btn-lg" /></td>
					</tr>
				</table>
			</div>
		</form>-->

	</div>

</body>
</html>
