<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            width: 350px;
            text-align: center;
        }

        h2 {
            color: #333;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
        }

        input:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0px 0px 5px rgba(0, 123, 255, 0.5);
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 10px;
            width: 100%;
            margin-top: 15px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s;
        }

        button:hover {
            background-color: #0056b3;
        }

        a {
            text-decoration: none;
            color: #007BFF;
            font-size: 14px;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        <form action="signin" method="post">
            <label for="email">EMAIL:</label>
            <input type="email" name="email" id="email" required>

            <label for="password">PASSWORD:</label>
            <input type="password" name="password" id="password" required>

            <button type="submit">LOGIN</button>
        </form>

        <br>
        <a href="#">Not a User?</a>
        <br><br>
        <a href="adminSignup.jsp">SIGN UP</a>

        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <script type="text/javascript">
                alert("<%= message %>");
            </script>
        <% } %>
    </div>
</body>
</html>
