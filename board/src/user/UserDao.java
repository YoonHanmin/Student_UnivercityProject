package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDao {
	private Connection connection;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDao() {
		
		try {
			String Db_Driver = "org.mariadb.jdbc.Driver";
			String Db_Url = "jdbc:mariadb://localhost:3306/test";
			String Db_User = "root";
			String Db_Password = "1234";
			Class.forName(Db_Driver);
			connection = DriverManager.getConnection(Db_Url, Db_User, Db_Password);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public int login(String userID,String userPassword) {
		String sql = "Select userPassword from user where userID=?";
	
		try {
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,userID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}else {return 0;}
			}
			return -1;
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return -2;
		
	}
	
	public int join(User user) {
		String sql = "insert into user values(?,?,?,?,?)";
		try {
			
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPassword());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserGender());
			pstmt.setString(5, user.getUserEmail());
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String searchID(String userName) {
		String sql = "select userID from user where userName=?";
try {
			String userID = "";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1,userName);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
					
			}
	}catch(Exception e) {
		e.printStackTrace();
	}
	return null;
	
	
	
}	

}