<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%
  request.setCharacterEncoding("utf-8");
  User user = new User();
  Post post = new Post();
  PostInfo info = new PostInfo();
  List<PostInfo> postlist = post.getList("");
  boolean result = false;
  String title = request.getParameter("title");
  for (PostInfo postinfo : postlist) {
  	String url = "/BlogTest/post/" + user.getUserinfo(postinfo.getAuthorId()).getUsername();
    String requestURI = request.getRequestURI();
    if (requestURI.equals(url) && postinfo.getTitle().equals(title)) {
      info = postinfo;
      result = true;
      break;
    }
  }
  if (!result) {
  	response.sendRedirect("/BlogTest");
  }
%>
<!DOCTYPE html>
<html>
<%
  session.setAttribute("title", info.getTitle() + " - 博客龙");
%>
<%@ include file="b_head.jsp"%>
<body>
  <p><%=info.getTitle()%></p>
  <p>创作时间：<%=info.getCreatedate()%></p>
  <p>作者：<%=user.getUserinfo(info.getAuthorId()).getUsername()%></p>
  <p>
    <%=info.getContent()%>
  </p>
  <a href="/BlogTest">back</a>
</body>
</html>