<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<nav id="mainNav" class="navbar nav-bd">
  <div class="navbar-header margin-left-128">
    <a class="navbar-brand" href="/">
      <img alt="bloglong" src="/source/img/bokelong2.png">
    </a>
  </div>
  <section class="container">
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li role="presentation" class="active"><a href="/">首页</a></li>
        <li role="presentation"><a href="">问答</a></li>
        <li role="presentation"><a href="">论坛</a></li>
        <li role="presentation"><a href="">App</a></li>
        <li role="presentation"><a href="">活动</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li class="margin-right-32">
          <form class="form-search navbar-right" role="search">
            <label class="label-search">
              <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
            </label>
            <input type="text" class="form-control input-search" placeholder="搜一下...">
          </form>
        </li>
        <% if (session.getAttribute("username") == null ) { %>
          <li><a href="/signin">注册账号</a></li>
          <li><a href="/login">登录社区</a></li>
        <% } else { %>
          <li role="presentation"><a href="#">消息 <span class="badge">3</span></a></li>
          <li role="presentation"><a href="#"><%=session.getAttribute("username")%></a></li>
        <% } %>
      </ul>
    </div>
  </section>
</nav>


