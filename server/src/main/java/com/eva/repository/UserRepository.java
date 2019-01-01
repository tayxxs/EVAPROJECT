package com.eva.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.eva.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
	
	User findFirstByNameAndPassword(String name, String password);
	
	List<User> findByName(String name);
	
	List<User> findById(long id);
}
