<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  User user = new User();
  Post post = new Post();
  Cate cate = new Cate();
  Comment comm = new Comment();
%>
<%
  List<PostInfo> post_list = new ArrayList<>();
  int curr_page = 1;

  request.setCharacterEncoding("utf-8");
  String url = "";
  String username = (String) session.getAttribute("username");
  int uid = user.getUserId(username);
  
  if (session.getAttribute("postlist") == "new") {
    post_list = new ArrayList<>();
  	session.setAttribute("postlist", null);
  }
  
  if (request.getParameter("cate") != null) {
  	int p_cate = Integer.parseInt(request.getParameter("cate"));
    
  	url += "cate=" + p_cate + "&";
  	session.setAttribute("postlist", "new");
    
  	post_list = post.getListByAuthorAndCate(uid, p_cate);
  } else {
  	post_list = post.getListByAuthor(uid);
  }
  
  if (request.getParameter("p-page") != null) {
  	int p_page = Integer.parseInt(request.getParameter("p-page"));
  	curr_page = p_page < 0 ? 1 : p_page;
  }
  
  PageCut page_cut = new PageCut(post_list, curr_page, 15);
  List<PostInfo> curr_page_posts = page_cut.getCurrPageList();
%>
<section>
<% for (PostInfo info : curr_page_posts) { %>
<article class="post">
  <h2 class="title">
    <a href="/post-edit?id=<%=info.getId()%>"><%=info.getTitle()%></a>
  </h2>
  <section class="inline-block width-48">
    <time class="date"><span class="fa fa-calendar"></span>  <%=info.getTime() %></time>
    <span> - </span>
    <span class="cate">
      <span class="fa fa-folder-o"></span> <%=cate.getCateName(info.getCate()) %>
    </span>
    <span> - </span>
    <span class="comm">
      <span class="fa fa-comment-o"></span> <%=comm.getCommentNum(info.getId()) %>
    </span>
  </section>
  <section class="inline-block width-48 text-align-right">
    <a class="btn btn-primary margin-left-16" href="/post-edit?id=<%=info.getId()%>">修改</a>
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal-<%=info.getId()%>">删除</button>
  </section>
  <hr />
</article>
<div class="modal fade" id="myModal-<%=info.getId()%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">提示</h4>
      </div>
      <div class="modal-body"> 确认删除 【<%=info.getTitle()%>】？ </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
        <button id="delete-submit-<%=info.getId()%>" type="button" class="btn btn-primary">确认</button>
        <form id="delete-<%=info.getId()%>" name="delete" method="post" action="/DeleteServlet" onsubmit="return false;">
          <input type="hidden" name="id" value="<%=info.getId()%>" />
          <input type="hidden" name="username" value="<%=username%>" />
        </form>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
  document.getElementById("delete-submit-<%=info.getId()%>").addEventListener('click', function (){
    $_ajax.submit("delete-<%=info.getId()%>", function(text) {
      if (text == "success") {
      	location.reload();
      }
	});
  });
</script>
<% } %>
</section>
<section id="page-nav">
  <a href="?<%=url %>p-page=1"><span class="glyphicon glyphicon-step-backward"></span></a>
    <% if (page_cut.getStartPageNum() != 1) {%>
      <span>...</span>
    <%  } for (int i = page_cut.getStartPageNum(); i <= page_cut.getEndPageNum(); i++) { %>
      <a href="?<%=url %>p-page=<%=i %>"><%=i %></a>
    <% } %>
    
    <% if (page_cut.getTotalPages() != page_cut.getEndPageNum()) { %>
      <span>...</span>
    <% } %>
  <a href="?<%=url %>p-page=<%=page_cut.getEndPageNum() %>"><span class="glyphicon glyphicon-step-forward"></span></a>
</section>