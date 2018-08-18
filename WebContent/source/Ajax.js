/**
 * 我的AJAX方法
 */
var $_ajax = (function() {
	function createXmlHttp() {
  	var xmlHttp = null;
  	
  	try {
  		//Firefox, Opera 8.0+, Safari
  		xmlHttp = new XMLHttpRequest();
  	} catch (e) {
  		//IE
  		try {
  			xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
  		} catch (e) {
  			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  		}
  	}
  	
  	return xmlHttp;
  }
  function submitForm(from_id, output_id) {
  	var xmlHttp = createXmlHttp();
  	if(!xmlHttp) {
  		alert("您的浏览器不支持AJAX！");
  		return 0;
  	}
  	var e = document.getElementById(from_id);
  	var tip = document.getElementById(output_id);
  	var inputs = e.elements;
  	var url = e.action;
  	var postData = "";
  	for(var i=0; i<inputs.length; i++) {
  		switch(inputs[i].type) {
  			case "text":
  				postData += inputs[i].name + "=" + inputs[i].value + "&";
  			break;
  			case "password":
  				postData += inputs[i].name + "=" + inputs[i].value + "&";
  			break;
  			default:
  				continue;
  		}
  	}
  	postData += "t=" + Math.random();
  	xmlHttp.open("POST", url, true);
  	xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
  	xmlHttp.onreadystatechange = function() {
  		if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
  			tip.innerHTML = xmlHttp.responseText;
  		}
  	}
  	xmlHttp.send(postData);
  }
  return {
  	submitForm : submitForm
  }
})();