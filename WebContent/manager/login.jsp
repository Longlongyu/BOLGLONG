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
  <title>登录账号 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <%@ include file="c_login.jsp"%>
  <%@ include file="script.jsp"%>
</body>
</html>