<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Core 태그 라이브러리 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
table { text-align:center; }
th { background-color: gray;}
.content {width: 200px;}

</style>

<title>Insert title here</title>
</head>
<body>


<table border="1">
<!-- ${dao.writer}는 반복되는 요소의 writer 속성 값을 출력  -->
<tr>
<th>이름</th>
<th>글제목</th>
<th class="content">글내용</th>
</tr>

<c:forEach var="dao" items= "${list}">
<!-- JSTL의 반복문 기능을 사용하여 ${list} 변수에 저장된 컬렉션을 반복하면서 해당 영역을 처리  -->
<!-- items 속성은 반복할 컬렉션을 지정  -->

<tr>
<td>${dao.writer}</td>
<td>${dao.title}</td>
<td>${dao.content}</td>
</tr>

</c:forEach>
</table>

 
</body>
</html>
