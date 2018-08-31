<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>博客龙 - 想成为你钟爱的博客社区！</title>
<jsp:include page="b_head.jsp" flush="true" />
</head>
<body>
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <jsp:include page="c_nav.jsp" flush="true" />
      <section class="container margin-top-64">
        <section class="row">
          <div class="col-xs-12 col-sm-6 col-md-8">
            <jsp:include page="c_posts.jsp" flush="true" />
          </div>
          <div class="col-xs-6 col-md-3">
            <jsp:include page="c_catenav.jsp" flush="true" />
            <jsp:include page="c_newposts.jsp" flush="true" />
          </div>
          <div class="col-xs-1">
            <jsp:include page="c_side.jsp" flush="true" />
          </div>
        </section>
      </section>
      <jsp:include page="b_footer.jsp" flush="true" />
      <jsp:include page="script.jsp" flush="true" />
    </div>
  </div>
</body>
</html>