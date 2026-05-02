<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.springboot.model.Task" %>
<%@ page import="com.klef.jfsd.springboot.model.Project" %>
<%@ page import="com.klef.jfsd.springboot.service.ProjectService" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<!DOCTYPE html>
<html>
<head>
<title>My Tasks</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 80%;
    margin: 50px auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

h2 {
    text-align: center;
    color: #333;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th, td {
    padding: 10px;
    text-align: center;
}

th {
    background: #007bff;
    color: white;
}

tr:nth-child(even) {
    background: #f2f2f2;
}

/* 🔥 Status colors */
.todo { color: red; font-weight: bold; }
.progress { color: orange; font-weight: bold; }
.done { color: green; font-weight: bold; }

select {
    padding: 5px;
}

button {
    padding: 5px 10px;
    background: green;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: darkgreen;
}

.empty {
    text-align: center;
    color: red;
    font-weight: bold;
    margin-top: 20px;
}
</style>

</head>

<body>

<div class="container">

<h2>My Tasks</h2>

<%
List<Task> tasks = (List<Task>) request.getAttribute("tasks");

// 🔥 get ProjectService
ProjectService ps = WebApplicationContextUtils
.getRequiredWebApplicationContext(application)
.getBean(ProjectService.class);
%>

<%
if(tasks != null && !tasks.isEmpty()) {
%>

<table>
<tr>
<th>ID</th>
<th>Title</th>
<th>Project</th>
<th>Status</th>
<th>Update</th>
</tr>

<%
for(Task t : tasks) {

Project p = ps.getProjectById(t.getProjectId());
String statusClass = "";

if("TODO".equals(t.getStatus())) statusClass = "todo";
else if("IN_PROGRESS".equals(t.getStatus())) statusClass = "progress";
else if("DONE".equals(t.getStatus())) statusClass = "done";
%>

<tr>
<td><%= t.getId() %></td>
<td><%= t.getTitle() %></td>

<td><%= (p != null) ? p.getName() : "N/A" %></td>

<td class="<%= statusClass %>">
<%= t.getStatus() %>
</td>

<td>
<form action="/tasks/update" method="post">
<input type="hidden" name="id" value="<%= t.getId() %>">

<select name="status">
<option value="TODO">TODO</option>
<option value="IN_PROGRESS">IN_PROGRESS</option>
<option value="DONE">DONE</option>
</select>

<button type="submit">Update</button>
</form>
</td>

</tr>

<% } %>

</table>

<% } else { %>

<p class="empty">No Tasks Assigned</p>

<% } %>

</div>

</body>
</html>