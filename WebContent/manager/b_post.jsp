<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<script>
  $(document).ready(function(){
    $.ajax({
      type : "POST",
      url : "/manager/f_posts.jsp?<%=request.getQueryString()%>&req=all",
      data : {},
      dataType: "json",
      success : function(data) {
      	var posts = $("<section class='white-box'></section>").appendTo($("#posts-box"));
      	var nav = $("<section id='page-nav' class='margin-top-32'></section>").appendTo($("#posts-box"));
      	$.each(data[0],function(key,value){
      	  var article = $('<article class="posts"></article>').appendTo(posts);
      	  var title = $('<h2 class="title"></h2>').appendTo(article);
      	  title.append('<a href="post/' + value.authorName + '?p_id=' + value.pid + '">' + value.title + '</a>')
      	  var split = '<span> - </span>';
          <% if (request.getParameter("username") == null) { %>
          	var a_url = 'user-page?username=' + value.authorName;
          	article.append('<span class="author"><span class="fa fa-pencil"></span> <a href="' + a_url + '">' + value.authorName + '</a></span>')
          	article.append(split);
          <% } %>
          article.append('<time class="date"><span class="fa fa-calendar"></span> ' + value.time + '</time>');
          article.append(split);
          article.append('<span class="cate"><span class="fa fa-folder-o"></span> ' + value.cateName + '</span>');
          article.append(split);
          article.append('<span class="comm"><span class="fa fa-comment-o"></span> ' + value.commentNum + '</span>');
          article.append(split);
          article.append('<span class="pcount"><span class="fa fa-user-o"></span> ' + value.count + '</span>');
          article.append('<article class="post-article margin-top-16">' + value.content + '</article>');
          var b_url = 'post/' + value.authorName + '?p_id=' + value.pid + '#more';
          article.append('<p class="post-readbtn margin-top-32"><a href="' + b_url + ' class="more">Read More</a></p>');
      	});
      	{
      	  var nv = data.nav;
          var url = '?' + nv.url + 'p-page=';
      	  nav.append('<a href="' + url + '1"><span class="glyphicon glyphicon-step-backward"></span></a>');
      	  for (var i = nv.startPageNum; i <= nv.endPageNum; i++) {
      	    nav.append('<a href="' + url + i + '">' + i +'</a>');
      	  }
      	  nav.append('<a href="' + url + nv.endPageNum +'"><span class="glyphicon glyphicon-step-forward"></span></a>');
      	}
      	$(".post-article").each(function() {
        	$(this).html(marked($(this).html()))
        });
      },
    });
  });
  
</script>