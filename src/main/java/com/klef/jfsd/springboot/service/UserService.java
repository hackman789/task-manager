package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.User;

public interface UserService {
	
	public User register(User user);
	public User login(String email, String password);
	
	List<User> getAllMembers();

}
