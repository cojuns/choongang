package sec;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class BackDao {
	
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	
	public void insertOne(BackDto dto) {
		Connection conn = this.getConnection();
		
		try {

			String sql = "INSERT INTO back (num, name, phone, support, content, date2 ) "
					+ "VALUES (SEQ_TEST.nextval, ?, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'))"; 
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPhone());
			pstmt.setString(3, dto.getSupport());
			pstmt.setString(4, dto.getContent());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
}
