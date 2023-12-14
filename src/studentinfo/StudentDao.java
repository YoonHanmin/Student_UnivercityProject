package studentinfo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import user.User;

public class StudentDao {
	private Connection connection;
	private PreparedStatement pstmt;
	ResultSet rs;
	
	public StudentDao() {
		try {
			String Db_Driver = "org.mariadb.jdbc.Driver";
			String Db_Url = "jdbc:mariadb://localhost:3306/student";
			String Db_User = "root";
			String Db_Password = "1234";
			Class.forName(Db_Driver);
			connection = DriverManager.getConnection(Db_Url, Db_User, Db_Password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public int join(StudentInfo std) {
		String sql = "insert into studentinfo values(?,?,?,?,?)";
		try{ 
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} return -1;
		
	}
	
	public StudentInfo getStudent(int userNum) {
		String sql = "SELECT *,department.dept_name FROM studentinfo LEFT JOIN department ON studentinfo.dept_id = department.id where userNum=?";
		
		try {
			
		StudentInfo std = new StudentInfo();
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, userNum);
			rs = pstmt.executeQuery();
			if(rs.next()) {
			std.setName(rs.getString("name"));
			std.setUserNum(rs.getInt("userNum"));
			std.setBirth(rs.getString("birth"));
			std.setAdmin_year(rs.getString("admin_year"));
			std.setGradu_year(rs.getString("gradu_year"));
			std.setGender(rs.getString("gender"));
			std.setAddress(rs.getString("address"));
			std.setEmail(rs.getString("email"));
			std.setTel(rs.getString("tel"));
			std.setGrade(rs.getInt("grade"));
			std.setSemester(rs.getInt("semester"));
			std.setDept_id(rs.getInt("dept_id"));
			std.setStatus(rs.getInt("status"));
			std.setRegisted(rs.getInt("registed"));
			std.setDept_name(rs.getString("dept_name"));
			return std;
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}return null;
	
}
	public int updateInfo(StudentInfo std) {
		String sql = "update studentinfo set tel=?,address=?,email=? where userNum=?";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,std.getTel());
			pstmt.setString(2,std.getAddress());
			pstmt.setString(3,std.getEmail());
			pstmt.setInt(4,std.getUserNum());
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
		
	}
	
		
	}
	
	

