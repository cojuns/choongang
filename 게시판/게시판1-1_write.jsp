
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

    <style>
    
        table { width:680px;
                background-color: antiquewhite;
                text-align:center;}
         td { background-color: white;
         		width:600px; text-align:left;
         }
         th { background-color: antiquewhite; }
         .content { height:500px;}
         textarea {width:99%; height: 99%; 
         			border: 0; resize: none;  }
         textarea:focus { outline: none; }
    </style>

</head>


<body>
<%
Class.forName("org.mariadb.jdbc.Driver");
try {
	
	con = DriverManager.getConnection(url, user, pass);
	stmt = con.createStatement();
	
	rs = stmt.executeQuery("select * from board where num=" + num);

	if(rs.next()){
		writer = rs.getString("writer");
		title = rs.getString("title");
		content = rs.getString("content");
		hits = rs.getInt("hits");
		
		//조회수
		stmt.executeUpdate(
				"update board set hits=hits+1 where num=" + num);
		
	}
	
	
	
	
%>	
	<form action="update.jsp">
	<input type="hidden" name="num" value="<%=num%>"> 
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
            <td><textarea name="title"><%= title %></textarea></td>
        </tr>  
        <tr>
			<th>내용</th>
			<td class="content"><textarea name="content"><%= content %></textarea></td>
		</tr>	
     </table>
     <input type="submit" value="수정">
	</form>	
	

<% 		       
}catch (Exception e){
	e.printStackTrace();
}

%>


	
	
</body>
</html>
