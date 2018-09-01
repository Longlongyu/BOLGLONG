<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") != null) {
    response.sendRedirect("/"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>注册账号 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="/manager/c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <jsp:include page="/manager/c_nav.jsp" flush="true" />
      <section id="sign-page">
        <%@ include file="c_signin.jsp"%>
        <jsp:include page="/manager/script.jsp" flush="true" />
      </section>
    </div>
  </div>
  
</body>
</html>