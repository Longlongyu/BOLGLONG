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
    <jsp:include page="c_nav.jsp" flush="true" />
    <div id="page-content-wrapper" class="animated slideInUp">
      <section class="container margin-top-64">
        <section class="row">
          <div id="posts-box" class="col-xs-8 col-md-9">
          </div>
          <div class="col-xs-4 col-md-3">
            <jsp:include page="c_showtime.jsp" flush="true" />
            <jsp:include page="c_catenav.jsp" flush="true" />
            <jsp:include page="c_newposts.jsp" flush="true" />
          </div>
        </section>
      </section>
      <jsp:include page="b_footer.jsp" flush="true" />
      <jsp:include page="script.jsp" flush="true" />
      <jsp:include page="b_post.jsp" flush="true" />
    </div>
  </div>
  <jsp:include page="c_side.jsp" flush="true" />
</body>
</html>