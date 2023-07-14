<%@page import="board.oracle.BoardDto"%>
<%@page import="board.oracle.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 지정된 글 번호 얻기
    int num = Integer.parseInt(request.getParameter("num"));
	BoardDao dao = new BoardDao();
	BoardDto dto = dao.selectOne(num, true);

    // 게시글 데이터를 담을 변수 정의
    String writer  = dto.getWriter();
    String title   = dto.getTitle();
    String content = dto.getContent();
    String regtime = dto.getRegtime();
    int    hits    = 0;
    
   request.setAttribute("dto", dto);
   request.setAttribute("num", num);

%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        td    { text-align:left; border:1px solid gray; }
    </style>
</head>
<body>

<table>
    <tr>
        <th>제목</th>
        <td>${dto.title}</td>
    </tr>
    <tr>
        <th>작성자</th>
        <td>${dto.writer}</td>
    </tr>
    <tr>
        <th>작성일시</th>
        <td>${dto.regtime}</td>
    </tr>
    <tr>
        <th>조회수</th>
        <td>${dto.hits}</td>
    </tr>
    <tr>
        <th>내용</th>
        <td>${dto.content}</td>
    </tr>
</table>

<br>
<input type="button" value="목록보기" onclick="location.href='list2.jsp'">
<input type="button" value="수정"
       onclick="location.href='write2.jsp?num=${num}'">
<input type="button" value="삭제"
       onclick="location.href='delete.jsp?num=${num}'">

</body>
</html>
