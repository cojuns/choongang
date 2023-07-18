<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%request.setCharacterEncoding("utf-8");
     %>
<!doctype html>
<html>
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width">
	<title>여행 준비물 점검 목록</title>
	<link rel="stylesheet" href="css/input.css">
	<link rel="stylesheet" href="css/list.css">
</head>
<body>

	<div id="wrapper">
		<h2>여행 준비물 점검 목록</h2>
		<form>
			<input type="text" id="list" autofocus="true">
			<button type="button" id="add" class="addBtn">추가</button>
		</form>
		<div id="itemList">
		<ul>
		<c:forEach var="dto" items="${list}">
		
		<li>${dto.num}. ${dto.content}<span class='close' id='${dto.num}'>X</span></li>
		
		
		
		</c:forEach>
		</ul>
		</div>
	</div>    
	
	<script src="js/checklist-result.js"></script>
	</html>
