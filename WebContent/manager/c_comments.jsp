<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  User user = new User();
  Post post = new Post();
  Comment comm = new Comment();
%>
<section class="shadow-box margin-top-64">
  <%
    int p_id = Integer.parseInt(request.getParameter("p_id"));
    List<CommentInfo> commentlist = comm.getCommentByPost(p_id);
    int count = comm.getCommentNum(p_id);
  %>
  <h2 class="prefix-block margin-bottom-16">评论:</h2>
  <section id="comments-list">
  <% if(commentlist.isEmpty()) { %>
    <section class="text-box">
      <span>想做第一个评论的人吗？</span>
    </section>
  <% } %>
  <%
    for (CommentInfo cinfo : commentlist) {
  %>
    <section class="comment margin-bottom-16" date-floor="<%=count%>">
      <div class="action"><%=BlogUtil.upperCase(user.getUserName(cinfo.getUserId())) %></div>
      <div class="action-comment inline-block margin-left-16">
        <h3 class="comment-user margin-0">
          <%=user.getUserName(cinfo.getUserId()) %>
          <small>- <%=count-- %> -</small>
        </h3>
        <time class="comment-time">
          <span class="fa fa-clock-o"></span>
          <%=cinfo.getCommentDate() %>
        </time>
        <div class="comment-content">
          <%=cinfo.getComment() %>
        </div>
      </div>
      <div class="text-align-right">
        <a class="navbar-link margin-right-32">回复</a>
        <% 
          String username = (String)session.getAttribute("username");
          if (request.getParameter("p_id") != null && user.getPower(username) == 0) {
        %>
          <form id="commDelete" action="/CommDeleteServlet" onsubmit="return false;" method="post">
            <a class="navbar-link margin-right-32">删除</a>
            <input type="hidden" name="c_id" value="<%=cinfo.getId()%>" />
            <input type="hidden" name="p_id" value="<%=p_id%>" />
          </form>
        <% } %>
      </div>
      <hr>
    </section>
  <% } %>
  </section>
</section>
