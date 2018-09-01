<%@ page language="java" import="java.util.*"
  contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="Toc" class="white-box">
  <h3 class="prefix-block">目录</h3>
  <hr>
</section>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function() {
	  var toc = document.createElement("ul");
	  toc.setAttribute("id", "table-of-content");
	  document.getElementById('Toc').appendChild(toc);
	  var stack = new Array();
	  var post = document.querySelector('.post');
	  var headers = post.querySelectorAll('h1,h2,h3,h4,h5,h6');
	  for (var i = 0; i < headers.length; i++) {
		  var header = headers[i];
		  var level = parseInt(header.tagName.replace('H', ''), 10);
		  while (stack.length < level) {
			  stack.push(0);
		  }
		  while (stack.length > level) {
			  stack.pop();
		  }
		  stack[stack.length - 1]++;
		  var index = stack.join(".")
		  var id = "title" + index;
		  header.setAttribute("id", id);
		  toc.appendChild(document.createElement("li"));
		  var a = document.createElement("a");
		  a.setAttribute("href", "#" + id)
		  a.innerHTML = new Array(level * 2).join('&nbsp;') + index + " " + header.textContent;
		  toc.lastChild.appendChild(a);
	  }
  });
</script>