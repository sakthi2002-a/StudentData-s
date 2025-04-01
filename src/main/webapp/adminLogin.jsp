<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Login Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            animation: fadeIn 0.8s ease-in-out;
        }

        .container {
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 5px 15px rgba(0, 0, 0, 0.2);
            width: 350px;
            text-align: center;
            animation: slideDown 0.6s ease-in-out;
        }

        h2 {
            color: #333;
            margin-bottom: 15px;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 10px;
            text-align: left;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            transition: border 0.3s ease-in-out;
        }

        input:focus {
            outline: none;
            border-color: #007BFF;
            box-shadow: 0px 0px 8px rgba(0, 123, 255, 0.5);
        }

        button {
            background-color: #007BFF;
            color: white;
            border: none;
            padding: 12px;
            width: 100%;
            margin-top: 15px;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            transition: background 0.3s ease-in-out, transform 0.2s;
        }

        button:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        a {
            text-decoration: none;
            color: #007BFF;
            font-size: 14px;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            text-decoration: underline;
            color: #0056b3;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
            display: none;
        }

        /* Animations */
        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-50px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Login</h2>
        
        <% String message = (String) request.getAttribute("message"); %>
        <% if (message != null) { %>
            <p class="error-message" id="errorMessage"><%= message %></p>
        <% } %>

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
    </div>

    <script>
        // Show error message with animation if present
        document.addEventListener("DOMContentLoaded", function() {
            let errorMessage = document.getElementById("errorMessage");
            if (errorMessage) {
                errorMessage.style.display = "block";
            }
        });
    </script>
</body>
</html>
