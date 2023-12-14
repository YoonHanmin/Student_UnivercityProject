package status;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class StatusDao {
	private Connection connection;
	private PreparedStatement pstmt;
	ResultSet rs;
	
	public StatusDao() {
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
	public String getDate() {
		String sql = "select now()";
		try {
			PreparedStatement pstmt = connection.prepareStatement(sql);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		
		}return "";
	}
	
	public int absenceApply(String type,int userNum) {
		String sql = "";
		if(type.equals("normal")) {
		
			sql = "insert into status values('일반휴학신청',?,?)";
		} else {
		 sql = "insert into status values('군휴학신청',?,?)";}
		try{ 
			PreparedStatement pstmt = connection.prepareStatement(sql);
			
			pstmt.setInt(1,userNum);			
			pstmt.setString(2,getDate());
			
			return pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		} return -1;
	}
	
	public ArrayList<Status> absenceCheck() {
		
		String sql = "select * from status order by bbsID desc";
			ArrayList<Status> list = new ArrayList<Status>();
			
			try{
				PreparedStatement pstmt = connection.prepareStatement(sql);
				rs = pstmt.executeQuery();
				if(rs.next()) {
					
				}
			
			}catch(Exception e) {
				e.printStackTrace();
			}return list;
		}
	
		
		
	}
		
	
	
	
	

