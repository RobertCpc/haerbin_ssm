<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>用户详细信息</title>
</head>
<body>
		<table align="center">
		<tr>
			<td>ID:</td>
			<td>${users.id} </td>
		</tr>
		<tr>
			<td>用户名:</td>
			<td>${users.uname} </td>
		</tr>
		<tr>
			<td>密码:</td>
			<td>${users.upass}</td>
		</tr>
		<tr>
			<td>姓名:</td>
			<td>${users.realName } </td>
		</tr>
		<tr>
			<td>年龄:</td>
			<td>${users.age} </td>
		</tr>
		<tr>
			<td>备注:</td>
			<td>${users.remark}
						
			</td>
		</tr>
		<tr>
			<td>注册日期:</td>
			<td>  <fmt:formatDate value="${users.currDate}" pattern="yyyy年MM月dd日 hh:mm:ss" /></td>
		</tr>
		<tr>
			<td>用户状态:</td>
			<td>
				<c:if test="${users.status==1}">审核通过</c:if>
				<c:if test="${users.status==0}">未审核</c:if>
				<c:if test="${users.status==2}">审核失败</c:if>
			 </td>
		</tr>
	</table>
</body>
</html>