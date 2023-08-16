<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>가입</title>

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
<form action="join.do" method="post">
<div class="user-box">
    <p>
        <label>아이디</label><br/>
        <input type="text" name="id" value="${param.id}" id="id" placeholder="아이디">
        <input type="button" id="checkId" value="중복검사" class="buttonC">
        <div id="result_checkId" style="font-size:12px;"></div>
    </p>
</div>
<div class="user-box">
<p>
	<label>이름</label><br/><input type="text" name="name" value="${param.name}">
	<c:if test="${errors.name}">이름을 입력하세요.</c:if>
</p>
</div>
<div class="user-box">
<p>
	<label>패스워드</label><br/><input type="password" name="password" id="password">
	<c:if test="${errors.password}">암호를 입력하세요.</c:if>
</p>
</div>
<div class="user-box">
<p>
	<label>패스워드 확인</label><br/><input type="password" name="confirmPassword">
	<c:if test="${errors.confirmPassword}">확인을 입력하세요.</c:if>
	<c:if test="${errors.notMatch}"><h4>암호가 일치하지 않습니다.</h4></c:if>
	<c:if test="${errors.duplicateId}"><h4>이미 사용중인 아이디입니다.</h4></c:if>
</p>
</div>

    <div style="display: flex; justify-content: center;">
    <button class="buttonS">가입
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
