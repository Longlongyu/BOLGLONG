<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<%
 session.setAttribute("title","首页 - ");
%>
<%@ include file="b_head.jsp"%>
<body>
  <%
    String username = (String) session.getAttribute("username");
  	if (username != null) {
  %>
    <p><%=username %>,欢迎您来到博客龙！</p>
    <p>当前在线人数为 ${num} 人！</p>
  <% } else { %>
  
    <%@ include file="c_login.jsp"%>
    <%@ include file="c_signin.jsp"%>
  
  <% } %>
</body>
</html>