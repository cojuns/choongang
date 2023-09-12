<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>사원 목록</title>
    
        <style>

        .pagination {
            display: inline-block;
            padding: 0;
        }

        .pagination li {
            display: inline;
            margin-right: 5px;
        }



    	</style>

</head>
<body>
    <h2>사원 목록</h2>
    <table border="1">
        <thead>
            <tr>
                <th>사번</th>
                <th>이름</th>
                
                
                <th>직급</th>
                <th>부서명</th>
                <th>부서 위치</th>
            </tr>
        </thead>
        <tbody id ="usertable">
            <c:forEach items="${members}" var="member">
                <tr>
                    <td><a class="readMemeber" href="/readMember?mno=${member.mno}">${member.mno}</a></td>
                    <td>${member.name}</td>
              
                    <td>${member.job}</td>
                    <td>${member.dname}</td>
                    <td>${member.loc}</td>
                </tr>
            </c:forEach>
            
        </tbody>
    </table>
<!-- 페이지 번호 표시 부분 -->
<div class="page-box">
    <c:if test="${totalPages > 1}">
        <ul class="pagination">
            <li class="<c:if test="${page == 1}">disabled</c:if>">
                <c:if test="${page > 1 }">
                <a class="search_page" href="/memberList?page=${page - 1}" aria-label="Previous">
                    <span aria-hidden="true">&laquo;</span>
                </a>
                </c:if>
            </li>
            <c:forEach begin="1" end="${totalPages}" var="pageNumber">
                <li class="<c:if test="${page == pageNumber}">active</c:if>">
                    <a class="search_page" href="/memberList?page=${pageNumber}">${pageNumber}</a>
                </li>
            </c:forEach>
            <li class="<c:if test="${page == totalPages}">disabled</c:if>">
                <c:if test="${page < totalPages }">
                <a class="search_page" href="/memberList?page=${page + 1}" aria-label="Next">
                    <span aria-hidden="true">&raquo;</span>
                </a>
                </c:if>
            </li>
        </ul>
    </c:if>
</div>

<div>
    <select name="type" class="type">
        <option selected value="">검색 내용 선택</option>
        <option value="mno">사번 검색</option>
        <option value="name">이름 검색</option>
        <option value="dname">부서명 검색</option>
    </select>
    <input type="text" class="keyword" name="keyword" value="" />
    <button class="search">검색</button>
</div>

<!-- <script>
function getSearchList() {
    $.ajax({
        type: 'GET',
        url: "/getSearchList",
        data: $("form[name=search-form]").serialize(),
        success: function (result) {
        	
        	$(#usertable).html(result);

        }
    });
    return false; // 페이지 새로고침 방지
}
</script> -->


	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="/js/memberList.js"></script>
    
</body>
</html>
