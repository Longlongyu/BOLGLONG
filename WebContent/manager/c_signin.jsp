<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="signin-panel">
  <h2>欢迎注册</h2>
  <fieldset>
    <form id="signin" action="/SigninServlet" onsubmit="return false;" method="post">
      <div class="">
        <input type="text" name="name" placeholder="用户名">
      </div>
      <small> 用户名必须以字母开头，且为6-20个字母、数字和下划线的组合</small>
      <div class="margin-top-16">
        <input type="password" name="password" placeholder="输入密码">
      </div>
      <small> 密码必须为6-20个字母和数字和组合</small>
      <div class="margin-top-16">
        <input type="text" name="email" placeholder="输入邮箱">
      </div>
      <button id="signinSubmitButton" type="submit" class="btn btn-default margin-top-32">注册</button>
      <small id="myDiv2" style="color: red;"></small>
      <div class="margin-top-32">
        <span> 点击注册即同意<a href="">BolgLong用户服务条款</a></span>
      </div>
    </form>
  </fieldset>
  <div class="margin-top-32">
    <span>已有账号？<a href="/login">我要登录</a></span>
  </div>
</section>
<script type="text/javascript">
  document.getElementById("signinSubmitButton").addEventListener('click', function (){
    $_ajax.submitForm("signin", "myDiv2");
  });
</script>