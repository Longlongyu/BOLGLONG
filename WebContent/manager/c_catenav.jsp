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
  List<CateInfo> catelist = new ArrayList<>();
  request.setCharacterEncoding("utf-8");
  if (catelist.isEmpty()) {
  	catelist = cate.getCates();
  }
  String name = "";
  int num = 0;
  String url = "?req=all&";
  boolean sw = false;
  
  int allnum = 0;
  if (request.getParameter("username") != null) {
    name = request.getParameter("username"); // 获得用户名
    url = "user-page?username=" + name + "&req=all&";
  } else if (request.getServletPath().equals("/post")) {
    name = request.getRequestURI().substring(6, request.getRequestURI().length());
  } else {
  	sw = true;
  }
  
  if (name != "") {
    allnum = post.getPostNumByAuthor(user.getUserId(name));
  } else {
  	allnum = post.getPostNum();
  }
%>
<section id="cateNav" class="margin-top-32 white-box">
  <h3 class="prefix-block">分类</h3>
  <hr>
  <section class="margin-bottom-8 margin-left-32">
    <a href="/"><span class="fa fa-folder-o"></span> 全部 <span class="badge"><%=allnum%></span></a>
  </section>
  <% 
    for (CateInfo cateinfo : catelist) { 
      if (sw) {
      	num = post.getPostNumByCate(cateinfo.getCateId()); 
      }
      if (name != "") { // 获作者的该分类下的所有博文数量
        int uid = user.getUserId(name);
        int cid = cateinfo.getCateId();
        num = post.getPostNumByAuthorAndCate(uid, cid); 
      }

      url += "cate=" + cateinfo.getCateId();
  %>
    <section class="margin-bottom-8 
      <% if (request.getParameter("cate") != null 
        && Integer.parseInt(request.getParameter("cate")) == cateinfo.getCateId()) {%>
        font-size-150 margin-left-16
      <% } else { %>
        margin-left-32
      <% } %>
      ">
      <a href="<%=url%>"><span class="fa fa-folder-o"></span> <%=cateinfo.getCateName()%> <span class="badge"><%=num %></span></a>
    </section>
  <% } %>
</section>