<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>  	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加用户</title>
</head>
<body>
 <form action="users/add" method="post">
	<table align="center">
		<tr>
			<td>用户名:</td>
			<td><input type="text" name="uname" />  </td>
		</tr>
		<tr>
			<td>密码:</td>
			<td><input type="password" name="upass" /> </td>
		</tr>
		<tr>
			<td>姓名:</td>
			<td><input type="text" name="realName" /> </td>
		</tr>
		<tr>
			<td>年龄:</td>
			<td><input type="age" name="age" /> </td>
		</tr>
		<tr>
			<td>备注:</td>
			<td><textarea name="remark" rows="5" cols="22"></textarea>			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="用户注册" />
			 </td>
		</tr>
	</table>
</form>

</body>
</html>