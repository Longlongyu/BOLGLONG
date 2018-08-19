<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%
 session.setAttribute("title","博客龙 - 想成为你钟爱的博客社区！");
%>
<%@ include file="b_head.jsp"%>
<body>
  <%
    String username = (String) session.getAttribute("username");
  	if (username != null) {
  %>
    <%@ include file="c_nav.jsp"%>
  <% } else { %>
  
    <%@ include file="c_login.jsp"%>
    <%@ include file="c_signin.jsp"%>
  
  <% } %>
</body>
</html>