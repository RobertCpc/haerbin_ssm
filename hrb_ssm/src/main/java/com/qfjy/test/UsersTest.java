package com.qfjy.test;

import java.util.Date;
import java.util.List;

import org.apache.catalina.core.ApplicationContext;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.qfjy.bean.Users;
import com.qfjy.service.UsersService;

public class UsersTest {

	// 查询所有的用户
	@Test
	public void testAll() {
		/*
		 * 单元测试
		 */
		// Spring IOC容器
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		// String[] beans=ctx.getBeanDefinitionNames();

		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
																			// 的首字母小写
		// 调用其getAll方法
		List<Users> list = uService.getAll();
		for (int i = 0; i < list.size(); i++) {
			Users u = list.get(i);
			System.out.println(u.getId() + "\t" + u.getUname());
		}
	}

	@Test
	public void testGetById() {
		// Spring IOC容器
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
																			// 的首字母小写
		Users users=uService.getById(2);
		System.out.println(users.getId()+"\t"+users.getUname()+"\t"+users.getRealName());
	}

	//测试添加
	@Test
	public void testAdd(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
		
		Users u=new Users();
		u.setUname("test2");
		u.setUpass("123456");
		u.setAge(29);
		u.setRealName("后台用户2");
		u.setRemark("这是JAVA端插入的用户信息");
		u.setCurrDate(new Date());
		u.setStatus(1);
		int num=uService.add(u);
		if(num>0){
			System.out.println(u.getUname()+"\t用户信息插入成功");
		}else{
			System.out.println("用户信息插入失败");
		}
	}
	//测试删除
	@Test
	public void testDelete(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
		
		int num=uService.deleteById(5);
		if(num>0){
			System.out.println("数据删除成功");
		}else{
			System.out.println("数据删除失败");
		}
	}
	/*
	 * 登录功能
	 * param1 : uname
	 * param2 : upass
	 */
	@Test
	public void testLogin(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
		
		String uname="admin";
		String upass="123456";
		
		Users u=uService.login(uname, upass);
		if(u!=null){
			System.out.println("用户登录成功\t"+u.getUname()+"\t"+u.getRealName());
		}else{
			System.out.println("用户名帐号或密码错误");
		}
	}
	
	//需求：根据用户名 进行模糊查询 
	@Test
	public void testLikeSearch(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
		
		List<Users> list=uService.getAllBy("s");
		for(Users u :list){
			System.out.println(u.getId()+"\t"+u.getUname()+"\t"+u.getUpass());
		}
	}
	//修改
	@Test
	public void testUpdate(){
		ClassPathXmlApplicationContext ctx = new ClassPathXmlApplicationContext("spring_core.xml");
		UsersService uService = (UsersService) ctx.getBean("usersService"); // bean名字默认就是全类名
		Users u=new Users();
		u.setId(4);
		u.setAge(24);
		u.setRealName("测试4");
		int num=uService.update(u);
		if(num>0){
			System.out.println("数据更新成功");
		}else{
			System.out.println("数据更新失败");
		}
	}
}
