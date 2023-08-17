<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>게시글 쓰기</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/css.css?ver=1.3">

<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="js/js.js"></script>

</head>
<body>
<div class="login-box">
<form action="write.do" method="post">

<p>
	<label>제목:</label><br/><input type="text" name="title" value="${param.title}">
	<c:if test="${errors.title}">제목을 입력하세요.</c:if>
</p>
<p>
	<label>내용:</label><br/>
	<textarea name="content" rows="5" cols="30">${param.title}</textarea>
	
</p>


    <button class="buttonS" id="writes">등록
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      </button>

</form>
</div>
</body>
</html>
