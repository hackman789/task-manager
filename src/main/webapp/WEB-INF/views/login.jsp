<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>

<style>
body {
    font-family: Arial;
    background: #eef2f7;
}

.container {
    width: 350px;
    margin: 100px auto;
    padding: 25px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

input {
    width: 100%;
    padding: 8px;
    margin: 8px 0;
}

button {
    width: 100%;
    padding: 10px;
    background: blue;
    color: white;
    border: none;
    border-radius: 5px;
}

button:hover {
    background: darkblue;
}

.error {
    color: red;
}
</style>

</head>
<body>

<div class="container">
    <h2>Login</h2>

    <form action="checkuserlogin" method="post">

        <input type="email" name="email" placeholder="Enter Email" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <button type="submit">Login</button>
    </form>

    <p class="error">${error}</p>

    <a href="register">New user? Register</a>
</div>

</body>
</html>