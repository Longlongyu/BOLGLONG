<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") != null) {
    response.sendRedirect("/BlogTest"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>注册账号 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <section id="sign-page" class="container-fluid">
    <h1 class="page-header">Blog Long <small>Sign in Page</small></h1>
    <%@ include file="c_signin.jsp"%>
    <h4>© Longlongyu • 2018 • <a href="mailto:longlongyuu@gmail.com">longlongyuu@gmail.com</a></h4>
    <p>The site by <a href="https://github.com/Longlongyu/BOLGLONG">bloglong</a></p>
  </section>
  <%@ include file="script.jsp"%>
</body>
</html>