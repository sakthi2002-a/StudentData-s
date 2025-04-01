package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentDao;
import DTO.StudentDto;

@WebServlet("/edit")
public class edit extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        
        try {
            StudentDto std = StudentDao.findStudent(id);
            if (std != null) {
                req.setAttribute("student", std);
                req.getRequestDispatcher("edit.jsp").include(req, resp);
            } else {
                resp.sendRedirect("adminHome.jsp"); 
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adinHome.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        String name = req.getParameter("name");
        double physics = Double.parseDouble(req.getParameter("physics"));
        double chemistry = Double.parseDouble(req.getParameter("chemistry"));
        double maths = Double.parseDouble(req.getParameter("maths"));

        StudentDto student = new StudentDto(id, name, physics, chemistry, maths);

        try {
            boolean updated = StudentDao.updateStudent(student);
            if (updated) {
                resp.sendRedirect("adminHome.jsp"); 
            } else {
                req.setAttribute("error", "Update failed!");
                req.getRequestDispatcher("edit.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("adminHome.jsp");
        }
    }
}
