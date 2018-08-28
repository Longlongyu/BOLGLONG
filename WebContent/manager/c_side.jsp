<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="sideNav" class="shadow-box">
  <a class="side-button">
    <span class="fa fa-thumbs-o-up fa-2x"></span>
  </a>
  <a class="side-button">
    <span class="fa fa-rss fa-2x"></span>
  </a>
  <a class="side-button" href="#comments-list">
    <span class="fa fa-comment-o fa-2x"></span>
  </a>
  <a id="top" class="side-button">
    <span class="fa fa-angle-up fa-2x"></span>
  </a>
</section>
<script type="text/javascript">
  $(window).scroll(function() {
  	if($("#bottomNav").offset().top > 100) {
  	  $("#sideNav").css("position","fixed");
  	} else {
  	  $("#sideNav").css("position","static");
  	}
  });
  $("#top").click(function() {
  	$('body,html').animate({'scrollTop':0},300);
  })
</script>
