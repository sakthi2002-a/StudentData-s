<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List, DTO.StudentDto, DAO.StudentDao" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Student Details</title>
    <!-- Bootstrap 5 CDN -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <% StudentDto std = (StudentDto) request.getAttribute("student"); %>
        
        <div class="card shadow-lg p-4">
            <h2 class="text-center text-primary">Update Student Details</h2>
            
            <form action="edit" method="post">
                <div class="mb-3">
                    <label for="id" class="form-label">ID:</label>
                    <input type="text" class="form-control" name="id" id="id" readonly value="<%= std.getId() %>">
                </div>

                <div class="mb-3">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" name="name" id="name" value="<%= std.getName() %>" required>
                </div>

                <div class="mb-3">
                    <label for="physics" class="form-label">Physics:</label>
                    <input type="number" class="form-control" name="physics" id="physics" step="0.1" value="<%= std.getPhysics() %>" required>
                </div>

                <div class="mb-3">
                    <label for="chemistry" class="form-label">Chemistry:</label>
                    <input type="number" class="form-control" name="chemistry" id="chemistry" step="0.1" value="<%= std.getChemistry() %>" required>
                </div>

                <div class="mb-3">
                    <label for="maths" class="form-label">Maths:</label>
                    <input type="number" class="form-control" name="maths" id="maths" step="0.1" value="<%= std.getMaths() %>" required>
                </div>

                <div class="text-center">
                    <button type="submit" class="btn btn-primary btn-lg">Update</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
