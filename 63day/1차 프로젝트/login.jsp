<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>로그인</title>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/css.css">

</head>
<body>

<div class="login-box">
<form action="login.do" method="post">
<c:if test="${errors.idOrPwNotMatch}">
<h5>아이디와 암호가 일치하지 않습니다.</h5>
</c:if>
<div class="user-box">
<p>
	<label>아이디:</label><br/>
	<c:if test="${errors.id}"><h5>ID를 입력하세요.</h5></c:if>
	<input type="text" name="id" value="${param.id}">
	
</p>
</div>

<div class="user-box">
<p>
	<label>암호:</label><br/>
	<c:if test="${errors.password}"><h5>암호를 입력하세요.</h5></c:if>
	<input type="password" name="password">
	
</p>
</div>
    <div style="display: flex; justify-content: center;">
    <button class="buttonS">로그인
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      </button>
	
	
	</div>
</form>

</div>

</body>
</html>
