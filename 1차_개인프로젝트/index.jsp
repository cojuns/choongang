<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<link rel="stylesheet" href="css/css.css">
<title>회원제 게시판 예제</title>
</head>
<body>
<%-- 
<c:if test="${! empty authUser}">
	${authUser.name}님, 안녕하세요.
	<a href="logout.do">[로그아웃하기]</a>
	<a href="changePwd.do">[암호변경하기]</a>
</c:if>
<c:if test="${empty authUser}">
	<a href="join.do">[회원가입하기]</a>
	<a href="login.do">[로그인하기]</a>
</c:if>
--%>
<u:isLogin>
	
	<div class="login-box">
  <h2>${authUser.name}님, 안녕하세요.</h2>
  <form>


    <div class="buttons">
    <a href="logout.do">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      로그아웃
    </a>
        <a href="changePwd.do">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      암호변경
    </a>

	     <a href="article/list.do">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      게시판
    </a>
	
    </div>
    

    </div>
    
    
  </form>
  



</div>

	
	
	
</u:isLogin>



<u:notLogin>
	
	<div class="login-box">
  <h2>Main</h2>
  <form>


    <div class="buttons">
    <a href="join.do">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      회원가입
    </a>
        <a href="login.do">
      <span></span>
      <span></span>
      <span></span>
      <span></span>
      로그인하기
    </a>
    </div>
  </form>
  





</div>

	
</u:notLogin>
<br/>
</body>
</html>
