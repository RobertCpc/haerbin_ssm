package com.qfjy.service;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.qfjy.bean.Users;
import com.qfjy.dao.UsersDao;

/*
 * Users业务逻辑层
 */
@Service
public class UsersService {
	@Autowired // 根据类型匹配s 告诉Spring 将创建 的那个对象的类型，给我在这边赋值
	private UsersDao uDao;

	// 声明方法： 查询的方法 查询Users表所有数据
	public List<Users> getAllByUsers(Users u) {
		return uDao.getAllByUsers(u);
	}

	public List<Users> getAll() {
		return uDao.getAll();
	}

	// 根据ID查询单个对象
	public Users getById(Integer id) {
		return uDao.getById(id);
	}

	/*
	 * 快捷键 Ctrl+Shift +F 自动排版
	 */
	// 添加
	public int add(Users u) {
		// 时间 注册时间：当前时间。
		// 状态 用户状态（int表示） 0用户无效（未审核） 1审核通过 2审核失败
		/*
		 * 状态 ： 未审核 用户 不能登录当前系统，如果用户登录，给提示信息：您还未审核，请等待或联系管理员 审核操作： 可以操作当前系统
		 * 审核失败：提示，经管理员审核，您的个人资料不符合标准。审核失败（对当前系统什么都不能做）
		 */
		u.setCurrDate(new Date());
		u.setStatus(0);
		return uDao.add(u);
	}

	// 删除
	public int deleteById(Integer id) {
		return uDao.deleteById(id);
	}

	// 登录
	public Users login(String uname, String upass) {
		Users u = new Users();
		u.setUname(uname);
		u.setUpass(upass);
		return uDao.login(u);
	}

	// 修改
	public int update(Users u) {
		return uDao.update(u);
	}

	// 需求1：根据用户名 进行模糊查询
	public List<Users> getAllBy(String uname) {
		return uDao.getAllBy(uname);
	}
}
