<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memberId = (String)session.getAttribute("MEMBERID");
	boolean login = memberId == null ? false : true;
%>

<!DOCTYPE html>
<html>
<title>로그인 체크</title>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
if(login){
%>
아이디 "<%= memberId %>"로 로그인 한 상태
<%
}else{
%>
로그인하지 않은 상태
<%
}
%>
</body>
</html>
