package com.eva.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eva.entities.User;
import com.eva.repository.UserRepository;

@Service("UserService")
public class UserServiceImp implements UserService {
	@Autowired
	UserRepository userRepository;

	@Override
	public User saveUser(User user) {
		return userRepository.save(user);
	}

	@Override
	public User checkLogin(String name, String password) {
		return userRepository.findFirstByNameAndPassword(name, password);
	}

}
