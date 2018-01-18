package com.qfjy.dao;

import java.util.List;

import com.qfjy.bean.Users;

/*
 * mybatis完成，  面向接口编程
 */
public interface UsersDao {
	//声明方法：  查询的方法  查询Users表所有数据 
	public List<Users> getAllByUsers(Users u);
	//声明方法：  查询的方法  查询Users表所有数据 
	public List<Users> getAll();
	//查增删改
	//根据ID查询单个对象
	public Users getById(Integer id);
	//添加
	public int add(Users u);
	//删除
	public int deleteById(Integer id);
	//登录功能
	public Users login(Users u);
	//修改
	public int update(Users u);
	
	
	/*
	 * 高级查询
	 * 需求1：根据用户名 进行模糊查询 
	 */
	public List<Users> getAllBy(String uname);
	
	
	
}
