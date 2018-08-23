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
  <%@ include file="c_signin.jsp"%>
  <%@ include file="script.jsp"%>
</body>
</html>