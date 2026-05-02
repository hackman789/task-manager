<%@ page import="java.util.List" %>
<%@ page import="com.klef.jfsd.springboot.model.User" %>
<%@ page import="com.klef.jfsd.springboot.model.Project" %>

<%
List<User> users = (List<User>) request.getAttribute("users");
List<Project> projects = (List<Project>) request.getAttribute("projects");
%>

<!DOCTYPE html>
<html>
<head>
<title>Assign Task</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 400px;
    margin: 80px auto;
    padding: 25px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

h2 {
    text-align: center;
    color: #333;
}

label {
    font-weight: bold;
}

input, select {
    width: 100%;
    padding: 8px;
    margin-top: 5px;
    margin-bottom: 15px;
    border-radius: 5px;
    border: 1px solid #ccc;
}

button {
    width: 100%;
    padding: 10px;
    background: #007bff;
    color: white;
    border: none;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background: #0056b3;
}
</style>

</head>

<body>

<div class="container">

<h2>Assign Task</h2>

<form action="/tasks/save" method="post">

<label>Task Title:</label>
<input type="text" name="title" required>

<label>Assign To:</label>
<select name="assignedTo" required>
<% for(User u : users) { %>
<option value="<%= u.getEmail() %>"><%= u.getName() %></option>
<% } %>
</select>

<label>Project:</label>
<select name="projectId" required>
<% for(Project p : projects) { %>
<option value="<%= p.getId() %>"><%= p.getName() %></option>
<% } %>
</select>

<button type="submit">Assign Task</button>

</form>

</div>

</body>
</html>