<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User user_page_user = new User();
    Post user_page_post = new Post();
    List<PostInfo> user_page_post_list = new ArrayList<>();
    int user_page_curr_page = 1;
%>

<%
  request.setCharacterEncoding("utf-8");
  String u_username = (String) session.getAttribute("username");
  if (request.getParameter("username") != null) {
     u_username = request.getParameter("username");
  }
  user_page_post_list = user_page_post.getListByAuthor(user_page_user.getUserId(u_username)); 
  if (request.getParameter("p-page") != null) {
  	user_page_curr_page = Integer.parseInt(request.getParameter("p-page")) < 0 ? 1 : Integer.parseInt(request.getParameter("p-page"));
  }
  PageCut user_page_page_cut = new PageCut(user_page_post_list, user_page_curr_page, 10);
  List<PostInfo> curr_page_posts = user_page_page_cut.getCurrPageList();
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=u_username%>的个人页 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
<%@ include file="c_nav.jsp"%>
<h1>欢迎来到<%=u_username %>的主页！</h1>
<section>
  <%
  for (PostInfo info : curr_page_posts) {
  %>
  <article class="post">
    <h2 class="title">
      <a href="post/<%=user_page_user.getUserName(info.getAuthorId())%>?p_id=<%=info.getId()%>"><%=info.getTitle()%></a>
    </h2>
    <p class="date"><%=info.getCreatedate()%></p>
    <div class="entry">
      <p><%=BlogUtil.Substring(info.getContent(), 300)%></p>
    </div>
    <p class="meta">
      <a href="#" class="more">Read More</a>
    </p>
  </article>
  <% } %>
</section>
<section>
  <a href="?username=<%=u_username %>&p-page=<%=1 %>">第一页</a>
    <%
    if (user_page_page_cut.getStartPageNum() != 1) {
    %>
      <span>...</span>
    <%  
    }
    for (int i = user_page_page_cut.getStartPageNum(); i <= user_page_page_cut.getEndPageNum(); i++) {
    %>
      <a href="?username=<%=u_username %>&p-page=<%=i %>"><%=i %></a>
    <% } %>
    
    <%
    if (user_page_page_cut.getTotalPages() != user_page_page_cut.getEndPageNum()) {
    %>
      <span>...</span>
    <% } %>
    <a href="?username=<%=u_username %>&p-page=<%=user_page_page_cut.getEndPageNum() %>">最后一页</a>
</section>
<%@ include file="script.jsp"%>
</body>
</html>