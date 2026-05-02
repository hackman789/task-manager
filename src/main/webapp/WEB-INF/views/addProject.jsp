<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<title>Create Project</title>

<style>
body { font-family: Arial; background: #eef2f7; }
.container {
    width: 350px; margin: 80px auto; padding: 20px;
    background: white; border-radius: 10px;
    box-shadow: 0 0 10px gray;
}
input, textarea {
    width: 100%; padding: 8px; margin: 10px 0;
}
button {
    width: 100%; padding: 10px;
    background: blue; color: white;
}
</style>

</head>
<body>

<div class="container">
<h2>Create Project</h2>

<form action="/projects/saveProject" method="post">

    <input type="text" name="name" placeholder="Project Name" required>

    <textarea name="description" placeholder="Description"></textarea>

    <button type="submit">Create</button>

</form>

</div>

</body>
</html>