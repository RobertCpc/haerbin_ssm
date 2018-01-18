<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>      
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 
组合使用：  jstl标签   +  el表达式
   el表达式 
 -->   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>列表数据</title>
</head>
<body>
	<table border="1" align="center" >
		<tr>
			<td>ID</td>
			<td>用户名</td>
			<td>密码</td>
			<td>姓名</td>
			<td>年龄</td>
			<td>备注</td>
			<td>注册日期</td>
			<td>操作</td>
		</tr>
		<!-- 
			items: request.setAttribute("这个名称");
			var :变量名
			
			el表达式：调用其属性的get方法  u.getId() --是通过反射方式。  
		 -->
	<c:forEach items="${usersList}" var="u">	
		<tr>
			<td>${u.id }</td>
			<td><a href="users/getBy?id=${u.id}">${u.uname}</a></td>
			<td>${u.upass }</td>
			<td>${u.realName }</td>
			<td>${u.age}</td>
			<td>${u.remark }</td>
			<td><fmt:formatDate value="${u.currDate }" pattern="yyyy-MM-dd" /> </td>
			<td>&nbsp;<a href="pages/test/users_add.jsp">添加</a>&nbsp;
			 <a href="users/del?id=${u.id}">删除</a> &nbsp;
			 <a href="users/getBy?id=${u.id}">查看</a>&nbsp;
			 <a href="users/update?id=${u.id}">修改</a>&nbsp;</td>
		</tr>
	</c:forEach>	
	</table>
</body>
</html>