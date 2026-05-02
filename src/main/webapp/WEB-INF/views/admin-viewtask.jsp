<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.springboot.model.Task" %>
<%@ page import="com.klef.jfsd.springboot.model.Project" %>
<%@ page import="com.klef.jfsd.springboot.service.ProjectService" %>
<%@ page import="org.springframework.web.context.support.WebApplicationContextUtils" %>

<!DOCTYPE html>
<html>
<head>
<title>Admin - All Tasks</title>

<style>
body { font-family: Arial; background: #f4f6f9; }

.container {
    width: 85%;
    margin: 40px auto;
    background: white;
    padding: 20px;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

h2 { text-align: center; }

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

.todo { color: red; }
.progress { color: orange; }
.done { color: green; }
</style>

</head>

<body>

<div class="container">

<h2>All Tasks</h2>

<%
List<Task> tasks = (List<Task>) request.getAttribute("tasks");

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
<th>Assigned To</th>
<th>Project</th>
<th>Status</th>
</tr>

<%
for(Task t : tasks) {

Project p = ps.getProjectById(t.getProjectId());

String cls = "";
if("TODO".equals(t.getStatus())) cls="todo";
else if("IN_PROGRESS".equals(t.getStatus())) cls="progress";
else cls="done";
%>

<tr>
<td><%= t.getId() %></td>
<td><%= t.getTitle() %></td>
<td><%= t.getAssignTo() %></td>
<td><%= (p != null) ? p.getName() : "N/A" %></td>
<td class="<%= cls %>"><%= t.getStatus() %></td>
</tr>

<% } %>

</table>

<% } else { %>

<p>No tasks available</p>

<% } %>

</div>

</body>
</html>