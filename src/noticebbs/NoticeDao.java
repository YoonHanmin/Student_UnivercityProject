package noticebbs;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class NoticeDao {
	private Connection connection;
	private ResultSet rs;
	
	public NoticeDao() {
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
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
			
		
		}return "";
	}
	public int getNext() {
		String sql = "select bbsID from noticebbs order by bbsID desc";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1)+1;
			}
		
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
	}
	
	
	
	public int write(String userID,String bbsTitle,String bbsContent) {
		String sql = "insert into noticebbs values(?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setInt(6,1);
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
		
	}
	
	public ArrayList<NoticeBBS> getList(int page){
		String sql = "select * from noticebbs where bbsId<? and bbsAvailable=1 order by bbsID desc limit 10";
		ArrayList<NoticeBBS> list = new ArrayList<NoticeBBS>();
		
		try {
		PreparedStatement pstmt = connection.prepareStatement(sql);
		pstmt.setInt(1,getNext()-(page-1)*10);
		rs=pstmt.executeQuery();
		while(rs.next()) {
			NoticeBBS bbs= new NoticeBBS();
			bbs.setBbsID(rs.getInt(1));
			bbs.setBbsTitle(rs.getString(2));
			bbs.setBbsContent(rs.getString(3));
			bbs.setBbsDate(rs.getString(4));
			bbs.setUserID(rs.getString(5));
			bbs.setBbsAvailable(rs.getInt(6));
			list.add(bbs);
		}
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public NoticeBBS getBBS(int bbsID) {
		String sql = "select * from noticebbs where bbsID=?";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1, bbsID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				NoticeBBS bbs = new NoticeBBS();
				bbs.setBbsID(rs.getInt(1));
				bbs.setBbsTitle(rs.getString(2));
				bbs.setBbsContent(rs.getString(3));
				bbs.setBbsDate(rs.getString(4));
				bbs.setUserID(rs.getString(5));
				bbs.setBbsAvailable(rs.getInt(6));
				return bbs;
			}
		
		
		}catch(Exception e) {
			e.printStackTrace();
		}return null;
		
		
		
	}
	
	public int bbsDelete(int bbsID) {
		String sql = "update noticebbs set bbsAvailable=0 where bbsID=?";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,getNext());
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
		
	}
		
	public int bbsUpdate(String userID,String bbsTitle,String bbsContent) {
		String sql = "insert into noticebbs values(?,?,?,?,?,?)";
		try{
			PreparedStatement pstmt = connection.prepareStatement(sql);
			pstmt.setInt(1,getNext());
			pstmt.setString(2, bbsTitle);
			pstmt.setString(3, bbsContent);
			pstmt.setString(4, getDate());
			pstmt.setString(5, userID);
			pstmt.setInt(6,1);
			
			return pstmt.executeUpdate();
		
		}catch(Exception e) {
			e.printStackTrace();
		}return -1;
		
	}
	
	}
	
	

