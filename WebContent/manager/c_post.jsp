<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%
  request.setCharacterEncoding("utf-8");
  Post post = new Post();
  User user = new User();
  String keyword = request.getParameter("keyword");
  List<PostInfo> postlist = post.getList(keyword);
%>
<%
  for (PostInfo info : postlist) {
%>
<article class="post">
  <h1 class="title">
    <a href="?id=<%=info.getId()%>"><%=info.getTitle()%></a>
  </h1>
  <p class="date"><%=info.getCreatedate()%></p>
  <p class="author">作者: <%=user.getUserinfo(info.getAuthorId()).getUsername()%></p>
  <div class="entry">
    <p><%=BlogUtil.Substring(info.getContent(), 300)%></p>
  </div>
  <p class="meta">
    <a href="#" class="more">Read More</a>
  </p>
</article>
<% } %>
