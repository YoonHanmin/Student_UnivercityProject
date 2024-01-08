package magic.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDBBean {
	// jsp 소스에서 MemberDB빈객체 생성을 위한 참조변수를 static로 생성해놓는다.
	private static MemberDBBean instance = new MemberDBBean();
	
	//MemberDB빈 객체 레퍼런스를 리턴하는 메소드를 static로 선언하여, 바로 메소드 호출하면
	// instance 객체가 반환되고, getConnection 메소드를 사용하여 DBCP할 수 있다.
	public static MemberDBBean getInstance() {
		return instance;
	}
	//쿼리작업에 사용할 커넥션 객체를 리턴하는 메소드(dbcp 기법)
	public Connection getConnection() throws Exception{
		return ((DataSource)(new InitialContext().lookup("java:comp/env/jdbc/oracle"))).getConnection();
	}
	
	// memberBean 객체를 파라미터로 받아서 해당 객체를 테이블에 삽입하는 메소드
	public int insertMember(MemberBean member) {
		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
	    int re = -1; //초기값 -1, insert 정상실행시 1
	    String sql = "insert into memberT values(?,?,?,?,?)";
		
		try {
			conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member.getMem_uid());
			pstmt.setString(2,member.getMem_pwd());
			pstmt.setString(3,member.getMem_name());
			pstmt.setString(4,member.getMem_email());
			pstmt.setString(5,member.getMem_address());
			
			re = pstmt.executeUpdate();
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
		
	// 회원 가입시 아이디 중복 확인할 때 사용하는 메소드
	public int confirmID(String id) {
		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    int re = -1; //초기값 -1,아이디 중복되면 1
	    // 매개변수로 받은 id를 ?인 쿼리 파라미터에 매핑
	    String sql = "select * from memberT where mem_uid=?";
		
		try {
			conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
			pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
			pstmt.setString(1,id);
		
			rs = pstmt.executeQuery();
			if(rs.next()) { // 아이디가 일치하는 행 존재
				return 1;
			}else { //해당 아이디가 없다.
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
	
	public int login(String id,String pw) {
		
		Connection conn= null;
	DataSource ds=null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
    int re = -1; //초기값 -1,아이디 중복되면 1
    // 매개변수로 받은 id를 ?인 쿼리 파라미터에 매핑
    String sql = "select mem_pwd from memberT where mem_uid=?";
	
	try {
		conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
		pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
		pstmt.setString(1,id);
	
		rs = pstmt.executeQuery();
		if(rs.next()) { // 아이디가 일치하는 행 존재
			if(rs.getString(1).equals(pw)) {
				return 1; //로그인 성공
			}else return 0; //비밀번호 틀림
		}else { 
			return -1; //아이디 없음
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
	
	public MemberBean getMember(String id) {
		
		Connection conn= null;
		ResultSet rs=null;
	PreparedStatement pstmt = null;
    int re = -1; //초기값 -1,아이디 중복되면 1
    // 매개변수로 받은 id를 ?인 쿼리 파라미터에 매핑
    String sql = "select mem_uid,mem_pwd,mem_name,mem_email,mem_addr" + 
    		" from memberT where mem_uid=?";
    //쿼리 결과에 해당하는 회원정보를 담는 객체
    MemberBean member = null; 
	
	try {
		conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
		pstmt=conn.prepareStatement(sql); // pstmt 객체 생성
		pstmt.setString(1,id);
	
		rs = pstmt.executeQuery();
		if(rs.next()) { // 아이디가 일치하는 행 존재
			member = new MemberBean();
			
			member.setMem_uid(rs.getString("Mem_uid"));
			member.setMem_pwd(rs.getString("Mem_pwd"));
			member.setMem_name(rs.getString("Mem_name"));
			member.setMem_email(rs.getString("Mem_email"));
			member.setMem_address(rs.getString("Mem_addr"));
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
	return member;
		
		
	}
	
	public int updateMember(MemberBean member) {
		Connection conn= null;
		DataSource ds=null;
		PreparedStatement pstmt = null;
	    int re = -1; //초기값 -1, 변경된 행의 갯수 1
	    String sql = "update memberT set mem_pwd=?,mem_email=?,mem_addr=? where mem_uid=?";
		
		try {
			conn = getConnection(); // 같은 클래스 안에있기때문에 인스턴스 생성할필요없이 바로 getConnection 메소드로 DBCP 연결
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,member.getMem_pwd());
			pstmt.setString(2,member.getMem_email());
			pstmt.setString(3,member.getMem_address());
			pstmt.setString(4,member.getMem_uid());
			
			re = pstmt.executeUpdate();
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
	
	}

