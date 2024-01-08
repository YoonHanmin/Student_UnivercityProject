package magic.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

import javax.naming.InitialContext;
import javax.sql.DataSource;

import magic.member.MemberBean;
import magic.member.MemberDBBean;

public class BoardDBBean {
	private static BoardDBBean instance = new BoardDBBean();
	
	public static BoardDBBean getInstance() {
		return instance;
	}
	
	public Connection getConnection() throws Exception{
		return ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
	}
	
	public int insertBoard(BoardBean board) {
		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
		ResultSet rs;
	    int re = -1; //초기값 -1, insert 정상실행시 1
	    int number;
	    String sql = "";
	    String sql3 = "";
	    // 답변글을 위한 변수
	    int id = board.getB_id();
	    int ref = board.getB_ref();
	    int step = board.getB_step();
	    int level = board.getB_level();
	    System.out.println("step :"+step);
	    System.out.println("level :"+level);
	    
		try {
			conn = getConnection();

			String sql2 = "select max(b_id) from board";
			pstmt=conn.prepareStatement(sql2);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				number = rs.getInt(1)+1;
			}else {
				number = 1;
			}
			// 쿼리문에서 함수를 실행하면 굳이 자바에서 데이터를 가져올 필요없이 DB에서 처리하므로  위의 로직을 짤 필요가 없어진다.
			// 근데, 만약 DB table에 글이 하나도 없다면, 즉 max()함수가  null을 반환하므로 에러가 된다. 그러므로 nvl 처리를 해야한다.
			if(id!=0) { // id가 0이 아니면 글번호를 가지고 오는 경우 답변글이다.
				// 기존 글 업데이트
				sql3 = "UPDATE board SET b_step=b_step+1 WHERE b_ref=? and b_step > ?";
				pstmt= conn.prepareStatement(sql3);
				pstmt.setInt(1, ref);
				pstmt.setInt(2, step);
				pstmt.executeUpdate();
				
				step = step+1;
				level = level+1;				
			}else { //신규글
			ref=number;
			step=0;
			level=0;
			}
			sql = "insert into board values(?,?,?,?,(select nvl(max(b_id),0)+1 from board),?,?,?,?,?,?,?"
					+ ",?,?,?)";

			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,board.getB_name());
			pstmt.setString(2,board.getB_email());
			pstmt.setString(3,board.getB_title());
			pstmt.setString(4,board.getB_content());
			pstmt.setTimestamp(5, board.getB_date());
			pstmt.setInt(6, board.getB_hit());
			pstmt.setString(7,board.getB_pwd());
			pstmt.setString(8,board.getB_ip());
			pstmt.setInt(9,ref);
			pstmt.setInt(10,step);
			pstmt.setInt(11,level);
			pstmt.setString(12,board.getB_fname());
			pstmt.setString(13,board.getB_rfname());
			pstmt.setInt(14,board.getB_fsize());
			
			re = pstmt.executeUpdate(); 
		}
		 catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
		
		}catch(SQLException se) {
			se.printStackTrace();
		}
		}
		return re;
	}
	
	
	
	public int getNext() {
		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		int result = -1;
		String sql = "select max(b_id) from board";
		try {
			conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
			pstmt=conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = rs.getInt(1)+1;
				
			}else {
				result = 1;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
		
		}catch(SQLException se) {
			se.printStackTrace();
		}
		}
		return result;
				
	}
	
	public ArrayList<BoardBean> getList(int page){
		
		Connection conn= null;
		ResultSet rs=null;
	PreparedStatement pstmt = null;
   
  
    BoardBean board = null; 
	String sql = "select * from board order by b_ref desc,b_step asc";
	try {
		conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
		pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
		ArrayList<BoardBean> list = new ArrayList<BoardBean>();
		rs = pstmt.executeQuery();
		while(rs.next()) { // 아이디가 일치하는 행 존재
			board = new BoardBean();
			board.setB_name(rs.getString("b_name"));
			board.setB_email(rs.getString("b_email"));
			board.setB_title(rs.getString("b_title"));
			board.setB_content(rs.getString("b_content"));
			board.setB_id(rs.getInt("b_id"));
			board.setB_date(rs.getTimestamp("b_date"));
			board.setB_hit(rs.getInt("b_hit"));
			board.setB_pwd(rs.getString("b_pwd"));
			board.setB_ip(rs.getString("b_ip"));
			board.setB_ref(rs.getInt("b_ref"));
			board.setB_step(rs.getInt("b_step"));
			board.setB_level(rs.getInt("b_level"));
			board.setB_fname(rs.getString("b_fname"));
			board.setB_rfname(rs.getString("b_rfname"));
			board.setB_fsize(rs.getInt("b_fsize"));
			list.add(board);

		}
		return list;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
	try {	
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		
	
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return null;
	
		
		
		
	}
	
	public BoardBean getBoard(int id,boolean hitadd) {
		
		Connection conn= null;
		ResultSet rs=null;
	PreparedStatement pstmt = null;
   
  
    BoardBean board = null; 
	String sql = "select * from board where b_id=?";
	String sql2 = "";
	try {
		conn = getConnection(); 
		if(hitadd) { // 수정이 아니면 조회수 증가
			sql2 = "update board set b_hit=b_hit+1 where b_id=?";		
			pstmt=conn.prepareStatement(sql2);
			pstmt.setInt(1, id);
			pstmt.executeUpdate();
		}
		
	
		pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
		pstmt.setInt(1, id);
		rs = pstmt.executeQuery(); 
		while(rs.next()) { // 아이디가 일치하는 행 존재
			board = new BoardBean();
			board.setB_name(rs.getString("b_name"));
			board.setB_email(rs.getString("b_email"));
			board.setB_title(rs.getString("b_title"));
			board.setB_content(rs.getString("b_content"));
			board.setB_id(rs.getInt("b_id"));
			board.setB_date(rs.getTimestamp("b_date"));
			board.setB_hit(rs.getInt("b_hit"));
			board.setB_pwd(rs.getString("b_pwd"));
			board.setB_ip(rs.getString("b_ip"));
			board.setB_ref(rs.getInt("b_ref"));
			board.setB_step(rs.getInt("b_step"));
			board.setB_level(rs.getInt("b_level"));
			board.setB_fname(rs.getString("b_fname"));
			board.setB_rfname(rs.getString("b_rfname"));
			board.setB_fsize(rs.getInt("b_fsize"));
			

		}
		return board;
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
	try {	
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		
	
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return null;
	
		
		
		
	}
	
public int deleteBoard(int b_id,String pw) {
		
		Connection conn= null;
	DataSource ds=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    int re = -1; //초기값 -1,아이디 중복되면 1
    // 매개변수로 받은 id를 ?인 쿼리 파라미터에 매핑
    String sql = "select b_pwd from board where b_id=?";
    String sql2 = "delete from board where b_id=?";
	
	try {
		conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
		pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
		pstmt.setInt(1,b_id);
	
		rs = pstmt.executeQuery();
		if(rs.next()) { // 아이디가 일치하는 행 존재
			if(rs.getString(1).equals(pw)) {
				pstmt=conn.prepareStatement(sql2); // pstmt 객체 생성
				pstmt.setInt(1,b_id);
				re = pstmt.executeUpdate();
				
				return re; //
			}else return 0; 
		}else { 
			return -1; 
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
	try {	
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
		
	
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return re;
		
		
	}
	
	public int editBoard(BoardBean board) {

		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
		ResultSet rs;
	    int re = -1; //초기값 -1, insert 정상실행시 1
	    String sql = "select b_pwd from board where b_id=?";
	    String sql2 = "update board set b_name=?,b_email=?,b_title=?,b_content=? where b_id=?";
		
		try {
			conn = getConnection();
			pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
			pstmt.setInt(1,board.getB_id());
		
			rs = pstmt.executeQuery();
			if(rs.next()) { // 아이디가 일치하는 행 존재
				if(rs.getString(1).equals(board.getB_pwd())) {
					pstmt=conn.prepareStatement(sql2);
					pstmt.setString(1,board.getB_name());
					pstmt.setString(2,board.getB_email());
					pstmt.setString(3,board.getB_title());
					pstmt.setString(4,board.getB_content());
					pstmt.setInt(5,board.getB_id());
					re = pstmt.executeUpdate();
					return re; //
				}else return 0; 
			}else { 
				return -1; 
			}

			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
		try {	
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
			
		
		}catch(SQLException se) {
			se.printStackTrace();
		}
		}
		return re;
	
	}
	// b_id를 통해 fname, rfname을 가지고오는 메소드
	public BoardBean getFileName(int bid) { 
		
		Connection conn= null;
		ResultSet rs=null;
		PreparedStatement pstmt = null;
		BoardBean board = null; 
		String sql = "select b_fname,b_rfname from board where b_id=?";
	
	
	try {
		conn = getConnection(); //
		pstmt=conn.prepareStatement(sql); 
		pstmt.setInt(1, bid);
		rs = pstmt.executeQuery();
		if(rs.next()) { // 아이디가 일치하는 행 존재
			board = new BoardBean();
			board.setB_fname(rs.getString("b_fname"));
			board.setB_rfname(rs.getString("b_rfname"));
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
	finally {
	try {	
		if(rs!=null) rs.close();
		if(pstmt!=null) pstmt.close();
		if(conn!=null) conn.close();
	}catch(SQLException se) {
		se.printStackTrace();
	}
	}
	return board;
	}
	
	
}
