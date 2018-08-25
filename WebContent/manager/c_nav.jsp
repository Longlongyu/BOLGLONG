<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>

<nav id="logoNav" class="navbar navbar-static-top">
  <section class="container">
    <div class="navbar-header">
      <a class="navbar-brand" href="/BlogTest">
        <img alt="BlogLong" src="/BlogTest/source/img/logo.png">
      </a>
    </div>
    <h3 class="navbar-text relative-top-36">想成你钟爱的博客社区！</h3>
    <form class="form-search navbar-right relative-top-36" role="search">
      <label class="label-search">
        <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
      </label>
      <input type="text" class="form-control input-search" placeholder="搜一下...">
    </form>
  </section>
</nav>
<nav class="navbar navbar-static-top nav-bd">
  <section class="container">
    <div class="collapse navbar-collapse">
      <ul class="nav nav-pills navbar-left relative-top-11">
        <li role="presentation" class="active disabled"><a href="/BlogTest">首页</a></li>
        <li role="presentation"><a href="#">问答</a></li>
        <li role="presentation"><a href="#">论坛</a></li>
        <li role="presentation"><a href="#">App</a></li>
        <li role="presentation"><a href="#">最新活动</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <%
          if (session.getAttribute("username") == null ) {
        %>
          <li><a href="signin">注册</a></li>
          <li><a href="login">登录</a></li>
        <% } else {%>
          <li role="presentation"><a href="#">消息 <span class="badge">3</span></a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false"><%=session.getAttribute("username")%> <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="user-page?username=<%=session.getAttribute("username")%>">我的博客</a></li>
              <li><a class="nav-link" href="post-edit">写博客</a></li>
              <li><a class="nav-link" href="">博客管理</a></li>
              <li><a href="LogoutServlet">退出账号</a></li>
            </ul>
          </li>
        <% } %>
      </ul>
    </div>
  </section>
</nav>


