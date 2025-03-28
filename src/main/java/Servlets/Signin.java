package Servlets;

import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import DAO.StudentDao;

@WebServlet("/signin")
public class Signin extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        StudentDao st=new StudentDao();
        try {
            boolean isValid = st.FindAdmin(email, password);
            if (isValid) {
                req.setAttribute("message", "Login successful");
                req.getRequestDispatcher("adminHome.jsp").forward(req, resp);
            } else {
                req.setAttribute("message", "Invalid username or password");
                req.getRequestDispatcher("adminLogin.jsp").forward(req, resp);
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            req.setAttribute("message", "Database error, please try again.");
            req.getRequestDispatcher("adminLogin.jsp").forward(req, resp);
        }
    }
}
