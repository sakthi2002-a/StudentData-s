<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin SignUp Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
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
            width: 400px;
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
            padding: 10px;
            margin-top: 5px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 14px;
            transition: all 0.3s ease-in-out;
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
            display: block;
            margin-top: 10px;
        }

        a:hover {
            text-decoration: underline;
        }

        .error-border {
            border: 3px solid red !important;
        }

        .success-border {
            border: 3px solid green !important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Admin Signup</h2>
        <form action="signup" method="get">
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
            <input type="password" name="repassword" id="repassword" required onkeyup="passwordCheck()" placeholder="RE-PASSWORD"/>

            <button type="submit" onclick="validateForm()">SUBMIT</button>
        </form>

        <a href="adminLogin.jsp">Already have an account? Login</a>
    </div>

    <script>
        function passwordCheck() {
            const pass = document.getElementById("password").value;
            const repass = document.getElementById("repassword").value;
            const repassField = document.getElementById("repassword");

            if (pass !== repass) {
                repassField.classList.add("error-border");
                repassField.classList.remove("success-border");
            } else {
                repassField.classList.add("success-border");
                repassField.classList.remove("error-border");
            }
        }

        function validateForm(event) {
            const fields = ["id", "name", "contact", "email", "password", "repassword"];
            for (let field of fields) {
                if (document.getElementById(field).value.trim() === "") {
                    alert("Please fill all fields.");
                    event.preventDefault();
                    return false;
                }
            }
        }
    </script>
</body>
</html>
