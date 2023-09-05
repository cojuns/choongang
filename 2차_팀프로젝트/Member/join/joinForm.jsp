<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
</head>
<body>
<h2>회원 정보 입력</h2>
<form:form action="" method="post" modelAttribute="member" id="joinForm">
<p>
<label>사번:<br/> 
<form:input path="mno"/> <!-- 다음 사번 자동으로 가져오기 -->
</label>
</p>
<p>
<label>이름:<br/>
<form:input path="name"/>
</label>
</p>
<p>
<label>핸드폰:<br/> 
<form:input path="phone" id="phone"/>
</label>
</p>
<p>
<label>비밀번호:<br/>
<form:input path="password" id="password" />
</label>
</p>

<p>
        <label for="job">부서 선택:</label>
        <form:select path="job" id="job">
            <form:option value="사원">사원</form:option>
            <form:option value="대리">대리</form:option>
            <form:option value="과장">과장</form:option>
            <form:option value="부장">부장</form:option>
        </form:select>
</p>

<p>
        <label for="deptno">부서 선택:</label>
        <form:select path="deptno" id="deptno">
            <form:option value="1">전산팀</form:option>
            <form:option value="2">인사팀</form:option>
            <form:option value="3">영업팀</form:option>
            <form:option value="4">경영기획팀</form:option>
        </form:select>
</p>

<input type="submit" value="가입 완료">
</form:form>

<script>
    // 핸드폰 번호 입력 필드와 비밀번호 입력 필드의 ID 설정
    var phoneField = document.getElementById("phone");
    var passwordField = document.getElementById("password");

    // 핸드폰 번호 입력 필드의 'input' 이벤트 핸들러 등록
    phoneField.addEventListener("input", function() {
        var phoneNumber = phoneField.value;
        var last4Digits = phoneNumber.slice(-4);
        passwordField.value = last4Digits;
    });
</script>

</body>
</html>
