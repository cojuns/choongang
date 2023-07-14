<%@page import="board.oracle.BoardDto"%>
<%@page import="board.oracle.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="java.util.*" %>
<%@ page import="board.*" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    // 글 번호 값 얻기, 주어지지 않았으면 0으로 설정
    String tmp = request.getParameter("num");
    int num = (tmp != null && tmp.length() > 0) ? Integer.parseInt(tmp)
                                                : 0;

    // 새 글쓰기 모드를 가정하고 변수 초기값 설정
    String writer  = "";
    String title   = "";
    String content = "";
    String action  = "insert.jsp";
	
    BoardDao dao = null;
    BoardDto dto = null;
    
    // 글 번호가 주어졌으면, 글 수정 모드
    if (num > 0) {
		dao = new BoardDao();
		dto = dao.selectOne(num, false);
		writer = dto.getWriter();
		title = dto.getTitle();
		content = dto.getContent();
		
    
    
    // 글 수정 모드일 때는 저장 버튼을 누르면 UPDATE 실행
    action  = "update.jsp?num=" + num;
   }
    request.setAttribute("dto", dto);
    request.setAttribute("action", action);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table { width:680px; text-align:center; }
        th    { width:100px; background-color:cyan; }
        input[type=text], textarea { width:100%; }
    </style>
</head>
<body>

<form method="post" action="${action}">
    <table>
        <tr>
            <th>제목</th>
            <td><input type="text" name="title"  maxlength="80"
                       value="${dto.title}">
            </td>
        </tr>
        <tr>
            <th>작성자</th>
            <td><input type="text" name="writer" maxlength="20"
                       value="${dto.writer}">
            </td>
        </tr>
        <tr>
            <th>내용</th>
            <td><textarea name="content" rows="10">${dto.content}</textarea>
            </td>
        </tr>
    </table>

    <br>
    <input type="submit" value="저장">
    <input type="button" value="취소" onclick="history.back()">
</form>

</body>
</html>
