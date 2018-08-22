<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%! User c_comm_user = new User();
    Post c_comm_post = new Post();
%>

<section>
<%
  request.setCharacterEncoding("utf-8");
  if (session.getAttribute("username") != null) {
    String username = (String)session.getAttribute("username");
    int p_id = Integer.parseInt(request.getParameter("p_id"));
%>
  <form  id="comment" action="/BlogTest/CommentServlet" onsubmit="return false;" method="post">
    <textarea type="textarea" rows="4" cols="100" name="comment" id="commentEditContent">
    </textarea>
    <input type="submit" name="button" id="submitCommentButton" value="save" />
    <input type="hidden" name="p_id" value="<%=p_id%>" />
    <input type="hidden" name="u_id" value="<%=c_comm_user.getUserId(username)%>" />
  </form>
  <output id="commentOutput">
  </output>
  <script>
    document.getElementById("submitCommentButton").addEventListener('click', function (){
      $_ajax.submitForm("comment", "commentOutput");
    });
  </script>
<% } else { %>
  <span>你还不能评论！请</span>
  <a href="/BlogTest/signin">登录</a>
  <a href="/BlogTest/signin">注册</a>
  <span>后重试。</span>
<% } %>
</section>