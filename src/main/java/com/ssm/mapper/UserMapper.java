package com.ssm.mapper;

import java.util.List;

import com.ssm.model.User;
/**
 * 描述:用户mapper接口<BR>
 * 创建人:<BR>
 * 时间:2017年7月10日下午6:14:22<BR>
 * @version
 */
public interface UserMapper {

	void saveUser(User user);
	
	boolean updateUser(User user);
	
	boolean deleteUser(int id);
	
	User findUserById(int id);
	
	List<User> findAll();
}
