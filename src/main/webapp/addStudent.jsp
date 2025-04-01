<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: #fff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
        }

        h1 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
        }

        td {
            padding: 10px;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        input {
            width: 100%;
            padding: 10px;
            border: 2px solid #ddd;
            border-radius: 6px;
            transition: all 0.3s ease-in-out;
            font-size: 16px;
        }

        input:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            transform: scale(1.05);
        }

        button {
            width: 100%;
            padding: 12px;
            background: #007bff;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 18px;
            transition: all 0.3s ease-in-out;
        }

        button:hover {
            background: #0056b3;
            transform: scale(1.05);
        }

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
    </style>
</head>
<body>
    <div class="container">
        <h1>Add Student</h1>
        <form action="addStudent" method="get">
            <table>
                <tr>
                    <td><label for="id">ID :</label></td>
                    <td><input type="text" name="id" id="id" required></td>
                </tr>
                <tr>
                    <td><label for="name">NAME :</label></td>
                    <td><input type="text" name="name" id="name" required></td>
                </tr>
                <tr>
                    <td><label for="physics">PHYSICS :</label></td>
                    <td><input type="number" name="physics" id="physics" required></td>
                </tr>
                <tr>
                    <td><label for="chemistry">CHEMISTRY :</label></td>
                    <td><input type="number" name="chemistry" id="chemistry" required></td>
                </tr>
                <tr>
                    <td><label for="maths">MATHS :</label></td>
                    <td><input type="number" name="maths" id="maths" required></td>
                </tr>
            </table>
            <button type="submit">SUBMIT</button>
        </form>
    </div>
</body>
</html>
