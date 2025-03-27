package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import DTO.StudentDto;

public class StudentDao {
//	Connection method
	public static Connection getcon() throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.cj.jdbc.Driver");
		return DriverManager.getConnection("jdbc:mysql://student","root","root");
	}
//	saveAdmin method
	
	public static int savStudent(int id,String name,int physics,int chemistry,int maths) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2, name);
		ps.setInt(3,physics);
		ps.setInt(4, chemistry);
		ps.setInt(5, maths);
		int res=ps.executeUpdate();
		return res;
	}
//	FindAdmin method
	
	public static int deleteStudent(int id) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement pr=con.prepareStatement("delete from student where id=?");
		pr.setInt(1, id);
		int rs=pr.executeUpdate();
		return rs;
	}
//	Find Student method
	
	public static StudentDto findStudent(int id) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement pr=con.prepareStatement("select * from student where id=?");
		pr.setInt(1, id);
		ResultSet rs=pr.executeQuery();
		while(rs.next()) {
			StudentDto st=new StudentDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
			return st;
		}
		return null;
		
	}
//	FindAll Student Method
	
	public static List<StudentDto> findAllStudent(int id) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement pr=con.prepareStatement("select * from student");
		pr.setInt(1, id);
		ResultSet rs=pr.executeQuery();
//		ArrayList obj creation
		List<StudentDto> li=new ArrayList<StudentDto>();
		while(rs.next()) {
			StudentDto st=new StudentDto(rs.getInt(1),rs.getString(2),rs.getInt(3),rs.getInt(4),rs.getInt(5));
			li.add(st);
		}
		return li;
	}
//	Save Admin method
	
	public static int savAdmin(int id,String name,Long contact,String email,String password) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("insert into admin values(?,?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2, name);
		ps.setLong(3,contact);
		ps.setString(4, email);
		ps.setString(5, password);
		int res=ps.executeUpdate();
		return res;
	}
//	Find Admin method
	
	public static boolean findAdmin(String email,String password) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("select * from admin where email=? and password=?");
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
	}
	
}
