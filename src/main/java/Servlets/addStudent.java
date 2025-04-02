package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import DAO.StudentDao;

@WebServlet("/addStudent")
public class addStudent extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            double physics = Double.parseDouble(req.getParameter("physics"));
            double chemistry = Double.parseDouble(req.getParameter("chemistry"));
            double maths = Double.parseDouble(req.getParameter("maths"));

            int result = StudentDao.saveStudent(id, name, physics, chemistry, maths);

            if (result == 1) {
                
                resp.sendRedirect("adminHome.jsp?message=Student+Added+Successfully");
            } else {
                req.setAttribute("message", "Failed to add student. Try again.");
                req.getRequestDispatcher("addStudent.jsp").forward(req, resp);
            }
        } catch (Exception e) {
            req.setAttribute("message", "Error: " + e.getMessage());
            req.getRequestDispatcher("addStudent.jsp").forward(req, resp);
            e.printStackTrace();
        }
    }
}
