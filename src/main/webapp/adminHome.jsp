<%@ page import="java.util.List, DTO.StudentDto, DAO.StudentDao" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Details</title>

    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        body {
            background: linear-gradient(to right, #74ebd5, #acb6e5);
            padding: 20px;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            animation: fadeIn 0.8s ease-in-out;
        }

        table {
            animation: slideUp 0.6s ease-in-out;
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

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(50px);
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
        <h1 class="text-center text-primary mb-4">Student Details</h1>

        <div class="table-responsive">
            <table class="table table-bordered table-hover">
                <thead class="table-primary text-center">
                    <tr>
                        <th>ID</th>
                        <th>NAME</th>
                        <th>PHYSICS</th>
                        <th>CHEMISTRY</th>
                        <th>MATHS</th>
                        <th>EDIT</th>
                        <th>DELETE</th>
                    </tr>
                </thead>
                <tbody class="text-center">
                    <%
                        StudentDao dao = new StudentDao();
                        List<StudentDto> students = dao.findAllStudent();  

                        if (students != null && !students.isEmpty()) {
                            for (StudentDto student : students) {  
                    %>
                    <tr>
                        <td><%= student.getId() %></td>
                        <td><%= student.getName() %></td>
                        <td><%= student.getPhysics() %></td>
                        <td><%= student.getChemistry() %></td>
                        <td><%= student.getMaths() %></td>
                        <td><a href="edit?id=<%= student.getId() %>" class="btn btn-warning btn-sm">Edit</a></td>
                        <td><a href="#" class="btn btn-danger btn-sm" onclick="confirmDelete(<%= student.getId() %>)">Delete</a></td>
                    </tr>
                    <%
                            }
                        } else {
                    %>
                    <tr>
                        <td colspan="7" class="text-danger">No Students Found</td>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
        </div>

        <div class="text-center mt-4">
            <a href="addStudent.jsp" class="btn btn-success me-2">ADD STUDENT</a>
            <a href="index.jsp" class="btn btn-danger">LOGOUT</a>
        </div>
    </div>

    <script>
        function confirmDelete(id) {
            if (confirm("Are you sure you want to delete this student?")) {
                window.location.href = "delete?id=" + id;
            }
        }
    </script>
</body>
</html>
