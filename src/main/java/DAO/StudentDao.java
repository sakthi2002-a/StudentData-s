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
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/student", "root", "root");

	}
//	saveAdmin method
	
	public static int saveStudent(int id,String name,double physics,double chemistry,double maths) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2, name);
		ps.setDouble(3,physics);
		ps.setDouble(4, chemistry);
		ps.setDouble(5, maths);
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
			StudentDto st=new StudentDto(rs.getInt(1),rs.getString(2),rs.getDouble(3),rs.getDouble(4),rs.getDouble(5));
			return st;
		}
		return null;
		
	}
//	FindAll Student Method
	
	public static List<StudentDto> findAllStudent() throws ClassNotFoundException, SQLException {
	    Connection con = getcon();
	    PreparedStatement pr = con.prepareStatement("SELECT * FROM student");
	    ResultSet rs = pr.executeQuery();
	    
	    List<StudentDto> li = new ArrayList<>();
	    while (rs.next()) {
	        StudentDto st = new StudentDto(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getDouble(4), rs.getDouble(5));
	        li.add(st);
	    }
	    return li;
	}
	
//	update method
	
	public static boolean updateStudent(StudentDto student) throws ClassNotFoundException, SQLException {
	    Connection conn = getcon();
	    String query = "UPDATE student SET name=?, physics=?, chemistry=?, maths=? WHERE id=?";
	    PreparedStatement ps = conn.prepareStatement(query);
	    
	    ps.setString(1, student.getName());
	    ps.setDouble(2, student.getPhysics());
	    ps.setDouble(3, student.getChemistry());
	    ps.setDouble(4, student.getMaths());
	    ps.setInt(5, student.getId());

	    int rowsUpdated = ps.executeUpdate();
	    conn.close();
	    return rowsUpdated > 0;
	}



//	Save Admin method
	
	public static int saveAdmin(int id,String name,Long contact,String email,String password,String repassword) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("insert into admin values(?,?,?,?,?,?)");
		ps.setInt(1,id);
		ps.setString(2, name);
		ps.setLong(3,contact);
		ps.setString(4, email);
		ps.setString(5, password);
		ps.setString(6, repassword);
		int res=ps.executeUpdate();
		return res;
	}
//	Find Admin method
	
	public static Boolean FindAdmin(String email,String password) throws ClassNotFoundException, SQLException {
		Connection con=getcon();
		PreparedStatement ps=con.prepareStatement("select * from admin where email=? and password=?");
		ps.setString(1,email);
		ps.setString(2,password);
		ResultSet rs=ps.executeQuery();
		if(rs.next()) {
			return true;
		}else {
			return false;
		}
	}
	



	
	
}
