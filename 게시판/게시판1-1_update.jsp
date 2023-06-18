<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<% 
Connection con = null;
PreparedStatement pstmt = null;

String title = request.getParameter("title");
String content = request.getParameter("content");

int num = Integer.parseInt(request.getParameter("num"));

String url = "jdbc:mariadb://localhost:3307/jspdb";
String user = "root";
String pass = "maria";

Class.forName("org.mariadb.jdbc.Driver");
try {
    con = DriverManager.getConnection(url, user, pass);

    String updateQuery = "UPDATE board SET title = ?, content = ? WHERE num = ?";
    pstmt = con.prepareStatement(updateQuery);
    pstmt.setString(1, title);
    pstmt.setString(2, content);
    pstmt.setInt(3, num);
    
    pstmt.executeUpdate();

    response.sendRedirect("list.jsp?num=" + num);
    
    
} catch (Exception e) {
    e.printStackTrace();
}
%>

</body>
</html>
