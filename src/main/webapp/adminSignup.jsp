<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin SignUp Page</title>
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
            width: 400px;
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

        .error-border {
            border: 3px solid red !important;
        }

        .success-border {
            border: 3px solid green !important;
        }

        .password-match {
            font-size: 14px;
            margin-top: 5px;
            font-weight: bold;
        }

        .password-match.error {
            color: red;
        }

        .password-match.success {
            color: green;
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
            display: block;
            margin-top: 10px;
            transition: color 0.3s ease-in-out;
        }

        a:hover {
            text-decoration: underline;
            color: #0056b3;
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
        <h2>Admin Signup</h2>
        <form action="signup" method="get" onsubmit="return validateForm(event)">
            <label for="id">ID :</label>
            <input type="text" name="id" id="id" required />

            <label for="name">NAME : </label>
            <input type="text" name="name" id="name" required />

            <label for="contact">CONTACT :</label>
            <input type="text" name="contact" id="contact" pattern="[0-9]{10}" title="Enter a valid 10-digit phone number" required />

            <label for="email">Email :</label>
            <input type="email" name="email" id="email" required />

            <label for="password">PASSWORD :</label>
            <input type="password" name="password" id="password" required placeholder="PASSWORD"/>

            <label for="repassword">RE-PASSWORD :</label>
            <input type="password" name="repassword" id="repassword" required placeholder="RE-PASSWORD" onkeyup="passwordCheck()" />
            <p class="password-match" id="passwordMessage"></p>

            <button type="submit">SUBMIT</button>
        </form>

        <a href="adminLogin.jsp">Already have an account? Login</a>
    </div>

    <script>
        function passwordCheck() {
            const pass = document.getElementById("password").value;
            const repass = document.getElementById("repassword").value;
            const message = document.getElementById("passwordMessage");

            if (pass.length < 6) {
                message.textContent = "Password must be at least 6 characters.";
                message.className = "password-match error";
            } else if (pass !== repass) {
                message.textContent = "Passwords do not match ❌";
                message.className = "password-match error";
            } else {
                message.textContent = "Passwords match ✅";
                message.className = "password-match success";
            }
        }

        function validateForm(event) {
            const id = document.getElementById("id").value.trim();
            const name = document.getElementById("name").value.trim();
            const contact = document.getElementById("contact").value.trim();
            const email = document.getElementById("email").value.trim();
            const password = document.getElementById("password").value.trim();
            const repassword = document.getElementById("repassword").value.trim();
            const message = document.getElementById("passwordMessage").textContent;

            if (!id || !name || !contact || !email || !password || !repassword) {
                alert("Please fill all fields.");
                event.preventDefault();
                return false;
            }

            if (password.length < 6) {
                alert("Password must be at least 6 characters.");
                event.preventDefault();
                return false;
            }

            if (message.includes("❌")) {
                alert("Passwords do not match.");
                event.preventDefault();
                return false;
            }

            return true;
        }
    </script>
</body>
</html>
