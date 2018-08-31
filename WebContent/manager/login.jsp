<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") != null) {
    response.sendRedirect("/"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>登录账号 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
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
      
      <section id="sign-page" class="container-fluid">
        <h1 class="page-header">Blog Long <small>Log in Page</small></h1>
        <%@ include file="c_login.jsp"%>
        <h4>© Longlongyu • 2018 • <a href="mailto:longlongyuu@gmail.com">longlongyuu@gmail.com</a></h4>
        <p>The site by <a href="https://github.com/Longlongyu/BOLGLONG">bloglong</a></p>
      </section>
      <%@ include file="script.jsp"%>
    </div>
  </div>
  
</body>
</html>