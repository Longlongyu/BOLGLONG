<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User c_comments_user = new User();
    Post c_comments_post = new Post();
    Comment c_comments_comm = new Comment();
%>
<section class="shadow-box margin-top-64">
  <%
  List<CommentInfo> commentlist = c_comments_comm.getCommentByPost(Integer.parseInt(request.getParameter("p_id")));
  int c_count = c_comments_comm.getCommentNum(Integer.parseInt(request.getParameter("p_id")));
  %>
  <h2 class="prefix-block margin-bottom-16">评论:</h2>
  <section id="comments-list">
  <% if(commentlist.isEmpty()) {%>
    <section class="text-box">
      <span>想做第一个评论的人吗？</span>
    </section>
  <% } %>
  <%
    for (CommentInfo cinfo : commentlist) {
  %>
    <section class="comment margin-bottom-16" date-floor="<%=c_count%>">
      <div class="action"><%=BlogUtil.upperCase(c_comments_user.getUserName(cinfo.getUserId())) %></div>
      <div class="action-comment inline-block margin-left-16">
        <h3 class="comment-user margin-0">
          <%=c_comments_user.getUserName(cinfo.getUserId()) %>
          <small>- <%=c_count-- %> -</small>
        </h3>
        <time class="comment-time">
          <span class="fa fa-clock-o"></span>
          <%=cinfo.getCommentDate() %>
        </time>
        <div class="comment-content">
          <%=cinfo.getComment() %>
        </div>
        <div class="text-align-right">
          <a href="#" class="navbar-link">回复</a>
        </div>
      </div>
      <hr>
    </section>
  <% } %>
  </section>
</section>
