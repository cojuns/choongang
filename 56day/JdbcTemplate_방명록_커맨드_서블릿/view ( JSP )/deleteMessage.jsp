<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>방명록 메시지 삭제함</title>
</head>
<body>
<c:choose>

      <c:when test="${invalidPassowrd eq 'no'}">
      		<p> 메시지를 삭제하였습니다. </p>
      </c:when> 

      <c:otherwise>
      		<p> 입력한 암호가 올바르지 않습니다. 암호를 확인해주세요. </p>
      </c:otherwise> 
</c:choose> 
<br/>
<a href="list.do">[목록 보기]</a>
</body>
</html>
