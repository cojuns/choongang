<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 읽기</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/css.css">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/js.js"></script>

</head>
<body>
<div class="login-box">
<table class= "tables">

<tr>
	<td>번호</td>
	<td>작성자</td>
	<td>제목</td>
	<td>내용</td>
	
</tr>

<tr>
	<td>${articleData.article.number}</td>
	<td>${articleData.article.writer.name}</td>
	<td><c:out value='${articleData.article.title}' /></td>
	<td><u:pre value='${articleData.content}'/></td>

</tr>


<tr>
	<td colspan="2">
		<c:set var="pageNo" value="${empty param.pageNo ? '1' : param.pageNo}" />
		<a href="list.do?pageNo=${pageNo}">[목록]</a>
		<c:if test="${authUser.id == articleData.article.writer.id}">
		<a href="modify.do?no=${articleData.article.number}">[게시글수정]</a>
		<a class="delete-link" data-article-no="${articleData.article.number}">[게시글삭제]</a>
		</c:if>
	</td>
</tr>


</table>
</div>

</body>
</html>
