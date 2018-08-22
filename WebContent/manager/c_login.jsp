<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<fieldset>
  <form  id="login" action="/BlogTest/LoginServlet" onsubmit="return false;" method="post">
    <label>Login</label><br> <br>
    <label>username: </label>
    <input type="text" name="name" /><br>
    <label>password: </label>
    <input type="password" name="password" /><br>
    <input id="loginSubmitButton" type="submit" value="log in" />
  </form>
  <div id="myDiv"></div>
</fieldset>

  
<script type="text/javascript">
  document.getElementById("loginSubmitButton").addEventListener('click', function (){
  	$_ajax.submitForm("login", "myDiv");
  });
</script>