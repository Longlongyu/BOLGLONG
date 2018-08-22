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
  
  if (c_posts_post_list.isEmpty()) {
    String keyword = request.getParameter("keyword");
    c_posts_post_list = c_posts_post.getList(keyword); 
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
  <p class="date"><%=info.getCreatedate()%></p>
  <p class="author">
      作者: <a href="user-page?username=<%=c_posts_user.getUserName(info.getAuthorId())%>"><%=c_posts_user.getUserName(info.getAuthorId())%></a>
  </p>
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
    <a href="?p-page=<%=1 %>">第一页</a>
    <%
    if (posts_page_cut.getStartPageNum() != 1) {
    %>
      <span>...</span>
    <%	
    }
    for (int i = posts_page_cut.getStartPageNum(); i <= posts_page_cut.getEndPageNum(); i++) {
    %>
      <a href="?p-page=<%=i %>"><%=i %></a>
    <% } %>
    
    <%
    if (posts_page_cut.getTotalPages() != posts_page_cut.getEndPageNum()) {
    %>
      <span>...</span>
    <% } %>
    <a href="?p-page=<%=posts_page_cut.getEndPageNum() %>">最后一页</a>
</section>
