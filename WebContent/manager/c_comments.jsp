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
<section>
  <%
  List<CommentInfo> commentlist = c_comments_comm.getCommentByPost(Integer.parseInt(request.getParameter("p_id")));
  %>
  <%
    for (CommentInfo cinfo : commentlist) {
  %>
    <section class="comment">
      <span class="comment-user">
        <%=c_comments_user.getUserName(cinfo.getUserId()) %>
      </span>
      <time class="comment-time">
  	  <%=cinfo.getCommentDate() %>
      </time>
      <p class="comment-content">
        <%=cinfo.getComment() %>
      </p>
    </section>
  <% } %>
</section>
