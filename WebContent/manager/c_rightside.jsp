<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="com.longlongyu.dal.*"%>
<%@ page import="com.longlongyu.add.*"%>
<%@ page import="com.longlongyu.Info.*"%>
<%@ page import="com.longlongyu.data.*"%>
<%!
  User user = new User();
  Post post = new Post();
%>
<nav class="navbar navbar-inverse" id="sidebar-wrapper"
  role="navigation">
  <ul class="nav sidebar-nav">
    
    <% if (session.getAttribute("username") == null ) { %>
      <li>
        <div class="nav-avatar margin-top-32">
          <img src="/source/img/logo2x.png">
        </div>
      </li>
      <li class="sidebar-brand text-align-center">
        <a href="#"> 未登录用户 </a>
      </li>
      <li><a href="/"><i class="fa fa-fw fa-home"></i> 首页</a></li>
      <li><a href="/login"><i class="fa fa-fw fa-sign-in"></i> 登录</a></li>
      <li><a href="/signin"><i class="fa fa-fw fa-plus-circle"></i> 注册</a></li>
    <% 
      } else { 
      	String name = (String) session.getAttribute("username");
    %>
      <li>
        <div class="nav-avatar margin-top-32 text-align-center">
          <div class="action"><%=BlogUtil.upperCase(name)%></div>
        </div>
      </li>
      <li class="sidebar-brand text-align-center">
        <a href="#"> <%=name%> </a>
      </li>
      <li><a href="/"><i class="fa fa-fw fa-home"></i> 首页</a></li>
      <li><a href="#"><i class="fa fa-fw fa-star"></i> 收藏</a>
      </li>
      <li><a href="/post-edit"><i class="fa fa-fw fa-edit"></i> 资料修改</a>
      </li>
      <li><a href="/user-page?username=<%=name%>"><i class="fa fa-fw fa-user"></i> 我的博客</a></li>
      <li><a href="/post-edit"><i class="fa fa-fw fa-plus-circle"></i> 写博客</a>
      </li>
      <li><a href="/add"><i class="fa fa-fw fa-sticky-note"></i> 博客管理</a>
      </li>
      <li><a href="/LogoutServlet"><i class="fa fa-fw fa-power-off"></i> 退出账号</a>
      </li>
    <% } %>
  </ul>
</nav>
<button type="button"
  class="hamburger is-closed animated pulse"
  data-toggle="offcanvas">
  <span class="hamb-top"></span> <span class="hamb-middle"></span>
  <span class="hamb-bottom"></span>
</button>
<script type="text/javascript">
	$(document).ready(function() {
	  var trigger = $('.hamburger'), overlay = $('.overlay'), isClosed = false;
	  trigger.click(function() {
		  hamburger_cross();
	  });
	  function hamburger_cross() {

		  if (isClosed == true) {
			  overlay.hide();
			  trigger.removeClass('is-open');
			  trigger.addClass('is-closed');
			  isClosed = false;
		  } else {
			  overlay.show();
			  trigger.removeClass('is-closed');
			  trigger.addClass('is-open');
			  isClosed = true;
		  }
	  }
	  $('[data-toggle="offcanvas"]').click(function() {
		  $('#wrapper').toggleClass('toggled');
	  });
  });
</script>