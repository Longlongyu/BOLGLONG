var $_main = (function() {
  function isSuccess(str) {
  	return str.substring(0,7) == "success";
  }
  function splitDate(str) {
  	var result = {};
  	var arr = str.substring(8, str.length).split("&");
  	for (var i = 0; i < arr.length; i++) {
  		var data = arr[i].split("=");
  		result[data[0]] = data[1];
  	}
  	return result;
  }
  function getFirstUpperCase(str) {
  	return str.substring(0, 1).toUpperCase();
  }
  function getNewFoolr() {
  	var result = document.querySelector(".comment");
  	return result == null ? 1 : parseInt(result.getAttribute("date-floor"));
  }
  function getCurrTime() {
  	var date = new Date();
    var seperator1 = "-";
    var seperator2 = ":";
    var month = date.getMonth() + 1;
    var strDate = date.getDate();
    if (month >= 1 && month <= 9) {
        month = "0" + month;
    }
    if (strDate >= 0 && strDate <= 9) {
        strDate = "0" + strDate;
    }
    var currentdate = date.getFullYear() + seperator1 + month + seperator1 + strDate
            + " " + date.getHours() + seperator2 + date.getMinutes()
            + seperator2 + date.getSeconds();
    return currentdate;
  }
  function outputComment(str) {
  	if(!isSuccess(str)) return;
  	var data = splitDate(str);
  	var el = "<section class=\"comment margin-bottom-16\" date-floor=\"" + getNewFoolr() + "\">" +
      "<div class=\"action\">" + getFirstUpperCase(data["user"]) + "</div>" +
      "<div class=\"action-comment inline-block margin-left-16\">" +
        "<h3 class=\"comment-user margin-0\">" +
          data["user"] + " "
          "<small>- " + getNewFoolr() + " -</small>" +
        "</h3>" +
        "<time class=\"comment-time\">" +
          "<span class=\"fa fa-clock-o\"></span>" +
          getCurrTime() +
        "</time>" +
        "<div class=\"comment-content\">" +
        	data["comment"] +
        "</div>" +
        "<div class=\"text-align-right\">" +
          "<a class=\"navbar-link\">回复</a>" +
        "</div>" +
      "</div>" +
      "<hr>" +
    "</section>";
  	return el;
  }
  return {
  	isSuccess : isSuccess,
  	splitDate : splitDate,
  	outputComment : outputComment
  }
})();
