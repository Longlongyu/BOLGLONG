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
  String txt = "";
  if (request.getParameter("id") != null) {
  	PostInfo info2 = post.getPostInfo(Integer.parseInt(request.getParameter("id")));
    if (user.getUserId(username) == info2.getAuthorId()) {
      info = info2;
      title = info.getTitle();
      txt = info.getContent();
    }
  }
  
%>
<!DOCTYPE html>
<html>
<head>
  <title><%=title %> | 文章编辑 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
<section id="edit-area">
  <form id="post-edit" name="post-edit" method="post" action="/BlogTest/EditServlet" onsubmit="return false;">
    <section id="">
      <a href="/BlogTest">back</a>
      <input type="text" name="title" id="postEditTitle" width="500px" value="<%=info.getTitle()%>"/>
      <input type="submit" name="button" id="submitPostEditButton" value="save" />
    </section>
   
    <div class="editormd" id="test-editormd">
      <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="postEditContent"><%=txt%></textarea>
      <textarea class="editormd-html-textarea" name="mdtext"><%=txt%></textarea>
    </div>
    <input type="hidden" name="id" value="<%=info.getId()%>" />
    <input type="hidden" name="username" value="<%=username%>" />
  
  </form>
  <output id="postEditOutPut" style="display:none;"></output>
</section>
<section>
  <div id="result">
  </div>
</section>

<%@ include file="script.jsp"%>
<script src="/BlogTest/source/editormd/lib/marked.min.js"></script>
<script src="/BlogTest/source/editormd/lib/prettify.min.js"></script>
<script src="/BlogTest/source/editormd/lib/raphael.min.js"></script>
<script src="/BlogTest/source/editormd/lib/underscore.min.js"></script>
<script src="/BlogTest/source/editormd/lib/sequence-diagram.min.js"></script>
<script src="/BlogTest/source/editormd/lib/flowchart.min.js"></script>
<script src="/BlogTest/source/editormd/lib/jquery.flowchart.min.js"></script>
<script src="/BlogTest/source/editormd/editormd.min.js"></script>
<script type="text/javascript">
  document.getElementById("submitPostEditButton").addEventListener('click', function (){
  	document.getElementById("postEditContent").value = document.getElementById("postEditContent").value.replace(/["]/g,"\\\"");
  	document.getElementById("postEditContent").value = document.getElementById("postEditContent").value.replace(/[']/g,"\\\'");
  	$_ajax.submitForm("post-edit", "postEditOutPut");
  });
  $(function() {
    editormd("test-editormd", {
        width   : "90%",
        height  : 640,
        syncScrolling : "single",
        path    : "${root}/BlogTest/source/editormd/lib/",
        //让构造出来的HTML代码直接在name="mdtext"的textarea域中，实现提交到后台获取。
        saveHTMLToTextarea : true,
        //实现图片上传
        imageUpload : true,
        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp"],
        imageUploadURL : "${root}/uploadfile"
    });
  });

</script>
</body>
</html>