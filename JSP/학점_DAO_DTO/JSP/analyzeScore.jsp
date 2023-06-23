<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.*" %>
<%@ page import="oracle0623.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

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
    
<title>Insert title here</title>
</head>
<body>
<%
    ScoreServiceImp service = new ScoreServiceImp();
%>


<table border="1">
    <tr>
        <th class="num">과목</th>
        <th class="num">과목별 최대 값</th>
        <th class="num">과목별 평균</th>
    </tr>
    
    <tr>
        <td>국어</td>
        <td><%= service.max().getKor() %></td>
        <td><%= service.selectAvg().getKor() %></td>
        
    </tr>
    
    <tr>
        <td>수학</td>
        <td><%= service.max().getMath() %></td>
        <td><%= service.selectAvg().getMath() %></td>
        
    </tr>
    
    <tr>
        <td>영어</td>
        <td><%= service.max().getEng() %></td>
        <td><%= service.selectAvg().getEng() %></td>
        
    </tr>
    
    <tr>
        <td rowspan="3" align="center" bgcolor="skyblue">전체 평균</td>
        <td colspan="2"><%= service.totalAvg() %></td>
    </tr>
</table>
<br>
<input type="button" value="Home" onclick="location.href='list.jsp'">
</body>
</html>
