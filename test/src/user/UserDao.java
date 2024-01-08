package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class UserDao {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDao() {
		try {
			String dbURL="jdbc:mariadb://localhost:3306/board";
			String db_user = "root";
			String db_password = "1234";
			Class.forName("org.mariadb.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, db_user, db_password);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPassword) {
		String SQL = "SELECT userPassword From USER WHERE userID =?";
				
	
	try {
		pstmt = conn.prepareStatement(SQL);
		pstmt.setString(1, userID);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			if(rs.getString(1).equals(userPassword)) {
				return 1;
				
			}else return 0;
		}return -1;
		
		
	}
	catch(Exception e) {
		e.printStackTrace();
	}return -2;
	
}
}
