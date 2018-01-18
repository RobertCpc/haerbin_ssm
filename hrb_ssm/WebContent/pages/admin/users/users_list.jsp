<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<link rel="Bookmark" href="/favicon.ico" >
<link rel="Shortcut Icon" href="/favicon.ico" />
<link rel="stylesheet" type="text/css" href="h-ui/static/h-ui/css/H-ui.min.css" />
<link rel="stylesheet" type="text/css" href="h-ui/static/h-ui.admin/css/H-ui.admin.css" />
<link rel="stylesheet" type="text/css" href="h-ui/lib/Hui-iconfont/1.0.8/iconfont.css" />
<link rel="stylesheet" type="text/css" href="h-ui/static/h-ui.admin/skin/default/skin.css" id="skin" />
<link rel="stylesheet" type="text/css" href="h-ui/static/h-ui.admin/css/style.css" />

<title>用户列表</title>
</head>
<body>
<nav class="breadcrumb"><i class="Hui-iconfont">&#xe67f;</i> 首页 <span class="c-gray en">&gt;</span> 用户管理 <span class="c-gray en">&gt;</span> 用户列表 <a class="btn btn-success radius r" style="line-height:1.6em;margin-top:3px" href="javascript:location.replace(location.href);" title="刷新" ><i class="Hui-iconfont">&#xe68f;</i></a></nav>
<div class="page-container">
	<div class="text-c"> 
	 <form action="users/allByUsers" method="post">
		<input type="text" class="input-text" style="width:250px" placeholder="输入用户名名称" id="" name="uname" value="${searchUsers.uname}">
		<input type="text" class="input-text" style="width:250px" placeholder="输入姓名名称" id="" name="realName" value="${searchUsers.realName}">
		<input type="text" class="input-text" style="width:250px" placeholder="输入年龄" id="" name="age" value="${searchUsers.age}">
		
		<button type="submit"  class="btn btn-success" id="" name=""><i class="Hui-iconfont">&#xe665;</i> 查询</button>
	</form>
	</div>
	<div class="cl pd-5 bg-1 bk-gray mt-20"> <span class="l"><a href="javascript:;" onclick="datadel()" class="btn btn-danger radius"><i class="Hui-iconfont">&#xe6e2;</i> 批量删除</a> <a href="javascript:;" onclick="admin_add('添加管理员','admin-add.html','800','500')" class="btn btn-primary radius"><i class="Hui-iconfont">&#xe600;</i> 添加管理员</a></span> <span class="r">共有数据：<strong>${usersList.size()}</strong> 条</span> </div>
	<table class="table table-border table-bordered table-bg table-hover table-sort">
		<thead>
			<tr>
				<th scope="col" colspan="9">用户列表</th>
			</tr>
			<tr class="text-c">
				<th width="25"><input type="checkbox" name="" value=""></th>
				<th width="40">ID</th>
				<th width="150">用户名</th>
				<th width="90">密码</th>
				<th width="120">姓名</th>
				<th>年龄</th>
				<th width="160">注册时间</th>
				<th width="100">用户状态</th>
				<th width="100">操作</th>
			</tr>
		</thead>
		<tbody>
		  <c:forEach items="${usersList}" var="u">	
			<tr class="text-c">
				<td><input type="checkbox" value="2" name=""></td>
				<td>${u.id }</td>
				<td>${u.uname }</td>
				<td>${u.upass}</td>
				<td>${u.realName}</td>
				<td>${u.age }</td>
				<td><fmt:formatDate value="${u.currDate }" pattern="yyyy年MM月dd日 hh:mm:ss"/></td>
				<td class="td-status"><span class="label radius">
				<c:if test="${u.status==0}">未审核</c:if>
				<c:if test="${u.status==1}">审核成功</c:if>
				<c:if test="${u.status==2}">审核失败</c:if>
				</span></td>
				<td class="td-manage"><a style="text-decoration:none" onClick="admin_start(this,'10001')" href="javascript:;" title="启用">
				<i class="Hui-iconfont">&#xe615;</i></a> 
				<a title="编辑" href="javascript:;" onclick="admin_edit('管理员编辑','admin-add.html','2','800','500')" class="ml-5" style="text-decoration:none">
				<i class="Hui-iconfont">&#xe6df;</i></a>
				 <a title="删除" href="javascript:;" onclick="users_del(this,'${u.id}')" class="ml-5" style="text-decoration:none">
				 <i class="Hui-iconfont">&#xe6e2;</i></a></td>
			</tr>
		</c:forEach>	
			
		</tbody>
	</table>
</div>
<!--_footer 作为公共模版分离出去-->
<script type="text/javascript" src="h-ui/lib/jquery/1.9.1/jquery.min.js"></script> 
<script type="text/javascript" src="h-ui/lib/layer/2.4/layer.js"></script>
<script type="text/javascript" src="h-ui/static/h-ui/js/H-ui.min.js"></script> 
<script type="text/javascript" src="h-ui/static/h-ui.admin/js/H-ui.admin.js"></script> <!--/_footer 作为公共模版分离出去-->

<!--请在下方写此页面业务相关的脚本-->
<script type="text/javascript" src="h-ui/lib/My97DatePicker/4.8/WdatePicker.js"></script> 
<script type="text/javascript" src="h-ui/lib/datatables/1.10.0/jquery.dataTables.min.js"></script> 
<script type="text/javascript" src="h-ui/lib/laypage/1.2/laypage.js"></script>
<script type="text/javascript">
$('.table-sort').dataTable({
	"aaSorting": [[ 1, "desc" ]],//默认第几个排序
	"bStateSave": true,//状态保存
	"pading":false,
	"aoColumnDefs": [
	  //{"bVisible": false, "aTargets": [ 3 ]} //控制列的隐藏显示
	  {"orderable":false,"aTargets":[0,8]}// 不参与排序的列
	]
});


/*
	参数解释：
	title	标题
	url		请求的url
	id		需要操作的数据id
	w		弹出层宽度（缺省调默认值）
	h		弹出层高度（缺省调默认值）
*/
/*管理员-增加*/
function admin_add(title,url,w,h){
	layer_show(title,url,w,h);
}
/*管理员-删除*/
function users_del(obj,id){
	
	layer.confirm('确认要删除吗？',function(index){
		$.ajax({
			type: 'POST',
			url: 'users/delAjax',
			data:{"id":id},
			success: function(data){
				$(obj).parents("tr").remove();
				layer.msg('已删除!',{icon:1,time:1000});
			},
			error:function(data) {
				console.log(data.msg);
			},
		});		
	});
}

/*管理员-编辑*/
function admin_edit(title,url,id,w,h){
	layer_show(title,url,w,h);
}
/*管理员-停用*/
function admin_stop(obj,id){
	layer.confirm('确认要停用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_start(this,id)" href="javascript:;" title="启用" style="text-decoration:none"><i class="Hui-iconfont">&#xe615;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-default radius">已禁用</span>');
		$(obj).remove();
		layer.msg('已停用!',{icon: 5,time:1000});
	});
}

/*管理员-启用*/
function admin_start(obj,id){
	layer.confirm('确认要启用吗？',function(index){
		//此处请求后台程序，下方是成功后的前台处理……
		
		
		$(obj).parents("tr").find(".td-manage").prepend('<a onClick="admin_stop(this,id)" href="javascript:;" title="停用" style="text-decoration:none"><i class="Hui-iconfont">&#xe631;</i></a>');
		$(obj).parents("tr").find(".td-status").html('<span class="label label-success radius">已启用</span>');
		$(obj).remove();
		layer.msg('已启用!', {icon: 6,time:1000});
	});
}
</script>
</body>
</html>