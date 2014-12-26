<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<html>
<head>
<title>论坛</title>
<%@ include file="/WEB-INF/jsp/public/commons.jspf"%>
</head>
<body>
	<div class="container">
		<%@ include file="/WEB-INF/jsp/public/top.jspf"%>
		<table class="table table-hover">
			<caption>
				<h2>论坛</h2>
			</caption>
			<!--表头-->
			<thead>
				<tr>
					<td colspan="3">版块</td>
					<td width="80">主题数</td>
					<td width="80">文章数</td>
					<td width="270">最后发表的主题</td>
				</tr>
			</thead>

			<!--版面列表-->
			<tbody>
				<s:iterator value="#forumList">
					<tr height="78" align="center">
						<td width="3"></td>
						<td width="75"><img
							src="${pageContext.request.contextPath}/style/images/forumpage3.gif" />
						</td>
						<td>
							<ul>
								<li><s:a action="forum_show?id=%{id}">${name}</s:a></li>
								<li>${description}</li>
							</ul>
						</td>
						<td><b>${topicCount}</b></td>
						<td><b>${articleCount}</b></td>
						<td>
							<ul>
								<li><font color="#444444">┌ 主题：</font> <s:a
										action="topic_show?id=%{lastTopic.id}">${lastTopic.title}</s:a>
								</li>
								<li><font color="#444444">├ 作者：</font>
									${lastTopic.author.name}</li>
								<li><font color="#444444">└ 时间：</font>
									${lastTopic.postTime}</li>
							</ul>
						</td>
						<td width="3"></td>
					</tr>
				</s:iterator>

			</tbody>
			<!-- 版面列表结束 -->

			<tr height="3">
				<td colspan="9"></td>
			</tr>
		</table>
	</div>
</body>
</html>
