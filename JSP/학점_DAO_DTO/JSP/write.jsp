<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
<%@ page import="oracle0623.*" %>
<% request.setCharacterEncoding("utf-8"); %>
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
    <tr>
        <th class="num" >번호</th>
        <th class="name">이름</th>
        <th class="kor" >국어</th>
        <th class="eng" >영어</th>
        <th class="math">수학</th>
    </tr>
<%
ScoreServiceImp service = new ScoreServiceImp();

int num = Integer.parseInt(request.getParameter("num"));
String name = request.getParameter("name");
int kor = Integer.parseInt(request.getParameter("kor"));
int eng = Integer.parseInt(request.getParameter("eng"));
int math = Integer.parseInt(request.getParameter("math"));

ScoreDto dto = new ScoreDto(num, name, kor, eng, math);
service.insert(dto);
response.sendRedirect("list.jsp");

%>
</table>

</body>
</html>
