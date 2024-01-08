package exam;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class TableDAO {
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	
	public TableDAO(){	
// 		생성자로 JDBC Connection 연동 
		try{
			conn = null;
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String password = "tiger";
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection(url, user, password);
		}catch(Exception ex){
			ex.getMessage();
		}finally{
		}
	}
//	Oracle DB내 테이블 정보를 조회하여 TableDTO객체에 담아 List형태로 리턴하는 메소드
		public ArrayList<TableDTO> getTable(String name) {
	String sql = "select column_name,data_type,data_length,nullable "
			+ "from user_tab_columns where table_name=?";
			ArrayList<TableDTO> list = new ArrayList<TableDTO>();
			TableDTO table = null;
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, name);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					table = new TableDTO();
					table.setColumn_name(rs.getString(1));
					table.setColumn_type(rs.getString(2));
					table.setColumn_length(rs.getInt(3));
					table.setNullable(rs.getString(4));
					list.add(table);
				}
				return list;
			} catch (SQLException e) {	
				e.printStackTrace();
			}
			return null;
	}
	
	
	
}
