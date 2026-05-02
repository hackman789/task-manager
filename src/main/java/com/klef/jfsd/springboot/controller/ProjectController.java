package com.klef.jfsd.springboot.controller;

import java.net.http.HttpRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.service.ProjectService;

import jakarta.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/projects")
public class ProjectController {
	
	@Autowired
	public ProjectService projectService;
	
	@GetMapping("/addProject")
	public ModelAndView addProject() {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("addProject");
		return mv;
	}
	
	@PostMapping("/saveProject")
	public ModelAndView SaveProject(HttpServletRequest request) throws Exception {
	
	String name = request.getParameter("name");
	String description = request.getParameter("description");
	
	  Project pro = new Project();
	   pro.setName(name);
	   pro.setDescription(description);
	   
	   projectService.addProject(pro);
	   
	   ModelAndView mv = new ModelAndView();
	   mv.setViewName("adminDashboard");
	   mv.addObject("msg", "project added Sucessfully");
	   return mv;
	}

}
