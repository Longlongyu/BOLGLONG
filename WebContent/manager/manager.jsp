<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") == null) {
    response.sendRedirect("/BlogTest"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=session.getAttribute("username") %> | 管理文章 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <%@ include file="c_nav.jsp"%>
  <section class="container-fluid">
    <section class="row">
      <div class="col-xs-6 col-md-3">
        <%@ include file="c_catenav.jsp"%>
        <%@ include file="c_newposts.jsp"%>
      </div>
      <div class="col-xs-12 col-sm-6 col-md-8 shadow-box">
        <%@ include file="c_mangerposts.jsp"%>
      </div>
    </section>
  </section>
  <%@ include file="b_footer.jsp"%>
  <%@ include file="script.jsp"%>
</body>
</html>