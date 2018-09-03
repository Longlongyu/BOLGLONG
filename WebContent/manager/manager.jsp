<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") == null) {
    response.sendRedirect("/login"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=session.getAttribute("username") %> | 管理文章 - 博客龙</title>
  <jsp:include page="/manager/b_head.jsp" flush="true" />
</head>
<body>
  <jsp:include page="/manager/c_side.jsp" flush="true" />
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="/manager/c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <jsp:include page="/manager/c_nav.jsp" flush="true" />
      <section class="container margin-top-64">
        <jsp:include page="/manager/b_table.jsp" flush="true" />
      </section>
      <jsp:include page="/manager/b_footer.jsp" flush="true" />
      <jsp:include page="/manager/script.jsp" flush="true" />
    </div>
  </div>
  
</body>
</html>