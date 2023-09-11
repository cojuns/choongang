<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사원 등록</title>
</head>
<link rel="stylesheet" href="css/join.css?ver=1.3">
<body>

<div class="infoBar">
<h1>사원 정보 등록</h1>
<hr>
</div>


<form:form action="" method="post" modelAttribute="member" id="joinForm">
<div class="loginForm">

<p>
<label>이름:<br/>
<form:input path="name" />
<div id="messageDivId" class="errorText"></div>
</label>
</p>

<p>
<label>핸드폰 번호:<br/> 
<form:input path="phone" id="phone"/>
<div id="messageDivPass" class="errorText"></div>
</label>
</p>

<p>
<label>비밀번호:<br/>
<form:input style="border:none" path="password" id="password" readonly="true" />
</label>
</p>

<p>
<label>사번<br/> 
<form:input style="border:none" path="mno" readonly="true"/> <!-- 다음 사번 자동으로 가져오기 -->
</label>
</p>

<p>
        <label for="job">직위 선택:</label>
        <form:select path="job" id="job">
       		<option selected value="">---직위 선택---</option>
            <form:option value="사원">사원</form:option>
            <form:option value="주임">주임</form:option>
            <form:option value="대리">대리</form:option>
            <form:option value="과장">과장</form:option>
            <form:option value="부장">부장</form:option>
        </form:select>
        <div id="joberror" class="errorText"></div>
</p>

<p>
        <label for="deptno">부서 선택:</label>
        <form:select path="deptno" id="deptno">
        	<option selected value="">---부서 선택---</option>
            <form:option value="1">전산팀</form:option>
            <form:option value="2">인사팀</form:option>
            <form:option value="3">영업팀</form:option>
            <form:option value="4">경영기획팀</form:option>
        </form:select>
        <div id="deptnoerror" class="errorText"></div>
</p>

<input type="submit" value="등록" id="buttonS">
</div>
</form:form>


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/join.js"></script>




</body>
</html>
