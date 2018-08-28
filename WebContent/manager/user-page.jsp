<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User user_page_user = new User();
%>

<%
  request.setCharacterEncoding("utf-8");
  String u_username = (String) session.getAttribute("username");
  if (request.getParameter("username") != null) {
     u_username = request.getParameter("username");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=u_username%>的个人页 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <%@ include file="c_nav.jsp"%>
  <div class="jumbotron shadow-box" style="padding:3rem 10rem;">
    <h1><%=u_username %>'s blog</h1>
    <p>欢迎来到我的主页！</p>
    <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
  </div>
  <section class="container-fluid">
    <section class="row">
      <div class="col-xs-6 col-md-3">
        <%@ include file="c_catenav.jsp"%>
        <%@ include file="c_newposts.jsp"%>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-8 shadow-box">
        <%@ include file="c_posts.jsp"%>
      </div>
      <div class="col-xs-1">
        <%@ include file="c_side.jsp"%>
      </div>
    </section>
  </section>
  <%@ include file="b_footer.jsp"%>
  <%@ include file="script.jsp"%>
</body>
</html>