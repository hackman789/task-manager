package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Project;

public interface ProjectService {
	
	public Project addProject(Project project);
	List<Project> getAllProjects();
	public  Project getProjectById(Long id);
}
