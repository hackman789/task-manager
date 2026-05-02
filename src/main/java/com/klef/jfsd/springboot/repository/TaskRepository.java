package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Task;
import java.util.List;


@Repository
public interface TaskRepository extends JpaRepository<Task, Long> {
	
	List<Task> findByAssignTo(String assignTo);

}
