<%@ page language="java" contentType="text/html; charset=utf-8"
  pageEncoding="utf-8"%>

<nav class="navbar navbar-default">
  <section class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="/BlogTest">BlogLong</a>
    </div>
    <div class="collapse navbar-collapse">
      <form class="search navbar-form navbar-left">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Search</button>
      </form>
      <%
        if (session.getAttribute("username") == null ) {
      %>
        <p class="navbar-text">你还没有登录账号呢！</p>
        <button type="button" class="btn btn-default navbar-btn"><a href="signin">Sign in</a></button>
        <button type="button" class="btn btn-default navbar-btn"><a href="login">Log in</a></button>
        
      <% } else {%>
        <ul class="nav navbar-nav">
          <li role="presentation"><a href="#">Messages <span class="badge">3</span></a></li>
          <li class="dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">我的账号 <span class="caret"></span></a>
            <ul class="dropdown-menu">
              <li><a class="nav-link" href="user-page?username=<%=session.getAttribute("username")%>">我的博客</a></li>
              <li class="active"><a class="nav-link" href="post-edit">写博客</a></li>
              <li><a href="LogoutServlet">退出账号</a></li>
            </ul>
          </li>
        </ul>
      <% } %>
    </div>
  </section>
  
      
      
      
  
</nav>


