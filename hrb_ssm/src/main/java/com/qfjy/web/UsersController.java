package com.qfjy.web;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qfjy.bean.Users;
import com.qfjy.service.UsersService;
import com.qfjy.web.utils.ValidateColorServlet;

@Controller   // SpringIOC容器 对这个类进行实例化操作
@RequestMapping("users")
public class UsersController {
	@Autowired   //根据类型匹配
	UsersService  usersService;
	
	/*
	 * 查询列表数据，（加条件)
	 */
	@RequestMapping("allByUsers")  //  users/allByUsers
	public String getAllByUsers(HttpServletRequest request,Users u){
		// 调用其getAll方法
		List<Users> list = usersService.getAllByUsers(u);
		request.setAttribute("usersList", list);
		request.setAttribute("searchUsers", u);
		/*
		 *映射的路径 
		 *  物理路径
		 *  逻辑路径
		 *  
		 *  绝对路径：一定要加/
		 */
		return "/pages/admin/users/users_list.jsp";
	}
	
	/*
	 * ajax方式删除
	 */
	@RequestMapping("delAjax")  //users/delAjax
	@ResponseBody
	public String delAjax(HttpServletRequest request){
		String str=request.getParameter("id");
		Integer id=Integer.parseInt(str);//将字符串类型转换为整型 int   ( int的包装类是Integer)
		int num=usersService.deleteById(id);
		return num+"";
	}
// ######################### 之前测试	
	
	/*
	 * 查询列表数据
	 */
	@RequestMapping("all")  //  users/all
	public String getAll(HttpServletRequest request){
		// 调用其getAll方法
		List<Users> list = usersService.getAll();
		request.setAttribute("usersList", list);
		/*
		 *映射的路径 
		 *  物理路径
		 *  逻辑路径
		 *  
		 *  绝对路径：一定要加/
		 */
		return "/pages/admin/users/users_list.jsp";
	}
	/*
	 * 用户添加
	 */
	@RequestMapping("add")   //  users/add
	// pojo方式
	public String add(Users u){
		
		int num=usersService.add(u);
		if(num>0){
			//插入成功后，跳转到用户列表页面(同时，要将最新插入的数据，显示出来）
			return "/users/all";
		}else{
			System.out.println("用户信息插入失败");
			//跳转到失败页面，在当前页面注册页面中，并给个提示信息
			return "/pages/test/users_add.jsp";
		}
		
	}
	/*
	 * 用户删除
	 */
	@RequestMapping("del")  //请求： users/del
	/*
	 * 能过方法入参形式传递：
	 * 1、@RequestParam("id")Intger id  中的id必须和你URL传递的name一样
	   2、HttpServletRequest request
	 */
	public String del(HttpServletRequest request){
		String str=request.getParameter("id");
		Integer id=Integer.parseInt(str);//将字符串类型转换为整型 int   ( int的包装类是Integer)
		int num=usersService.deleteById(id);
		if(num>0){
			System.out.println("删除成功，要跳转到列表页面，显示最新的数据列表");
			return "/users/all";
		}
		return "";
	}
	/*
	 * 查询（详情） 根据ID
	 */
	@RequestMapping("getBy")   //  请求：users/getBy
	public String getById(@RequestParam("id")Integer id,Map<String,Object> map){
		Users users=usersService.getById(id);
		/*
		 * 1、request.setAttribute("",obj);
		 * 2、方法入参，方法中加一个Map<String,Object> map
		 */
		map.put("users",users);
		return "/pages/test/users_view.jsp";
	}
	
	
	/*
	 * 点击修改时，
	 *   1、先到后台将其详细信息查询出来，赋预给修改页面。
	 *   2、后台执行更新操作
	 */
	@RequestMapping("update")  //  users/update
	public String update(@RequestParam("id")Integer id,Map<String,Object> map){
		Users users=usersService.getById(id);
		map.put("users",users);
		return "/pages/test/users_edit.jsp";
	}
	//更新方法
	@RequestMapping("updateAction")
	public String upateAction(Users u){
		int num=usersService.update(u);
		if(num>0){
			return "/users/all";// 修改成功后，跳转到列表页面中
		}
		return "";
	}
	
	//用户登录功能
	@RequestMapping("login")  //请求：users/login
	public String login(HttpServletRequest  request){
		/*
		 * 加个验证码验证
		 */
		String code=request.getParameter("validateCode"); //用户输入
		//取验证码生成的数据
		String check_coke_key=(String) request.getSession().getAttribute("CHECK_CODE");
		if(!code.equalsIgnoreCase(check_coke_key)){
			//验证码输入错误
			request.setAttribute("loginMsg","验证码输入错误");
			return "/pages/admin/login.jsp";
		}
		
		
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		
		Users u=usersService.login(uname, upass);
		if(u!=null){
			//登录成功 ，  跳到后台管理员主页面
			return "/pages/admin/index.jsp";
		}else{
			//登录失败，继续回到登录页面，并加提示信息
			request.setAttribute("loginMsg","用户名或密码错误");
			return "/pages/admin/login.jsp";
		}
		
	
	}
	
}
