<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  User c_cate_user = new User();
  Post c_cate_post = new Post();
  Cate c_cate_cate = new Cate();
  List<CateInfo> c_cate_catelist = new ArrayList<>();
%>
<%
  request.setCharacterEncoding("utf-8");
  if (c_cate_catelist.isEmpty()) {
  	c_cate_catelist = c_cate_cate.getCates();
  }
  
%>
<section id="cateNav" class="shadow-box">
  <h2 class="prefix-block">分类</h2>
  <hr>
  <% for (CateInfo cateinfo : c_cate_catelist) { 
       int num = 0;
       String url = "?";
       if (request.getParameter("username") != null) {
      	 String str = request.getParameter("username");
         url = "user-page?username=" + str + "&";
         num = c_cate_post.getPostNumByAuthorAndCate(c_cate_user.getUserId(str), cateinfo.getCateId());
       } else if (request.getServletPath().equals("/post")) {
      	 String str = request.getRequestURI().substring(15, request.getRequestURI().length());
      	 num = c_cate_post.getPostNumByAuthorAndCate(c_cate_user.getUserId(str), cateinfo.getCateId());
       }  else if (request.getServletPath().equals("/add")) {
         String str = (String) session.getAttribute("username");
         num = c_cate_post.getPostNumByAuthorAndCate(c_cate_user.getUserId(str), cateinfo.getCateId());
       } else {
      	 num = c_cate_post.getPostNumByCate(cateinfo.getCateId());
       }
       url += "cate=" + cateinfo.getCateId();
  %>
    <section class="margin-bottom-16 
    <% if (request.getParameter("cate") != null && Integer.parseInt(request.getParameter("cate")) == cateinfo.getCateId()) {%>
      font-size-150 margin-left-32
    <% } else {%>
      margin-left-64 
    <% } %>
    ">
      <a href="<%=url%>"><span class="fa fa-folder-o"></span> <%=cateinfo.getCateName() %> <span class="badge"><%=num %></span></a>
    </section>
  <% } %>
</section>