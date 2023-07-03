<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>  
<%@ page import="java.time.*" %>
 
<%
    request.setCharacterEncoding("utf-8");

    // 양식에 입력되었던 값 읽기
    String writer  = request.getParameter("writer" );
    String title   = request.getParameter("title"  );
    String content = request.getParameter("content");

    // 빈 칸이 하나라도 있으면 오류 출력하고 종료
    if (writer  == null || writer.length()  == 0 ||
        title   == null || title.length()   == 0 ||
        content == null || content.length() == 0) {
%>      
        <script>
            alert('모든 항목이 빈칸 없이 입력되어야 합니다.');
            history.back();
        </script>
<%        
        return;
    }

    // 입력된 내용으로 새 글 레코드 추가
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
			
			String sql = new StringBuffer()
					.append("INSERT INTO board (num, writer, title, content, regtime, hits) "
							+ "VALUES (SEQ_TEST.nextval, ?, ?, ?, to_char(sysdate, 'YYYY-MM-DD HH:MI:SS'), 0)").toString();

			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			
			pstmt.executeUpdate();
			
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		} 
    
    // 목록보기 화면으로 돌아감
    response.sendRedirect("list.jsp");
%>     
