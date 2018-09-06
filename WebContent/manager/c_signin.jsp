<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="sign-panel" class="animated bounceIn delay-2s">
  <h2>欢迎注册</h2>
  <fieldset>
    <form id="signin" action="/SigninServlet" onsubmit="return false;" method="post">
      <div>
        <input type="text" name="name" placeholder="用户名" >
      </div>
      <small> 用户名必须为5-20个字母、数字、汉字和下划线的组合</small>
      <div>
        <input type="password" name="password" placeholder="输入密码">
      </div>
      <small> 密码必须为6-20个字母和数字和组合</small>
      <div>
        <input type="text" name="email" placeholder="输入邮箱">
      </div>
      <jsp:include page="/manager/c_slidebox.jsp" flush="true" />
      <button id="signinSubmitButton" type="submit" class="btn btn-default margin-top-32" disabled="disabled">注册</button>
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
  $(function () {
  	$('[name="name"][type="text"]').blur(function(){
  	  if (!$(this).val()) return;
  	  $(this).popover('destroy');
  	  $.ajax({
        type : 'POST',
        url : '/Proof?name='+$(this).val(),
        success : function(text) {
          $('[name="name"][type="text"]').popover({
            html: true,
        	trigger: 'manual',
        	placement: 'auto right',
        	content: text=='right'?'<i class="fa fa-check" style="color: #20c997;"></i>':text});
          $('[name="name"][type="text"]').popover('show');
          setTimeout(function(){
          	$('[name="name"][type="text"]').popover('hide');
          	$('[name="name"][type="text"]').popover('destroy');
          },1500);
        },
        error : function(text) {
          $('[name="name"][type="text"]').popover({
            html: true,
        	trigger: 'manual',
        	placement: 'auto right',
        	content: '<i class="fa fa-error" style="color: #ff6b6b;"></i>'});
          $('[name="name"][type="text"]').popover('show');
          setTimeout(function(){
          	$('[name="name"][type="text"]').popover('hide');
          	$('[name="name"][type="text"]').popover('destroy');
          },1500);
        },
      });
  	});
  });
  document.getElementById('signinSubmitButton').addEventListener('click', function (){
    $_ajax.submitForm('signin', 'myDiv2');
  });
</script>