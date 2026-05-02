package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Task;

public interface TaskService {
	
	Task addtask(Task task);
	
	List<Task> getTaskByUser(String email);
	
	Task updateStatus(Long id, String status);
	List<Task> getAllTasks();

}
