package com.klef.jfsd.springboot.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.User;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
	 
	User findByEmail(String email);
	List<User> findByRole(String role);

}
