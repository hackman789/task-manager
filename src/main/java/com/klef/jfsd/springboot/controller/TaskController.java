package com.klef.jfsd.springboot.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Task;
import com.klef.jfsd.springboot.model.User;
import com.klef.jfsd.springboot.service.ProjectService;
import com.klef.jfsd.springboot.service.TaskService;
import com.klef.jfsd.springboot.service.UserService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/tasks")
public class TaskController {

    @Autowired
    public TaskService taskService;

    @Autowired
    public UserService userService;

    @Autowired
    public ProjectService projectService;

    // 🔹 Show form (FIXED)
    @GetMapping("/addtask")
    public ModelAndView addtask() {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("task");

        
        mv.addObject("users", userService.getAllMembers());
        mv.addObject("projects", projectService.getAllProjects());

        return mv;
    }

   
    @PostMapping("/save")
    public ModelAndView saveTask(HttpServletRequest request) {

        String title = request.getParameter("title");
        String assignedTo = request.getParameter("assignedTo"); 
        Long projectId = Long.parseLong(request.getParameter("projectId"));

        Task t = new Task();
        t.setTitle(title);
        t.setAssignTo(assignedTo); 
        t.setProjectId(projectId);

        taskService.addtask(t);

        return new ModelAndView("redirect:/adminDashboard"); // ✅ correct
    }
    
    
    @GetMapping("/mytasks")
    public ModelAndView viewMyTasks(HttpServletRequest request) {

        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        ModelAndView mv = new ModelAndView();

        if (user != null) {

            List<Task> tasks = taskService.getTaskByUser(user.getEmail());

            mv.setViewName("user-viewtask");
            mv.addObject("tasks", tasks);

        } else {
            mv.setViewName("redirect:/login");
        }

        return mv;
    }
    @GetMapping("/all")
    public ModelAndView viewAllTasks() {

        ModelAndView mv = new ModelAndView();

        mv.setViewName("admin-viewtask"); // separate page
        mv.addObject("tasks", taskService.getAllTasks());

        return mv;
    }
    
    @PostMapping("/update")
    public ModelAndView updateTask(HttpServletRequest request) {

        Long id = Long.parseLong(request.getParameter("id"));
        String status = request.getParameter("status");

        taskService.updateStatus(id, status);

        return new ModelAndView("redirect:/tasks/mytasks");
    }
}