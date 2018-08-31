<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") == null) {
    response.sendRedirect("/"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=session.getAttribute("username") %> | 管理文章 - 博客龙</title>
  <jsp:include page="/manager/b_head.jsp" flush="true" />
</head>
<body>
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="/manager/c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <button type="button"
        class="hamburger is-closed animated fadeInLeft"
        data-toggle="offcanvas">
        <span class="hamb-top"></span> <span class="hamb-middle"></span>
        <span class="hamb-bottom"></span>
      </button>
      
      <jsp:include page="/manager/c_nav.jsp" flush="true" />
      <section class="container-fluid">
        <section class="row">
          <div class="col-xs-6 col-md-3">
            <jsp:include page="/manager/c_catenav.jsp" flush="true" />
            <jsp:include page="/manager/c_newposts.jsp" flush="true" />
          </div>
          <div class="col-xs-12 col-sm-6 col-md-8 shadow-box">
            <jsp:include page="/manager/c_mangerposts.jsp" flush="true" />
          </div>
          <div class="col-xs-1">
            <jsp:include page="/manager/c_side.jsp" flush="true" />
          </div>
        </section>
      </section>
      <jsp:include page="/manager/b_footer.jsp" flush="true" />
      <jsp:include page="/manager/script.jsp" flush="true" />
    </div>
  </div>
  
</body>
</html>