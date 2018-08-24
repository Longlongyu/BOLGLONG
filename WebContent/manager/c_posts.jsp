<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User c_posts_user = new User();
    Post c_posts_post = new Post();
    List<PostInfo> c_posts_post_list = new ArrayList<>();
    int c_posts_curr_page = 1;
%>

<%
  request.setCharacterEncoding("utf-8");
  String url = "";
  String p_username = (String) session.getAttribute("username");
  
  if (session.getAttribute("postlist") == "new") {
  	c_posts_post_list = new ArrayList<>();
  	session.setAttribute("postlist", null);
  }
  
  if (c_posts_post_list.isEmpty() && request.getParameter("username") == null) {
    String keyword = request.getParameter("keyword");
    c_posts_post_list = c_posts_post.getList(keyword);
  }
  if (request.getParameter("username") != null) {
  	p_username = request.getParameter("username");
    url = "username=" + p_username + "&";
  	c_posts_post_list = c_posts_post.getListByAuthor(c_posts_user.getUserId(p_username)); 
   }
  if (request.getParameter("p-page") != null) {
  	c_posts_curr_page = Integer.parseInt(request.getParameter("p-page")) < 0 ? 1 : Integer.parseInt(request.getParameter("p-page"));
  }
  PageCut posts_page_cut = new PageCut(c_posts_post_list, c_posts_curr_page, 10);
  List<PostInfo> curr_page_posts = posts_page_cut.getCurrPageList();
%>
<section>
<%
  for (PostInfo info : curr_page_posts) {
%>
<article class="post">
  <h2 class="title">
    <a href="post/<%=c_posts_user.getUserName(info.getAuthorId())%>?p_id=<%=info.getId()%>"><%=info.getTitle()%></a>
  </h2>
  <% if (request.getParameter("username") == null) { %>
  <span class="author">
    <span class="fa fa-pencil"></span>  <a href="user-page?username=<%=c_posts_user.getUserName(info.getAuthorId())%>"><%=c_posts_user.getUserName(info.getAuthorId())%></a>
  </span>
  <span> - </span>
  <% } %>
  <time class="date"><span class="fa fa-calendar"></span>  <%=info.getTime() %></time>

  <article class="post-article margin-top-16">
    <p><%=BlogUtil.Substring(info.getContent(), 300)%></p>
  </article>
  <p class="post-readbtn margin-top-32">
    <a href="post/<%=c_posts_user.getUserName(info.getAuthorId())%>?p_id=<%=info.getId()%>#more" class="more">Read More</a>
  </p>
  <hr />
</article>
<% } %>
</section>
<section id="page-nav">
    <a href="?<%=url %>p-page=1"><span class="glyphicon glyphicon-step-backward"></span></a>
    <%
    if (posts_page_cut.getStartPageNum() != 1) {
    %>
      <span>...</span>
    <%	
    }
    for (int i = posts_page_cut.getStartPageNum(); i <= posts_page_cut.getEndPageNum(); i++) {
    %>
      <a href="?<%=url %>p-page=<%=i %>"><%=i %></a>
    <% } %>
    
    <%
    if (posts_page_cut.getTotalPages() != posts_page_cut.getEndPageNum()) {
    %>
      <span>...</span>
    <% } %>
    <a href="?<%=url %>p-page=<%=posts_page_cut.getEndPageNum() %>"><span class="glyphicon glyphicon-step-forward"></span></a>
</section>
