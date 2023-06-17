<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Connection con = null;
Statement stmt = null;
ResultSet rs = null;
int num = Integer.parseInt(request.getParameter("num"));
String writer = "";
String title = "";
String content = ""; 

String url = "jdbc:mariadb://localhost:3307/jspdb";
String user = "root";
String pass = "maria";

int hits = 0;

%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
    <style>
        table { width:680px;
                background-color: antiquewhite;
                text-align:center;}
         td { background-color: white;
         		width:600px; text-align:left;
         }
         th { background-color: antiquewhite; }
         .content { height:500px;
         			  display: table-cell;
 					 vertical-align: top;}
    </style>

<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
try {
	
	con = DriverManager.getConnection(url, user, pass);
	stmt = con.createStatement();
	rs = stmt.executeQuery("select * from board where num=" + num);
	//System.out.println("DB접속 확인");
	if(rs.next()){
		writer = rs.getString("writer");
		title = rs.getString("title");
		content = rs.getString("content");
		hits = rs.getInt("hits");
	}
	//조회수
	stmt.executeUpdate(
			"update board set hits=hits+1 where num=" + num);
	
%>	
	<table border="1">
		<tr>
		<th>조회수</th>
		<td><%=hits %></td>
		</tr>
	
        <tr>
            <th>작성자</th>
          	<td><%=writer %></td>
        </tr>
        
        <tr> 
            <th>제목</th>
            <td><%=title %></td>
        </tr>  
        <tr>
			<th>내용</th>
			<td class="content" ><%=content %></td>
		</tr>	
     </table>

<% 		       
}catch (Exception e){
	e.printStackTrace();
}

%>

<input type="button" value="목록보기" onclick="location.href='list.jsp'">
	<input type="button" value="수정" onclick="location.href='write.jsp?num=<%=num%>'">
	<input type="button" value="삭제" onclick="location.href='delete.jsp?num=<%=num%>'">
</body>
</html>
