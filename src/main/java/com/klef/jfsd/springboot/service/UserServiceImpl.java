package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.repository.UserRepository;


@Service
public class UserServiceImpl implements UserService  {
	
	@Autowired
	public UserRepository userRepo;

	@Override
	public User register(User user) {
		// TODO Auto-generated method stub
		return userRepo.save(user);
	}

	@Override
	public User login(String email, String password) {
		  User user = userRepo.findByEmail(email);

	        if (user != null && user.getPassword().equals(password)) {
	            return user;
	        }

	        return null;
	    
	}

	@Override
	public List<User> getAllMembers() {
		 return userRepo.findByRole("MEMBER");
		
	}
	

}
