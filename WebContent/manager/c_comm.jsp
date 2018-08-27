<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User c_comm_user = new User();
    Post c_comm_post = new Post();
    Comment c_comm = new Comment();
%>

<section class="shadow-box margin-top-64">
<%
  request.setCharacterEncoding("utf-8");
  if (session.getAttribute("username") != null) {
    String username = (String)session.getAttribute("username");
    int p_id = Integer.parseInt(request.getParameter("p_id"));
%>
  <h2 class="prefix-block">讨论这篇文章(<%=c_comm.getCommentNum(p_id) %>) <small>快来发表你的想法</small></h2>
  <form  id="comment" action="/BlogTest/CommentServlet" onsubmit="return false;" method="post">
    <textarea type="textarea" rows="4" cols="100" name="comment" id="commentEditContent" placeholder="您有什么想法要说的吗？"></textarea>
    <div class="text-align-right">
      <input class="btn btn-primary" type="submit" name="button" id="submitCommentButton" value="发表评论" />
    </div>
    <input type="hidden" name="p_id" value="<%=p_id%>" />
    <input type="hidden" name="u_id" value="<%=c_comm_user.getUserId(username)%>" />
  </form>
<% } else { %>
  <section class="text-box">
    <span>你还不能评论！请</span>
    <a href="/BlogTest/login">登录</a>
    <a href="/BlogTest/signin">注册</a>
    <span>后重试。</span>
  </section>
<% } %>
</section>
<%@ include file="c_comments.jsp"%>
<script>
  document.getElementById("submitCommentButton").addEventListener('click', function (){
    $_ajax.submit("comment", function (text) {
      var conn = document.getElementById("comments-list")
      conn.innerHTML = $_main.outputComment(text) + conn.innerHTML;
    });
  });
</script>

