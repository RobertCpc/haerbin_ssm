package com.qfjy.bean;

import java.util.Date;

/*
 * 映射数据库中的Users表
 */
public class Users {
	private Integer id;
	private String uname;
	private String upass;
	private String realName;
	private Integer age;
	private String remark;
	private Date currDate;
	private Integer status;
	
	//生成快捷键的GET SET Method: Shift+Alt+S 
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getRealName() {
		return realName;
	}
	public void setRealName(String realName) {
		this.realName = realName;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public Date getCurrDate() {
		return currDate;
	}
	public void setCurrDate(Date currDate) {
		this.currDate = currDate;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	
	
}
