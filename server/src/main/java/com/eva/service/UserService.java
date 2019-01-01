package com.eva.service;

import com.eva.entities.User;

/**
 * 用户服务层接口
 * @author temp
 *
 */
public interface UserService {
	
	User saveUser(User user);
	
	User checkLogin(String name, String password);
}
