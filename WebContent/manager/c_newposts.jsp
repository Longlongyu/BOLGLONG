<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! 
  User user = new User();
  Post post = new Post();
  Cate cate = new Cate();
%>
<%
  List<PostInfo> post_list = new ArrayList<>();
  request.setCharacterEncoding("utf-8");
  if (post_list.isEmpty()) {
  	post_list = post.getList("");
  }
  
  String name = "";
  if (request.getParameter("username") != null) {
 	name = request.getParameter("username");
  } else if (request.getServletPath().equals("/post")) {
  	name = request.getRequestURI().substring(6, request.getRequestURI().length());
  } else if (request.getServletPath().equals("/add")) {
  	name = (String) session.getAttribute("username");
  }
  
  if (name != "") {
  	int uid = user.getUserId(name);
  	post_list = post.getListByAuthor(uid);
  }
  int count = 0;
%>
<section id="newNav" class="margin-top-32 shadow-box">
  <h2 class="prefix-block">最新文章</h2>
  <hr>
<% for (PostInfo info : post_list) { %>
  <section class="margin-left-16 margin-bottom-8">
    <a href="post/<%=user.getUserName(info.getAuthorId())%>?p_id=<%=info.getId()%>"><%=info.getTitle()%></a>
  </section>
<% 
    count++;
    if (count > 5) break;
  } 
%>
</section>