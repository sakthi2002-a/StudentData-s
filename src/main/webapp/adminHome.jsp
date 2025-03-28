<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Home</title>
</head>
<body>
    <h1>Welcome to Admin Home</h1>

    <% String message = (String) request.getAttribute("message"); %>
    <% if (message != null && message.equals("Login successful")) { %>
        <script type="text/javascript">
            alert("Login successful!");
        </script>
    <% } %>

    <a href="adminLogin.jsp">Logout</a>
</body>
</html>
