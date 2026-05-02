<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>User Dashboard</title>

<style>
body { font-family: Arial; background: #eef2f7; }

.container {
    width: 400px;
    margin: 80px auto;
    padding: 25px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
    text-align: center;
}

h2 { color: #333; }

.btn {
    display: block;
    margin: 10px;
    padding: 10px;
    background: green;
    color: white;
    text-decoration: none;
    border-radius: 5px;
}

.btn:hover {
    background: darkgreen;
}

.logout { background: red; }

.logout:hover { background: darkred; }
</style>

</head>
<body>

<div class="container">

    <h2>User Dashboard</h2>
    <p>Welcome, ${name}</p>

   
    <a href="/tasks/mytasks" class="btn">View My Tasks</a>

    <a href="/home" class="btn logout">Logout</a>

</div>

</body>
</html>