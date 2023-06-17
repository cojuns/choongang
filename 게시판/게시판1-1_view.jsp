<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>


    <style>
        table { width:780px;
                background-color: antiquewhite;
                text-align:center;}
         td { background-color: white;}
         th { background-color: antiquewhite;}
    </style>

<%
response.setHeader("Refresh", "3");
Class.forName("org.mariadb.jdbc.Driver");
try {
	Connection conn = DriverManager.getConnection(
			"jdbc:mariadb://localhost:3307/jspdb", "root", "maria");
		
		
		//쿼리 실행
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from board order by num desc");
		{
	
	
	
%>
	<table border="1">
        <tr>
            <th style="width: 10px;">번호</th>
            <th style="width: 10px;">제목</th>
			<th style="width: 50px;">내용</th>
			<th style="width: 10px;">작성자</th>
			<th style="width: 0px;">등록일</th>
			<th style="width: 0px; padding: 10px;"> 조회</th>
			
        </tr>
        <%
        while(rs.next()){
        	
        %>
          <tr>
            <td><%=rs.getInt("num") %></td>
            <td style="text-align:left;">
				<a href="view.jsp?num=<%=rs.getInt("num") %>">
				<%=rs.getString("title") %>
				</a>
				</td>
			<td><%=rs.getString("content") %></td>	
			<td><%=rs.getString("writer") %></td>
			<td><%=rs.getString("regtime") %></td>
			<td><%=rs.getInt("hits") %></td>
        </tr>
        	
        
<%
        }
		}}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
<br>
<input type="button" value="글쓰기" onclick="location.href='view.jsp'">
    
</body>
</html>
