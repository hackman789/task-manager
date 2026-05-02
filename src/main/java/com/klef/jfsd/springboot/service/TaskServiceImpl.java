package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Task;
import com.klef.jfsd.springboot.repository.TaskRepository;

@Service
public class TaskServiceImpl implements TaskService {
	
	
	@Autowired
	public TaskRepository taskRepository;

	@Override
	public Task addtask(Task task) {
		 task.setStatus("TODO");
		  return taskRepository.save(task);
		
	}

	@Override
	public List<Task> getTaskByUser(String email) {
		return taskRepository.findByAssignTo(email);
	}

	@Override
	public Task updateStatus(Long id, String status) {
		
		Task t = taskRepository.findById(id).orElse(null);
		
		if(t != null) {
			t.setStatus(status);
			return taskRepository.save(t);
		}
		return null;
	}
	@Override
	public List<Task> getAllTasks() {
	    return taskRepository.findAll();
	}

}
