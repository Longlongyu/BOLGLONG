<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%
  User page_user = new User();
  request.setCharacterEncoding("utf-8");
  String name = (String) session.getAttribute("username");
  if (request.getParameter("username") != null) {
     name = request.getParameter("username");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=name%>的个人页 - 博客龙</title>
  <jsp:include page="/manager/b_head.jsp" flush="true" />
</head>
<body>
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="/manager/c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <button type="button"
        class="hamburger is-closed animated fadeInLeft"
        data-toggle="offcanvas">
        <span class="hamb-top"></span> <span class="hamb-middle"></span>
        <span class="hamb-bottom"></span>
      </button>
      
      <jsp:include page="/manager/c_nav.jsp" flush="true" />
      <div class="jumbotron shadow-box" style="padding:3rem 10rem;">
        <h1><%=name %>'s blog</h1>
        <p>欢迎来到我的主页！</p>
        <p><a class="btn btn-primary btn-lg" href="#" role="button">Learn more</a></p>
      </div>
      <section class="container-fluid">
        <section class="row">
          <div class="col-xs-6 col-md-3">
            <jsp:include page="/manager/c_catenav.jsp" flush="true" />
            <jsp:include page="/manager/c_newposts.jsp" flush="true" />
          </div>
          <div class="col-xs-12 col-sm-6 col-md-8 shadow-box">
            <jsp:include page="/manager/c_posts.jsp" flush="true" />
          </div>
          <div class="col-xs-1">
            <jsp:include page="/manager/c_side.jsp" flush="true" />
          </div>
        </section>
      </section>
      <jsp:include page="/manager/b_footer.jsp" flush="true" />
    </div>
  </div>
  
  <jsp:include page="/manager/script.jsp" flush="true" />
</body>
</html>