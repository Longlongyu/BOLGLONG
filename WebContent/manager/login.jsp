<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  if (session.getAttribute("username") != null) {
    response.sendRedirect("/"); 
  }
%>
<!DOCTYPE html>
<html>
<head>
  <title>登录账号 - 博客龙</title>
  <%@ include file="b_head.jsp"%>
</head>
<body>
  <div id="wrapper">
    <div class="overlay"></div>
    <jsp:include page="/manager/c_rightside.jsp" flush="true" />
    <div id="page-content-wrapper">
      <jsp:include page="/manager/c_nav.jsp" flush="true" />
      <section id="login-page">
        <section class="login-title animated zoomInLeft">
          <h2>博客龙数字化转型专家</h2>
          <p class="animated fadeInLeft delay-3s">融合AI突破性技术，解决社会和商业棘手问题</p>
          <p class="animated fadeInRight delay-6s">提供ET大脑帮助您在复杂局面下，做出最优决策</p>
          <p class="animated fadeInLeft delay-9s">现已广泛应用于工业、城市、医疗、交通等多个行业</p>
        </section>
        <%@ include file="c_login.jsp"%>
        <jsp:include page="/manager/script.jsp" flush="true" />
      </section>
    </div>
  </div>
  
</body>
</html>