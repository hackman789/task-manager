<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Admin Dashboard</title>

<style>
body {
    font-family: Arial;
    background: #f4f6f9;
}

.container {
    width: 420px;
    margin: 80px auto;
    padding: 25px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
    text-align: center;
}

h2 {
    color: #333;
}

.btn {
    display: block;
    margin: 10px;
    padding: 10px;
    background: #007bff;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.btn:hover {
    background: #0056b3;
}

.logout {
    background: red;
}

.msg {
    color: green;
    margin-bottom: 10px;
}
</style>

</head>
<body>

<div class="container">

    <h2>Admin Dashboard</h2>
    <p>Welcome, ${name}</p>

    <!-- ✅ Success Message -->
    <p class="msg">${msg}</p>

    <hr>

    <a href="/projects/addProject" class="btn">Create Project</a>

    <a href="/tasks/addtask" class="btn">Assign Task</a>

    
    <a href="/tasks/all" class="btn">View All Tasks</a>

   

    <a href="/home" class="btn logout">Logout</a>

</div>

</body>
</html>