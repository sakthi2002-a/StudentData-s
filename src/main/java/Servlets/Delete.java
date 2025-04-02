package Servlets;

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
			e.printStackTrace();
		}
	}

}