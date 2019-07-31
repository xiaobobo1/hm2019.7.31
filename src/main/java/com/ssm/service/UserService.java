package com.ssm.service;

import java.util.List;

import com.ssm.model.User;
/**
 * 描述:用户service<BR>
 * 创建人:<BR>
 * 时间:2017年7月11日下午7:06:59<BR>
 * @version
 */
public interface UserService {

void saveUser(User user);
	
	boolean updateUser(User user);
	
	boolean deleteUser(int id);
	
	User findUserById(int id);
	
	List<User> findAll();
}
