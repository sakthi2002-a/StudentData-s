package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentDao;
import DTO.StudentDto;

@WebServlet("/findall")
public class findAll extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<StudentDto> students = StudentDao.findAllStudent();
            req.setAttribute("students", students); 
            req.getRequestDispatcher("adminHome.jsp").include(req, resp);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            resp.sendRedirect("error.jsp"); 
        }
    }
}


