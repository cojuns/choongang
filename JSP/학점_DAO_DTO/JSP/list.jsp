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
</head>
<body>

<table>
    <tr>
        <th class="num" >번호</th>
        <th class="name">이름</th>
        <th class="kor" >국어</th>
        <th class="eng" >영어</th>
        <th class="math">수학</th>
    </tr>
<%
	ScoreServiceImp service = new ScoreServiceImp();
	ArrayList<ScoreDto> list = service.studentList();
	for (ScoreDto dto : list) {
%>         
        <tr>
            <td><%=dto.getNum() %></td>
            <td><%=dto.getName() %></td>
            <td><%=dto.getKor() %></td>
            <td><%=dto.getEng() %></td>
            <td><%=dto.getMath() %></td>
        </tr>
<%

    }
%>
</table>

<br>
<input type="button" value="학생입력" onclick="location.href='writeForm.jsp'">
<input type="button" value="점수리스트" onclick="location.href='scoreList.jsp'">
<input type="button" value="분석" onclick="location.href='analyzeScore.jsp'">
</body>
</html>
