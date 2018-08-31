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
  String name = (String) session.getAttribute("username");
  
  if (session.getAttribute("postlist") == "new") {
    post_list = new ArrayList<>();
    session.setAttribute("postlist", null);
  }
  
  if (request.getParameter("username") != null) {
    int uid = user.getUserId(name);
    name = request.getParameter("username");
    url = "username=" + name + "&";
    post_list = post.getListByAuthor(uid); 
  } else if (post_list.isEmpty()) {
    String keyword = request.getParameter("keyword");
    post_list = post.getList(keyword);
  }
  
  if (request.getParameter("cate") != null) {
    int p_cate = Integer.parseInt(request.getParameter("cate"));
    int uid = user.getUserId(name);
    url += "cate=" + p_cate + "&";
    session.setAttribute("postlist", "new");
    if (request.getParameter("username") != null) {
      post_list = post.getListByAuthorAndCate(uid, p_cate);
    } else {
      post_list = post.getListByCate(p_cate);
    }
  }
  
  if (request.getParameter("p-page") != null) {
    int p_page = Integer.parseInt(request.getParameter("p-page"));
    curr_page = p_page < 0 ? 1 : p_page;
  }
  PageCut page_cut = new PageCut(post_list, curr_page, 10);
  List<PostInfo> curr_page_posts = page_cut.getCurrPageList();
%>
<section class="white-box">
  <%
    for (PostInfo info : curr_page_posts) {
    	String aname = user.getUserName(info.getAuthorId());
  %>
  <article class="post">
    <h2 class="title">
      <a href="post/<%=aname%>?p_id=<%=info.getId()%>"><%=info.getTitle()%></a>
    </h2>
    <% if (request.getParameter("username") == null) { %>
    <span class="author">
      <span class="fa fa-pencil"></span>  <a href="user-page?username=<%=aname%>"><%=aname%></a>
    </span>
    <span> - </span>
    <% } %>
    
    <time class="date"><span class="fa fa-calendar"></span>  <%=info.getTime() %></time>
    <span> - </span>
    <span class="cate">
      <span class="fa fa-folder-o"></span> <%=cate.getCateName(info.getCate()) %>
    </span>
    <span> - </span>
    <span class="comm">
      <span class="fa fa-comment-o"></span> <%=comm.getCommentNum(info.getId()) %>
    </span>
    <span> - </span>
    <span class="pcount">
      <span class="fa fa-user-o"></span> <%=info.getCount()%>
    </span>
    
    <article class="post-article margin-top-16"><%=BlogUtil.Substring(info.getContent(), 300)%></article>
    <p class="post-readbtn margin-top-32">
      <a href="post/<%=aname%>?p_id=<%=info.getId()%>#more" class="more">Read More</a>
    </p>
    <hr />
  </article>
  <% } %>
</section>
<section id="page-nav" class="margin-top-32">
    <a href="?<%=url %>p-page=1"><span class="glyphicon glyphicon-step-backward"></span></a>
    <% if (page_cut.getStartPageNum() != 1) { %>
      <span>...</span>
    <%	
      }
      for (int i = page_cut.getStartPageNum(); i <= page_cut.getEndPageNum(); i++) {
    %>
      <a href="?<%=url %>p-page=<%=i %>"><%=i %></a>
    <% } %>
    
    <% if (page_cut.getTotalPages() != page_cut.getEndPageNum()) { %>
      <span>...</span>
    <% } %>
    <a href="?<%=url %>p-page=<%=page_cut.getEndPageNum() %>"><span class="glyphicon glyphicon-step-forward"></span></a>
</section>
<script>
  $(".post-article").each(function() {
  	$(this).html(marked($(this).html()))
  });
</script>
