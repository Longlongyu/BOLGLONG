/**
 * 我的AJAX方法
 */
var $_ajax = (function() {
	/**
	* 创建请求
	*/
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
	/**
	* 执行JavaScript代码
	*/
	function javascript(ajaxLoadedData) {
		// 第一步：匹配加载的页面中是否含有js
		var regDetectJs = /<script(.|\n)*?>(.|\n|\r\n)*?<\/script>/ig;
		var jsContained = ajaxLoadedData.match(regDetectJs);
		// 第二步：如果包含js，则一段一段的取出js再加载执行
		if(jsContained) {
			// 分段取出js正则
			var regGetJS = /<script(.|\n)*?>((.|\n|\r\n)*)?<\/script>/im;
			// 按顺序分段执行js
			var jsNums = jsContained.length;
			for (var i=0; i<jsNums; i++) {
				var jsSection = jsContained[i].match(regGetJS);
				if(jsSection[2]) {
					if(window.execScript) {
						window.execScript(jsSection[2]);
					} else {
						window.eval(jsSection[2]);
					}
				}
			}
		}
	}
	/**
	* 提交表单
	*/
	function submit(from_id, f) {
		var xmlHttp = createXmlHttp();
  	if(!xmlHttp) {
  		alert("您的浏览器不支持AJAX！");
  		return 0;
  	}

		//筛选插入数据
		var e = document.getElementById(from_id);
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
				case "radio":
				if(inputs[i].checked) {
					postData += inputs[i].name + "=" + inputs[i].value + "&";
				}
				break;
				case "checkbox":
					if(inputs[i].checked) {
						postData += inputs[i].name + "=" + inputs[i].value + "&";
					}
				break;
				case "textarea":
					postData += inputs[i].name + "=" + inputs[i].value + "&";
				break;
				case "hidden":
					postData += inputs[i].name + "=" + inputs[i].value + "&";
				break;
				case "select":
					console.log(inputs[i].options[inputs[i].selectedIndex].value)
					postData += inputs[i].name + "=" + inputs[i].options[inputs[i].selectedIndex].value + "&";
				break;
  			default:
  				continue;
  		}
  	}
		postData += "t=" + Math.random();

		//发送请求
  	xmlHttp.open("POST", url, true);
  	xmlHttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded"); 
  	xmlHttp.onreadystatechange =  function() {
  		if(xmlHttp.readyState == 4 && xmlHttp.status == 200) {
				javascript(xmlHttp.responseText);
				f(xmlHttp.responseText);
  		}
  	};
		xmlHttp.send(postData);
	}
	/**
	* 提交表单，并输出给元素
	*/
  function submitForm(from_id, output_id) {
		var tip = document.getElementById(output_id);
		submit(from_id, function(text) {
				tip.innerHTML = text;
  	});
	}
  return {
		submitForm : submitForm,
		submit : submit
  }
})();