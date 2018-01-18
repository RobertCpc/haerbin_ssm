<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
//http://localhost:8080/hrb_ssm/
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script type="text/javascript">
	function unameBlur(){
		//获取用户输入的文本框值
		var uname=$("#uname").val();  // 语法： $("#id").val();
	
		$.ajax({
			type:"post",
			url:"users/isAjaxUname",
			data:{"un":uname},
			success:function(msg){
				if(msg=="0"){
					$("#unameDiv").html("验证失败");
				}else{
					$("#unameDiv").html("验证成功");
				}
			}
		});
	}
</script>

</head>
<body>
<!-- action:  http://localhost:8080/hrb_ssm/pages/demo/ users/login -->
<form  id="formLogin" name="formLogin" action="users/login1" method="get">	
	<table>
		<tr>
			<td>用户名：</td>
			<td><input type="text" name="uname" id="uname"  onblur="unameBlur()" />
			<!--  EL表达式   -->
			   <div id="unameDiv" style="font-size: 12px;color: red">${unameMsg}</div>
			</td>
		</tr>
	
		<tr>
			<td>密码：</td>
			<td><input type="password" name="upass"/>
			   <div style="font-size: 12px;color: red">${upassMsg}</div>
			</td>
		</tr>		
		<!-- 真实姓名，值传过来，打印出即可。 -->
		<tr>
			<td colspan="2"><input type="submit" value="登录" ></td>
		</tr>
	</table>
	当没有/时，这个页面1 的路径应该是：http://localhost:8080/hrb_ssm/pages/demo/login_fail.jsp
	<br/>
	<a href="login_fail.jsp">页面1</a>
	<br/>
	<a href="/login_fail.jsp">页面2</a>
	
	
</form>	
</body>
</html>