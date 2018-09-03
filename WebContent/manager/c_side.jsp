<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<section id="sideNav" class="white-box">
  <a id="top" class="side-button">
    <span class="fa fa-angle-up fa-2x"></span>
  </a>
</section>
<script type="text/javascript">
  $(window).scroll(function() {
  	if($("#mainNav").offset().top > 50) {
  	  $("#sideNav").css("visibility","visible");
  	} else {
  	  $("#sideNav").css("visibility","hidden");
  	}
  });
  $("#top").click(function() {
  	$('body,html').animate({'scrollTop':0},300);
  })
</script>
