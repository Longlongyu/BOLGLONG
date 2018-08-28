<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User post_user = new User();
    Post post_post = new Post();
    PostInfo post_post_info = new PostInfo();
    List<PostInfo> post_post_list = new ArrayList<>();
%>

<%
  request.setCharacterEncoding("utf-8");
  
  if (post_post_list.isEmpty()) {
  	post_post_list = post_post.getList("");
  }
  boolean result = false;
  for (PostInfo postinfo : post_post_list) {
  	int post_id = Integer.parseInt(request.getParameter("p_id"));
  	String url = "/BlogTest/post/" + post_user.getUserName(postinfo.getAuthorId());
    String requestURI = request.getRequestURI();
    if (requestURI.equals(url) && postinfo.getId() == post_id) {
      post_post_info = postinfo;
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
<head>
  <title><%= post_post_info.getTitle() %> - 博客龙</title>
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
      <div class="col-xs-12 col-sm-6 col-md-8">
        <section class="shadow-box">
          <h1><%=post_post_info.getTitle()%></h1>
          <p>创作时间：<%=post_post_info.getTime()%></p>
          <p>作者：<%=post_user.getUserName(post_post_info.getAuthorId())%></p>
          <hr>
          <article class="post"><%=post_post_info.getContent()%></article>
        </section>
        <%@ include file="c_comm.jsp"%>
      </div>
      <div class="col-xs-1">
        <%@ include file="c_side.jsp"%>
      </div>
    </section>
  </section>
  <%@ include file="b_footer.jsp"%>
  <%@ include file="script.jsp"%>
  <script>
    $(".post").each(function() {
      $(this).html(marked($(this).html()))
    });
  </script>
</body>
</html>