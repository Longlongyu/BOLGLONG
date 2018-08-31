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
%>
<section id="cateNav" class="shadow-box">
  <h2 class="prefix-block">分类</h2>
  <hr>
  <% 
    for (CateInfo cateinfo : catelist) { 
   	  String name = "";
      int num = 0;
      String url = "?";

      if (request.getParameter("username") != null) {
        name = request.getParameter("username"); // 获得用户名
        url = "user-page?username=" + name + "&";
      } else if (request.getServletPath().equals("/post")) {
        name = request.getRequestURI().substring(6, request.getRequestURI().length());
      } else if (request.getServletPath().equals("/add")) {
        name = (String) session.getAttribute("username");
      } else {
        num = post.getPostNumByCate(cateinfo.getCateId());
      }

      if (name != "") { // 获作者的该分类下的所有博文数量
        int uid = user.getUserId(name);
        int cid = cateinfo.getCateId();
        num = post.getPostNumByAuthorAndCate(uid, cid); 
      }

      url += "cate=" + cateinfo.getCateId();
  %>
    <section class="margin-bottom-16 
      <% if (request.getParameter("cate") != null 
        && Integer.parseInt(request.getParameter("cate")) == cateinfo.getCateId()) {%>
        font-size-150 margin-left-32
      <% } else { %>
        margin-left-64
      <% } %>
      ">
      <a href="<%=url%>"><span class="fa fa-folder-o"></span> <%=cateinfo.getCateName()%> <span class="badge"><%=num %></span></a>
    </section>
  <% } %>
</section>