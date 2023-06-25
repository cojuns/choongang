<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="oracle0624.*" %>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>

 <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width:80px; }
        .name     { width:100px; }
        .kor      { width:80px; }
        .eng      { width:80px; }
        .math     { width:80px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>

</head>
<body>

<table>
    <form method="post">
        <th class="name" >삭제 할 이름을 입력 해주세요.</th>
        <tr><td><input type="text" name="name"></td></tr>
        
        <tr><td colspan="2"><input type="submit" value="삭제"></td></tr>
        </form>
    
</table>

<%
ScoreServiceImp service = new ScoreServiceImp();
String name = request.getParameter("name");

// null 값 체크, isEmpty() 빈칸인지 확인 (문자열의 길이가 0인지를 확인)
if (name != null && !name.isEmpty()){
	service.delete(name);
	response.sendRedirect("list.jsp");
}



%>



<br>
<input type="button" value="Home" onclick="location.href='list.jsp'">

</body>
</html>
