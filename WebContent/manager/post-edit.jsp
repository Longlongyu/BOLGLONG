<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%
  request.setCharacterEncoding("utf-8");
  
  PostInfo info = new PostInfo();
  Post post = new Post();
  User user = new User();
  String username = (String)session.getAttribute("username");
  String title = "未命名文章";
  if (request.getParameter("id") != null) {
  	PostInfo info2 = post.getPostInfo(Integer.parseInt(request.getParameter("id")));
    if (user.getUserinfo(username).getUserid() == info2.getAuthorId()) {
      info = info2;
      title = info.getTitle();
    }
  }
  
%>
<!DOCTYPE html>
<html>
<%
  session.setAttribute("title",title + " - 博客龙");
%>
<%@ include file="b_head.jsp"%>
<body>
<p>Blog post edit:</p>
<form id="post-edit" name="post-edit" method="post" action="/BlogTest/EditServlet" onsubmit="return false;">
  <table>
    <tr>
      <td>Blog title</td>
      <td>
        <input type="text" name="title" id="postEditTitle" width="500px" value="<%=info.getTitle()%>" />
      </td>
    </tr>
    <tr>
      <td>Blog content</td>
      <td>
        <textarea type="textarea" rows="4" cols="100" name="content" id="postEditContent">
          <%=info.getContent()%>
        </textarea>
      </td>
    </tr>

    <tr>
      <td colspan="2">
        <input type="submit" name="button" id="submitPostEditButton" value="save" />
        <input type="reset" name="button" id="resetPostEditButton" value="reset" />
        <input type="hidden" name="id" value="<%=info.getId()%>" />
        <input type="hidden" name="username" value="<%=username%>" />
      </td>
    </tr>
  </table>
</form>
<output id="postEditOutPut"></output>
<br>
<a href="/BlogTest">back</a>


<script>
  document.getElementById("submitPostEditButton").addEventListener('click', function (){
    $_ajax.submitForm("post-edit", "postEditOutPut");
  });
</script>
</body>
</html>