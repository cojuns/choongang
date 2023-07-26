package board.oracle;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class BoardDao implements Board {

	@Override
	public Connection getConnection() {
		Context initCtx;
		Connection conn = null;

			try {
				initCtx = new InitialContext();
				DataSource source 
				= (DataSource)initCtx.lookup(
						"java:comp/env/jdbc/OracleDB");
				conn = source.getConnection();
				System.out.println("DB 컨넥션 성공");
			} catch (NamingException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			

		return conn;
//		String url = "jdbc:oracle:thin:@localhost:1521:xe";
//		String user = "scott";
//		String password = "tiger";
//		Connection conn = null;
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			conn = DriverManager.getConnection(url,user,password);
//		} catch (ClassNotFoundException | SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		
	}

	@Override
	public ArrayList<BoardDto> selectList() {
		ArrayList<BoardDto> list = new ArrayList<BoardDto>();
		Connection conn = getConnection();
		try {
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
	                "select * from board order by num desc");
			while (rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String regtime = rs.getString("regtime");
				int hits = rs.getInt("hits");
				BoardDto dto 
				= new BoardDto(num, writer, title, content, regtime, hits);
				list.add(dto);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public BoardDto selectOne(int num, boolean incHits) {
		Connection conn = this.getConnection();
		BoardDto dto = null;
		try {
			String sql = "select * from board where num = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				String title = rs.getString("title");
				String writer = rs.getString("writer");
				String content = rs.getString("content");
				String regtime = rs.getString("regtime");
				int hits = rs.getInt("hits");
				dto = new BoardDto(num, writer, title, content, regtime, hits);
				
				if(incHits) {
					stmt.executeUpdate(
		                    "update board set hits=hits+1 where num=" + num);
				}
				
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return dto;
	}

	@Override
	public void insertOne(BoardDto dto) {
		Connection conn = this.getConnection();

		try {
			String sql = "insert into board " + 
	                "(num, writer, title, content, regtime, hits)" + 
	                "values (SEQ_TEST.nextval, ?, ?, ?,"
	                + "to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS'), 0)";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getWriter());
			stmt.setString(2, dto.getTitle());
			stmt.setString(3, dto.getContent());
			stmt.executeUpdate();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOne(BoardDto dto) {
		Connection conn = this.getConnection();

		try {
			String sql = "update board set writer=?, title=?, " +
	                 "content=?, regtime=to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')"
	                 + " where num=?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setString(1, dto.getWriter());
			stmt.setString(2, dto.getTitle());
			stmt.setString(3, dto.getContent());
			stmt.setInt(4, dto.getNum());
			stmt.executeUpdate();
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void deleteOne(int num) {
		Connection conn = this.getConnection();

		try {
			String sql = "delete from board where num = ?";
			PreparedStatement stmt = conn.prepareStatement(sql);
			stmt.setInt(1, num);
			stmt.executeUpdate();
//			Statement stmt = conn.createStatement();
//			stmt.executeUpdate("delete from board where num=" + num);
			stmt.close();
			conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
