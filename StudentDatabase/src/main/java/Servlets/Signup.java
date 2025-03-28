package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import DAO.StudentDao;

@WebServlet("/signup")
public class Signup extends HttpServlet {
    protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            int id = Integer.parseInt(req.getParameter("id"));
            String name = req.getParameter("name");
            long contact =Long.parseLong(req.getParameter("contact"));
            String email = req.getParameter("email");
            String password = req.getParameter("password");
            String repassword = req.getParameter("repassword");
            
            int su=StudentDao.saveAdmin(id, name, contact, email, password,repassword);
            if(su==1) {
            	req.getRequestDispatcher("adminLogin.jsp").include(req,res);
            }
    		} catch (ClassNotFoundException | SQLException e) {
    			e.printStackTrace();
    			req.getRequestDispatcher("adminSignup.jsp").include(req, res);
    		}
    }
}
