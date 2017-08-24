<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>   
    <title>My JSP 'city.jsp' starting page</title>
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
    		document.getElementById('country').onchange=function() {
    			var country=document.getElementById('country').value;
    			if(country!=""){
    				var ajax=createAjax();
    				ajax.onreadystatechange=function() {
    					if(ajax.readyState==4 && ajax.status==200){
    						var cities=eval("("+ ajax.responseText +")");
    						var city=document.getElementById('city');
    						city.length=0;
    						for(var i=0;i<cities.city.length;i++){
    							var opt = document.createElement("option");
    							opt.text=cities.city[i].value;
    							city.appendChild(opt);
    						}  						
    					}
    				}
    				ajax.open("post", "${pageContext.request.contextPath}/cityServlet", true);
    				ajax.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    				ajax.send("country=" +country);
    			} else {
    				alert("请输入城市!");
    			}
    			
    		}
    	}
    </script>
  </head>
  
  <body>
     <div style="width:100%;text-align: center;margin-top: 30px;">
    	国家：<select id="country" style="width:160px;">
    		<option value="">请选择</option>
    		<option value="中国">中国</option>
    		<option value="日本">日本</option>
    	</select>
    	&nbsp;&nbsp;---&nbsp;&nbsp;
    	城市：<select id="city"></select>
    </div>
  </body>
</html>
