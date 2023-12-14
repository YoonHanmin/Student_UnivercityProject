package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mariadb.jdbc.export.Prepare;

public class UserDao {

	private Connection connection;
	private PreparedStatement pstmt;
	ResultSet rs;
	
	public UserDao() {
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
		
		public int login(String userID,String userPassword) {
		String sql = "Select userPassword from user where userID=?";
		try {
			pstmt= connection.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPassword)) {
					return 1;
				}else {return 0;}
		}
			return -1;
		}catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -2;
		}
			
			
		public int join(User user) {
			String sql = "insert into user values(?,?,?,?,?)";
			try{ 
				PreparedStatement pstmt = connection.prepareStatement(sql);
				pstmt.setString(1, user.getUserID());
				pstmt.setString(2, user.getUserName());
				pstmt.setString(3, user.getUserPassword());
				pstmt.setInt(4, user.getUserClass());
				pstmt.setInt(5, user.getUserNum());
				return pstmt.executeUpdate();
				
			}catch(Exception e) {
				e.printStackTrace();
			} return -1;
			
		}
		
		public String findID(String userName,int userNum) {
			String sql = "select userID from user where userName=? and userNum=?";
			try {
				PreparedStatement pstmt= connection.prepareStatement(sql);
				pstmt.setString(1, userName);
				pstmt.setInt(2, userNum);
				ResultSet rs = pstmt.executeQuery();
				
				if(rs.next()) {
						String id =rs.getString("userID");
						
						return id;
					}else {return null;}
			
				
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
			}
		public User getUser(String id) {
			String sql = "select * from user where userID=?";
			try {
				PreparedStatement pstmt= connection.prepareStatement(sql);
				pstmt.setString(1, id);
				ResultSet rs = pstmt.executeQuery();
				User user = new User();
				if(rs.next()) {
						user.setUserID(rs.getString("userID"));
						user.setUserName(rs.getString("userName"));
						user.setUserPassword(rs.getString("userPassword"));
						user.setUserClass(rs.getInt("userClass"));
						user.setUserNum(rs.getInt("userNum"));
						
						return user;
					}else {return null;}
			
				
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
			
		}
		
		public int changePW(int userNum,String pw,String newPW) {
			String sql = "Select userPassword from user where userNum=?";
			String sql2="update user set userPassword=? where userNum=?";
			int re=-1;
			try {
				pstmt= connection.prepareStatement(sql);
				pstmt.setInt(1, userNum);
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					if(rs.getString(1).equals(pw)) {
						pstmt=connection.prepareStatement(sql2);
						pstmt.setString(1,newPW);
						pstmt.setInt(2,userNum);
						re = pstmt.executeUpdate();
						return re;
					}
					
						
					else {return 0;}
			}
				return -1;
			}catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return -2;
		}
		
		
		
		}
		
		
		
		
	
	
	
	

