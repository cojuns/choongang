package maria0630;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;

public class BoardDao {
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	
	Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("org.mariadb.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mariadb://localhost:3307/jspdb", "root", "maria");
		return conn;
	}
	
	public ArrayList<BoardDto> selectList() {
		try {
			Connection conn = this.getConnection();
			ArrayList<BoardDto> list = new ArrayList<>();
			
			String sql = ("select num, writer, title, content, regtime, hits from board");
			PreparedStatement pstm = conn.prepareStatement(sql);
			ResultSet rs = pstm.executeQuery();
			
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

		
		try {
	        Connection conn = this.getConnection();


			String sql = ("select * from board where num = ? ");
			PreparedStatement pstm = conn.prepareStatement(sql);
			pstm.setInt(1, num);
			ResultSet rs = pstm.executeQuery();
			
			if(rs.next()) {
				BoardDto dto = new BoardDto();
				dto.setNum(rs.getInt("num"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setRegtime(rs.getString("regtime"));
				dto.setHits(rs.getInt("hits"));
				
				return dto;
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return null;
		
		
			
	}

	public void hits(int num) {
		
		
		Connection conn;
		try {
			conn = this.getConnection();
	        String sql = "UPDATE board SET hits = hits + 1 WHERE num = ? ";
	        PreparedStatement pstm = conn.prepareStatement(sql);
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

	
		
	public int insert(String writer, String title, String content) {
	    try {
	        Connection conn = this.getConnection();

	        // 가장 최신 num 값을 가져옴
	        int num = 0;
	        for (BoardDto dto : this.selectList()) {
	            if (dto.getNum() > num) {
	                num = dto.getNum();
	            }
	        }

	        // 현재 시간 얻기
	        String curTime = LocalDate.now() + " " + LocalTime.now().toString().substring(0, 8);

	        // 쿼리 실행
	        String sql = "INSERT INTO board (num, writer, title, content, regtime, hits) VALUES (?, ?, ?, ?, ?, 0)";
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, num + 1);
	        pstmt.setString(2, writer);
	        pstmt.setString(3, title);
	        pstmt.setString(4, content);
	        pstmt.setString(5, curTime);
	        pstmt.executeUpdate();

	        
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return 0;
	}

		
		
		
		public void delete(int num) {
			
		    // 지정된 글 번호의 레코드를 DB에서 삭제
		    ;
		    try { 
		    		Connection conn = this.getConnection();
		    		
		     
		    		// 쿼리 실행
		    		String sql = ("delete from board where num= ? ");
		    		PreparedStatement pstmt = conn.prepareStatement(sql);
		    		pstmt.setInt(1, num);
		    		pstmt.executeUpdate();
		        
		        
		    } catch(Exception e) {
		        e.printStackTrace();
		    }
			
		}
	
	
}
