<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
  <head>   
    <title>My JSP 'city.jsp' starting page</title>
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script type="text/javascript">
 		$(function(){
 			$("#country").change(function(){
 				var country=$(this).val();
 				if(country != ""){
 					$.ajax({
 						url:"${pageContext.request.contextPath}/cityServlet",
 						data:{
 							"country":country
 						},
 						type:"post",
 						dataType:"json",
 						success:function(data){
 							var $city=$("#city");
 							$city.empty();
 							$.each(data.city,function(i,obj){
 								$city.append("<option>"+obj.value+"</option>");
 							});
 						}
 					});
 				} else {
 					alert("请输入城市");
 				}
 			});
 		});
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
