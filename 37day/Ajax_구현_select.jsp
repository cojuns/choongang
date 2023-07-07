<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id="result"></div>

<select id="deptno">

<option value="10">10번 부서</option>
<option value="20">20번 부서</option>
<option value="30">30번 부서</option>

</select>

<button onclick="test()">클릭</button>

<script type="text/javascript">

function test(){
	//let deptno = document.querySelector("#deptno");
    let dnum = deptno.options[deptno.selectedIndex].value;
    //let res = document.querySelector("#result");
    let xhr = new XMLHttpRequest();	
    
    xhr.onload = () => {
        if(xhr.status === 200){
            result.innerHTML = xhr.responseText;
        }else{
            console.log("실패");
        }
    }
    // true 비동기 방식 / false 동기
    xhr.open("get", "emp.jsp?dnum="+dnum, true);
    xhr.send();
}

</script>
</body>
</html>
