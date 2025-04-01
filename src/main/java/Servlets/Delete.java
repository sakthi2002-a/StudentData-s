package Servlets;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import DAO.StudentDao;
//
//@WebServlet("/delete")
//public class Delete extends HttpServlet {
//    @Override
//    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        try {
//            // Validate ID parameter
//            String idParam = req.getParameter("id");
//            if (idParam == null || idParam.isEmpty()) {
//                resp.sendRedirect("adminHome.jsp?message=Invalid ID");
//                return;
//            }
//
//            int id = Integer.parseInt(idParam);
//            
//            // Call delete method
//            int del = StudentDao.deleteStudent(id);
//
//            // Redirect with a message
//            if (del == 1) {
//                resp.sendRedirect("adminHome.jsp?message=Record deleted successfully");
//            } else {
//                resp.sendRedirect("adminHome.jsp?message=No record found for deletion");
//            }
//        } catch (NumberFormatException e) {
//            resp.sendRedirect("adminHome.jsp?message=Invalid ID format");
//        } catch (ClassNotFoundException | SQLException e) {
//            e.printStackTrace(); // Log for debugging
//            resp.sendRedirect("adminHome.jsp?message=Database error occurred");
//        }
//    }
//}




import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import DAO.StudentDao;

@WebServlet("/delete")
public class Delete extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int id=Integer.parseInt(req.getParameter("id"));
		
		
		try {
			
			int a=StudentDao.deleteStudent(id);
			if(a==1)
			{
				req.setAttribute("message", a+"data has been deleted");
				req.getRequestDispatcher("adminHome.jsp").include(req, resp);;
			}
			else
			{ 
				req.setAttribute("message", "no data deleted");
				req.getRequestDispatcher("adminHome.jsp").include(req, resp);;
				
			}
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}