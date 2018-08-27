<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  CateInfo cateinfo = new CateInfo();
  List<CateInfo> catelist = new ArrayList<>();
  Post post = new Post();
  User user = new User();
  Cate cate = new Cate();
%>
<%
  request.setCharacterEncoding("utf-8"); 
  String username = (String)session.getAttribute("username");
  String title = "未命名文章";
  String txt = "";
  PostInfo info = new PostInfo();
  if (request.getParameter("id") != null) {
  	PostInfo info2 = post.getPostInfo(Integer.parseInt(request.getParameter("id")));
    if (user.getUserId(username) == info2.getAuthorId()) {
      info = info2;
      title = info.getTitle();
      txt = info.getContent();
    }
  }
  if (catelist.isEmpty()) {
  	catelist = cate.getCates();
  }
  int hide_cate = 1;
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
    <div class="margin-left-128">
      <input type="text" name="title" id="postEditTitle" maxlength="30" placeholder="请输入标题" value="<%=info.getTitle()%>"/>
      <select id="selectCate">
        <% for (CateInfo cateinfo : catelist) { %>
          <option value ="<%=cateinfo.getCateId() %>"
          <% if (request.getParameter("id") != null && info.getCate() == cateinfo.getCateId()) { 
            hide_cate = cateinfo.getCateId();
          %>
            selected = "selected"
          <% } %>
          ><%=cateinfo.getCateName() %></option>
        <% } %>
      </select>
    </div>
   
    <div class="editormd" id="test-editormd">
      <textarea class="editormd-markdown-textarea" name="test-editormd-markdown-doc" id="postEditContent"><%=txt%></textarea>
      <textarea class="editormd-html-textarea" name="mdtext"><%=txt%></textarea>
    </div>
    <input type="hidden" name="id" value="<%=info.getId()%>" />
    <input type="hidden" name="username" value="<%=username%>" />
    <input type="hidden" name="cate" value="<%=hide_cate%>" id="catevlue"/>
    <a href="/BlogTest" class="btn btn-default margin-left-128" >返回首页</a>
    <a id="submitPostEditButton" tabindex="0" class="btn btn-danger margin-left-32" 
        role="button" data-toggle="popover" data-trigger="focus"
        data-content="">存储</a>
  </form>
  <output id="postEditOutPut" style="display:none;"></output>
</section>

<%@ include file="script.jsp"%>
<script src="/BlogTest/source/editormd/lib/prettify.min.js"></script>
<script src="/BlogTest/source/editormd/lib/raphael.min.js"></script>
<script src="/BlogTest/source/editormd/lib/underscore.min.js"></script>
<script src="/BlogTest/source/editormd/lib/sequence-diagram.min.js"></script>
<script src="/BlogTest/source/editormd/lib/flowchart.min.js"></script>
<script src="/BlogTest/source/editormd/lib/jquery.flowchart.min.js"></script>
<script src="/BlogTest/source/editormd/editormd.min.js"></script>
<script type="text/javascript">
  $("#selectCate").change(function(){
  	$('#catevlue').val($('#selectCate option:selected').val());
  });
  document.getElementById("submitPostEditButton").addEventListener('click', function (){
  	document.getElementById("postEditContent").value = document.getElementById("postEditContent").value.replace(/["]/g,"\\\"");
  	document.getElementById("postEditContent").value = document.getElementById("postEditContent").value.replace(/[']/g,"\\\'");
  	document.getElementById("submitPostEditButton").setAttribute("data-content", "存储中...");
  	$('#submitPostEditButton').popover('show')
  	$_ajax.submit("post-edit", function(text) {
  	  if (text == "success") {
  	  	document.getElementById("submitPostEditButton").setAttribute("data-content", "存储成功!");
  	  } else if (text == "user error") {
  	  	document.getElementById("submitPostEditButton").setAttribute("data-content", "失败！请登录后再试!");
  	  } else {
  	  	document.getElementById("submitPostEditButton").setAttribute("data-content", "存储失败!");
  	  }
  	  $('#submitPostEditButton').popover('show')
  	});
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
        imageUpload : false,
        imageFormats : ["jpg", "jpeg", "gif", "png", "bmp"],
        imageUploadURL : "${root}/uploadfile"
    });
  });

</script>
</body>
</html>