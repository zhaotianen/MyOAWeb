<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>【${forum.name}】中的主题列表</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>

<script type="text/javascript">
	function onSortByChange(selectedValue) {
		if (selectedValue == 0) {
			$("select[name=asc]").attr("disabled", "disabled");
		} else {
			$("select[name=asc]").removeAttr("disabled");
		}
	}

	$(function() {
		if ($("select[name=orderBy]").val() == '0') {
			$("select[name=asc]").attr("disabled", "disabled");
		}
	});
</script>
</head>
<body>
	<!--显示表单内容-->
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<!-- 标题显示 -->
		<div id="Title_bar">
			<div id="Title_bar_Head">
				<div id="Title_Head"></div>
				<div id="Title">
					<!--页面标题-->
					【${forum.name}】中的主题列表
				</div>
				<div id="Title_End"></div>
			</div>
		</div>

		<s:form action="forum_show?id=%{id}">
			<div id="MainArea">
				<div id="PageHead"></div>

				<div style="width: 98%;">
					<font> &gt; </font>
					<s:a action="forum_list">论坛</s:a>
					<font> &gt; </font> ${forum.name} <span style="margin-left:30px;">
						<s:a action="topic_addUI?forumId=%{#forum.id}"
							cssClass="btn btn-primary">
								发新帖
							</s:a> </span>
				</div>

				<div>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<!--表头-->
						<tr align="left" valign="middle">
							<td width="3"><img border="0" width="1" height="1"
								src="${pageContext.request.contextPath}/style/images/blank.gif" />
							</td>
							<td width="50">
								<!--状态/图标-->&nbsp;</td>
							<td>主题</td>
							<td width="130">作者</td>
							<td width="100">回复数</td>
							<td width="130">最后回复</td>

						</tr>

						<!--主题列表-->
						<tbody>

							<s:iterator value="recordList">
								<tr height="35" id="d0">
									<td></td>
									<td align="center"><img
										src="${pageContext.request.contextPath}/style/images/topicType_${type}.gif" />
									</td>
									<td><s:a action="topic_show?id=%{id}">${title}</s:a></td>
									<td>
										<ul>
											<li>${author.name}</li>
											<li>${postTime}</li>
										</ul></td>
									<td align="center"><b>${replyCount}</b></td>
									<td>
										<ul>
											<li>${lastReply.author.name}</li>
											<li>${lastReply.postTime}</li>
										</ul></td>
									<td></td>
								</tr>
							</s:iterator>
						</tbody>
					</table>
					<!--其他操作-->
					<div id="TableTail">
						<div id="TableTail_inside">
							<table border="0" cellspacing="0" cellpadding="0" height="100%"
								align="left">
								<tr valign=bottom>
									<td></td>
									<td><s:select name="viewType"
											list="#{0:'全部主题', 1:'全部精华贴'}" /> <s:select name="orderBy"
											onchange="onSortByChange(this.value)"
											list="#{0:'默认排序(所有置顶帖在前面，并按最后更新时间降序排列)', 1:'只按最后更新时间排序', 2:'只按主题发表时间排序', 3:'只按回复数量排序'}" />

										<s:select name="asc" list="#{false:'降序', true:'升序'}" /> <input
										type="IMAGE"
										src="${pageContext.request.contextPath}/style/blue/images/button/submit.PNG"
										align="ABSMIDDLE" /></td>
								</tr>
							</table>
						</div>
					</div>

				</div>

			</div>
		</s:form>

		<!--分页信息-->
		<%@ include file="/WEB-INF/jsp/public/pageView.jspf"%>




	</div>

</body>
</html>
