package com.ssm.model;
/**
 * 描述:用户实体类<BR>
 * 创建人:<BR>
 * 时间:2017年7月10日下午6:11:17<BR>
 * @version
 */
public class User {

	//主键
	private int id;
	//用户名
	private String username;
	//年龄
	private String age;
	
	public User() {
		super();
	}

	public User(int id, String username, String age) {
		super();
		this.id = id;
		this.username = username;
		this.age = age;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}
	
}
