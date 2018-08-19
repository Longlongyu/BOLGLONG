<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<fieldset>
  <form  id="signin" action="/BlogTest/SigninServlet" onsubmit="return false;" method="post">
    <label>Sign in</label><br> <br>
    <label>username: </label>
    <input type="text" name="name" /><br>
    <small>Username must consist of 6 to 20 English letters, numbers, and underscores.</small><br>
    <label>password: </label>
    <input type="password" name="password" /><br>
    <label>again: </label>
    <input type="password" name="again" /><br>
    <small>The password must be composed of 6 to 20 English letters and numbers.</small><br>
    <label>email: </label>
    <input type="text" name="email" /><br>
    <input id="signinSubmitButton" type="submit" value="Sign in" />
  </form>
  <div id="myDiv2"></div>
</fieldset>

  
<script>
  document.getElementById("signinSubmitButton").addEventListener('click', function (){
    $_ajax.submitForm("signin", "myDiv2");
  });
</script>