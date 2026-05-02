<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Register</title>

<style>
body {
    font-family: Arial;
    background: #eef2f7;
}

.container {
    width: 350px;
    margin: 80px auto;
    padding: 25px;
    background: white;
    border-radius: 10px;
    box-shadow: 0 0 10px gray;
}

input, select {
    width: 100%;
    padding: 8px;
    margin: 8px 0;
}

button {
    width: 100%;
    padding: 10px;
    background: green;
    color: white;
    border: none;
    border-radius: 5px;
}

button:hover {
    background: darkgreen;
}

a {
    text-decoration: none;
}
</style>

</head>
<body>

<div class="container">
    <h2>Register</h2>

    <form action="signup" method="post">

        <input type="text" name="name" placeholder="Enter Name" required>

        <input type="email" name="email" placeholder="Enter Email" required>

        <input type="password" name="password" placeholder="Enter Password" required>

        <select name="role">
            <option value="ADMIN">Admin</option>
            <option value="MEMBER">Member</option>
        </select>

        <button type="submit">Register</button>
    </form>

    <br>
    <a href="login">Already have account? Login</a>
</div>

</body>
</html>