package maria0630;

import java.sql.Statement;
import java.time.LocalDate;
import java.time.LocalTime;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.catalina.connector.Response;
import org.apache.tomcat.dbcp.dbcp2.PStmtKey;

public class BoardDao {
	
	Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
		return conn;
	}
	
	public ArrayList<BoardDto> selectList() {
		try {
			Connection conn = this.getConnection();
			ArrayList<BoardDto> list = new ArrayList<>();
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select num, writer, title, content, regtime, hits from board");
			while (rs.next()) {
				
				int num = rs.getInt("num");
				String writer= rs.getString("writer");
				String title = rs.getString("title");
				String content = rs.getString("content");
				String regtime = rs.getString("regtime");
				int hits = rs.getInt("hits");
				
	           BoardDto dto = new BoardDto();
	            dto.setNum(num);
	            dto.setWriter(writer);
	            dto.setTitle(title);
	            dto.setContent(content);
	            dto.setRegtime(regtime);
	            dto.setHits(hits);
				
				list.add(dto);
			}
			return list;
		} catch (SQLException | ClassNotFoundException e) {
			e.printStackTrace();
		}
		return null;

	}
	
	public BoardDto selectOne (int num) {
		PreparedStatement pstm = null;
		ResultSet rs = null;
		BoardDto dto = null;
		
		try {
	        Connection conn = this.getConnection();


			
			Statement stmt = conn.createStatement();
			String sql = ("select * from board where num = ? ");
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, num);
			rs = pstm.executeQuery();
			
			if(rs.next()) {
				dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
				dto.setHits(rs.getInt("hits"));
				
				
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return dto;
			
	}

	public void hits(int num) {
		PreparedStatement pstm = null;
		
		Connection conn;
		try {
			conn = this.getConnection();
	        String sql = "UPDATE board SET hits = hits + 1 WHERE num = ? ";
	        pstm = conn.prepareStatement(sql);
	        pstm.setInt(1, num);
	        pstm.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		

        
	}
	

		
	public void update(int num, String writer, String title, String content) {
	    try (Connection conn = this.getConnection();
	         PreparedStatement pstmt = conn.prepareStatement(
	                 "UPDATE board SET writer=?, title=?, content=?, regtime=? WHERE num=?")) {
	         
	        // 현재 시간 얻기
	        String curTime = LocalDate.now() + " " +
	                         LocalTime.now().toString().substring(0, 8);
	        
	        // 변수 바인딩
	        pstmt.setString(1, writer);
	        pstmt.setString(2, title);
	        pstmt.setString(3, content);
	        pstmt.setString(4, curTime);
	        pstmt.setInt(5, num);
	        
	        // 쿼리 실행
	        pstmt.executeUpdate();
	        
	    } catch (SQLException | ClassNotFoundException e) {
	        e.printStackTrace();
	    }
	}

	
		
		public int insert(BoardDto dto) {
			try {
				Connection conn = this.getConnection();
				Statement stmt = conn.createStatement();
				String sql = String.format("insert into board (writer,content,regtime,hits) values ('%s','%s','%s', %d)",
						dto.getWriter(), dto.getContent(),dto.getRegtime(),dto.getHits());
				return stmt.executeUpdate(sql);
			} catch (SQLException | ClassNotFoundException e) {
				e.printStackTrace();
			}
			return 0;
			
		}
	
	
}
