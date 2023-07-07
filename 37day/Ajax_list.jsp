<%@page import="board.oracle.BoardDto"%>
<%@page import="board.oracle.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="board.*" %>
<%
BoardDao dao = new BoardDao();
ArrayList<BoardDto> list = dao.selectList();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>
<body>
<div id="result"></div>
<table>
    <tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >내용  </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th                >조회수  </th>
    </tr>
<% 
for(BoardDto board : list){
%>
        <tr>
        	  <td><%=board.getNum()%></td>
            <td style="text-align:left;">
                <a href="#" onclick="ajax(<%=board.getNum()%>)">
                    <%=board.getTitle()%>
                </a>
            </td>
            <td><%=board.getContent()%></td>
            <td><%=board.getWriter()%></td>
            <td><%=board.getRegtime()%></td>
            <td><%=board.getHits()%></td>
        </tr>
<% } %>
</table>

<script type="text/javascript">



function ajax(num){
	let res = document.querySelector("#result");
	let xhr = new XMLHttpRequest();	
	
xhr.onload = () => {
    if(xhr.status === 200){
        res.innerHTML = xhr.responseText;
    }else{
        console.log("실패");
    }
}
// true 비동기 방식 / false 동기
xhr.open("get", "view.jsp?num="+num, true);
xhr.send();
}
</script>

<br>
<input type="button" value="글쓰기" onclick="location.href='write.jsp'">

</body>
</html>
