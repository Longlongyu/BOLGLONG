<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<p><%=session.getAttribute("username")%>,欢迎您来到博客龙！</p>
<p>当前在线人数为 ${num} 人！</p>
<a href="post-edit">写博客</a>
<a href="">我的博客</a>
<a href="LogoutServlet">退出账号</a>