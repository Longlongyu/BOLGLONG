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
  return {
  	isSuccess : isSuccess,
  	splitDate : splitDate
  }
})();
