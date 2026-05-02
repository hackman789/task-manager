package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Project;
import com.klef.jfsd.springboot.repository.ProjectRepository;

@Service
public class ProjectServiceImp implements ProjectService {
	
	@Autowired
	public ProjectRepository projectRepository;

	@Override
	public Project addProject(Project project) {
		// TODO Auto-generated method stub
		return  projectRepository.save(project);
	}
	
	@Override
	public List<Project> getAllProjects() {
	    return projectRepository.findAll();
	}
	@Override
	public Project getProjectById(Long id) {
	    return projectRepository.findById(id).orElse(null);
	}

}
