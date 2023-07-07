<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*" %>
<%
String dnum = request.getParameter("dnum");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        table     { width:680px; text-align:center; }
        th        { background-color:cyan; }
        
        .num      { width: 80px; }
        .title    { width:230px; }
        .writer   { width:100px; }
        .regtime  { width:180px; }
                
        a:link    { text-decoration:none; color:blue; }
        a:visited { text-decoration:none; color:gray; }
        a:hover   { text-decoration:none; color:red;  }
    </style>
</head>
<body>

<table>
    <tr>
        <th class="num"    >번호    </th>
        <th class="title"  >제목    </th>
        <th class="writer" >작성자  </th>
        <th class="regtime">작성일시</th>
        <th                >조회수  </th>
    </tr>
<%
    // 게시글 리스트 읽어오기
    Class.forName("oracle.jdbc.driver.OracleDriver");
    try (
        Connection conn = DriverManager.getConnection(
                "jdbc:oracle:thin:@localhost:1521:xe", "scott", "tiger");
        Statement stmt = conn.createStatement();
    
        // 쿼리 실행
        ResultSet rs = stmt.executeQuery(
                "select * from emp where deptno = " + dnum + " order by empno desc");           
    ) {
        // 게시글 레코드가 남아있는 동안 반복하며 화면에 출력
        while (rs.next()) {
%>         
        <tr>
            <td><%=rs.getInt("empno")%></td>
            <td style="text-align:left;">
                <a href="view.jsp?num=<%=rs.getInt("empno")%>">
                    <%=rs.getString("ename")%>
                </a>
            </td>
            <td><%=rs.getString("deptno" )%></td>
            <td><%=rs.getString("job")%></td>
            <td><%=rs.getInt   ("sal"   )%></td>
        </tr>
<%
        }
    } catch(Exception e) {
        e.printStackTrace();
    }
%>
</table>
</body>
</html>
