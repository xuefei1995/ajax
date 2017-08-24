<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html>
<html>
  <head>
    <title>My JSP 'index.jsp' starting page</title>
	<script type="text/javascript">
	function createAjax(){
		var ajax;
		if(window.XMLHttpRequest){
			ajax=new XMLHttpRequest();
		} else {
			ajax=new ActiveXObject("Mircosoft XMLHTTP");
		}
		return ajax;
	}
	window.onload=function() {
		document.getElementById('tongbu').onclick=function(){
			window.location.href="<%=path %>/TimeServlet";
		}
		document.getElementById("yibu").onclick=function(){
			var ajax=createAjax();
			ajax.onreadystatechange=function() {
				if(ajax.readyState==4 && ajax.status==200) {
					document.getElementsByTagName('span')[0].innerHTML=ajax.responseText;
				}
			}
			ajax.open("post", "${pageContext.request.contextPath}/TimeServlet", true);
			ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
			ajax.send("type=async");
		}
	}
	</script>
  </head>
  
  <body>
   当前时间为:<span>${requestScope.time }</span><br>
   <input id="tongbu" type="button" value="同步获取时间" />
   <input id="yibu" type="button" value="异步获取时间" />
  </body>
</html>
