package com.klef.jfsd.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	
	@Autowired
	public UserService userService;
	
	
	@GetMapping("/home")
	public ModelAndView home() 
	{
		 ModelAndView mv = new ModelAndView();
		 return new ModelAndView("index");
	}

	@GetMapping("/register")
	public ModelAndView Register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	}
	
	 @PostMapping("/signup")
	 public ModelAndView Signup(HttpServletRequest request) throws Exception {
		 
		 String name = request.getParameter("name");
		 String email = request.getParameter("email");
		 String pasword = request.getParameter("password");
		 String role = request.getParameter("role");
		 
		 User us = new User();
		  us.setName(name);
		  us.setEmail(email);
		  us.setPassword(pasword);
		  us.setRole(role);
		  
		  userService.register(us);

	        ModelAndView mv = new ModelAndView();
	        mv.setViewName("login");
	        mv.addObject("msg", "Registration Successful!");
	        return mv;
		 
	 }
	
	@GetMapping("/login")
	public ModelAndView Login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	
	@PostMapping("checkuserlogin")
	public ModelAndView checkuserlogin(HttpServletRequest request) {
		
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		ModelAndView mv = new ModelAndView();
		
		User us = userService.login(email, password);
		
		if(us == null) {
			HttpSession session = request.getSession();
			session.setAttribute("error", "check your credentials");
			System.out.println("Details not found");
	        mv.setViewName("redirect:/login");
		}
		else {
			HttpSession session = request.getSession();
	        session.setAttribute("user", us);
	        
	        if(us.getRole().equals("ADMIN")) {
	        mv.setViewName("redirect:/adminDashboard");
	        }else {
	        	mv.setViewName("redirect:/userDashboard");
	        }
		}
		return mv;
	   }
	@GetMapping("/adminDashboard")
	public ModelAndView adminDashboard(HttpServletRequest request) {

	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    ModelAndView mv = new ModelAndView();

	    if (user != null && user.getRole().equals("ADMIN")) {
	        mv.setViewName("adminDashboard");
	        mv.addObject("name", user.getName());
	    } else {
	        mv.setViewName("redirect:/userDashboard");
	    }

	    return mv;
	}
	@GetMapping("/userDashboard")
	public ModelAndView userDashboard(HttpServletRequest request) {

	    HttpSession session = request.getSession();
	    User user = (User) session.getAttribute("user");

	    ModelAndView mv = new ModelAndView();

	    if (user != null && user.getRole().equals("MEMBER")) {
	        mv.setViewName("userDashboard");
	        mv.addObject("name", user.getName());
	    } else {
	        mv.setViewName("redirect:/login");
	    }

	    return mv;
	}


}
