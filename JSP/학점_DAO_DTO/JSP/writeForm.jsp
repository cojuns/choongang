<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="oracle0623.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
    <form action="write.jsp" method="post">
        <th class="num" >번호</th>
        <tr><td><input type="text" name="num"></td></tr>
        <th class="name">이름</th>
        <tr><td><input type="text" name="name"></td></tr>
        <th class="kor" >국어</th>
        <tr><td><input type="text" name="kor"></td></tr>
        <th class="eng" >영어</th>
        <tr><td><input type="text" name="eng"></td></tr>
        <th class="math">수학</th>
        <tr><td><input type="text" name="math"></td></tr>
        
        <tr><td colspan="2"><input type="submit" value="추가"></td></tr>
        </form>
    

</table>

<br>
<input type="button" value="Home" onclick="location.href='list.jsp'">
</body>
</html>
