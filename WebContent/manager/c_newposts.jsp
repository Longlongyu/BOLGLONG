<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  User c_new_user = new User();
  Post c_new_post = new Post();
  Cate c_new_cate = new Cate();
  List<PostInfo> c_new_postlist = new ArrayList<>();
%>
<%
  request.setCharacterEncoding("utf-8");
  if (c_new_postlist.isEmpty()) {
  	c_new_postlist = c_new_post.getList("");
  }
  int count = 0;
%>
<section id="newNav" class="margin-top-32 shadow-box">
  <h2 class="margin-left-32">最新文章</h2>
  <hr>
  
<% for (PostInfo postinfo : c_new_postlist) {      
%>
  <section class="margin-left-16 margin-bottom-8">
    <a href="post/<%=c_new_user.getUserName(postinfo.getAuthorId())%>?p_id=<%=postinfo.getId()%>"><%=postinfo.getTitle()%></a>
  </section>
<% 
  count++;
  if (count > 5) break;
} %>
  
</section>