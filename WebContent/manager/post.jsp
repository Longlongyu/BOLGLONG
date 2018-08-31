<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! 
  User user = new User();
  Post post = new Post();
%>
<%
  PostInfo post_info = new PostInfo();
  List<PostInfo> post_list = new ArrayList<>();
  request.setCharacterEncoding("utf-8");
  
  if (post_list.isEmpty()) {
  	post_list = post.getList("");
  }
  boolean result = false;
  for (PostInfo postinfo : post_list) {
  	int post_id = Integer.parseInt(request.getParameter("p_id"));
  	String url = "/post/" + user.getUserName(postinfo.getAuthorId());
    String requestURI = request.getRequestURI();
    if (requestURI.equals(url) && postinfo.getId() == post_id) {
      post_info = postinfo;
      result = true;
      break;
    }
  }
  if (!result) {
  	response.sendRedirect("/");
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=post_info.getTitle() %> - 博客龙</title>
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
          <div class="col-xs-12 col-sm-6 col-md-8">
            <section class="shadow-box">
              <h1><%=post_info.getTitle()%></h1>
              <p>创作时间：<%=post_info.getTime()%></p>
              <p>作者：<%=user.getUserName(post_info.getAuthorId())%></p>
              <p id="pcount"></p>
              <hr>
              <article class="post"><%=post_info.getContent()%></article>
            </section>
            <jsp:include page="/manager/c_comm.jsp" flush="true" />
          </div>
          <div class="col-xs-1">
            <jsp:include page="/manager/c_side.jsp" flush="true" />
          </div>
        </section>
      </section>
      <jsp:include page="/manager/b_footer.jsp" flush="true" />
      
    </div>
  </div>
  <jsp:include page="/manager/script.jsp" flush="true" />
  <script>
    $(".post").each(function() {
      $(this).html(marked($(this).html()))
    });
    <% 
      String pid = request.getParameter("p_id");
      if (pid != null) { 
    %>
      $(document).ready(function(){
      	var pid = <%=pid%>;//获取文档ID
        $.ajax({
          type : "POST",
          url : "/manager/c_count.jsp?p_id=" + pid,
          data : {},
          dataType: "json",
          success : function(data) {
          	console.log(data);
      	  	$('#pcount').text('访问量：' + data.count); //设置文档的访问量
          },
        });
      });
    <% } %>
  </script>
</body>
</html>