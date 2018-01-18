package com.qfjy.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller  //默认是单例
@RequestMapping("demo")   //请求映射
public class DemoController {

	/*
	 * 定义方法
	 */
	@RequestMapping("login")   // users/login
	public String login(@RequestParam("uname")String uname,
			@RequestParam("upass")String upass
			){
		//获取用户名和密码
		System.out.println("前端输入的用户名和密码是："+uname+"\t"+upass);
		//如果用户名叫admin  密码叫123， 登录成功
		if("admin".equals(uname)&& "123".equals(upass)){
			return "/pages/demo/login_succ.jsp";
		}
		//否则，跳到登录失败页面
		return "/pages/demo/login_fail.jsp";
	}
	/*
	 * 需求：
	 *   当用户操作login.jsp页面时，将用户名和密码在后台得到
	 *    @RequestParam("uname")   这种方式(SpringMVC通过注解的方式进行封装）
	 *    底层Servlet代码是：request.getParameter("uname");
	 */
	@RequestMapping("login1")  //  URL请求：    users/login1
	public String login1(HttpServletRequest request){
		String uname=request.getParameter("uname");
		String upass=request.getParameter("upass");
		System.out.println("用户名是："+uname);
		if("admin".equals(uname)){
			return "/pages/demo/login_succ.jsp";
		}else{
			//如果用户名不是admin，跳回原页面， login.jsp页面，要加一个提示：用户名或密码错误
			//问题：怎么将JAVA代码的内容数据，返回到页面中呢？
			request.setAttribute("unameMsg","用户名不正确");
		}
		if(!"123".equals(upass)){
			request.setAttribute("upassMsg","密码不正确");
		}
		return "/pages/demo/login.jsp";
	}
	
	/*
	 * SpringMVC  ajax支持更友好 （JSON）
	 */
	@ResponseBody  //返回JSON对象
	@RequestMapping("getStringJson")  //  users/getStringJson
	public String getStringJson(){
		return "/pages/demo/login.jsp";
	}
	/*
	 * ajax ，验证当前用户输入的这个用户名是否存在
	 *    需求：验证用户输入的用户名框是不是admin,如果是admin，告诉其验证成功，
	 *      否则，用户名验证失败
	 */
	@ResponseBody
	@RequestMapping("isAjaxUname")   //  users/isAjaxUname
	public String isAjaxUname(HttpServletRequest request){
		String uname=request.getParameter("un");
		if("admin".equals(uname)){
			return "1"; //验证成功
		}
		return "0"; //验证失败
	}
	
}
