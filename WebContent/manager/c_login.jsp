<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="login-panel">
  <h2>欢迎登录</h2>
  <fieldset>
    <form  id="login" action="/LoginServlet" onsubmit="return false;" method="post">
      <div class="">
        <input type="text" name="name" placeholder="用户名">
      </div>
      <div class="margin-top-16">
        <input type="password" name="password" placeholder="输入密码">
      </div>
      <button id="loginSubmitButton" type="submit" class="btn btn-default margin-top-32">登录</button>
    </form>
    <div id="myDiv" style="display:none;"></div>
  </fieldset>
  <div class="margin-top-32">
    <span>已有账号？<a href="/signin">我要注册</a></span>
  </div>
</section>
  
<script type="text/javascript">
  document.getElementById("loginSubmitButton").addEventListener('click', function (){
  	$_ajax.submitForm("login", "myDiv");
  });
</script>