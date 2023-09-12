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
<h1>사원 정보 변경</h1>
<hr>
</div>
	
	<table>
<tr>
	<td>사번</td>
	<td>${member.mno}</td>
</tr>
<tr>
	<td>이름</td>
	<td>${member.name}</td>
</tr>

<tr>
	<td>연락처</td>
	<td>${member.phone}</td>
</tr>

<tr>
	<td>입사일</td>
	<td>${member.getFormattedHiredate()}</td>
</tr>

<tr>
	<td>직급</td>
	<td>${member.job}</td>
</tr>

<tr>
	<td>부서</td>
	<td>${member.dname}</td>
</tr>

<tr>
	<td>직급</td>
	<td>${member.loc}</td>
</tr>



<tr>
	<td colspan="2">
	<a class="mainpage" href="memberList?p=${param.p}">목록보기</a>

	</td>
</tr>
</table>
	
	



	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="js/memberList.js"></script>




</body>
</html>
