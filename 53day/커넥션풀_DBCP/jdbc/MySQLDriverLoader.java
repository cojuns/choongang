package jdbc;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

public class MySQLDriverLoader extends HttpServlet { // 서블릿 상속 

    public void init(ServletConfig config) throws ServletException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");// 드라이버 로딩
        } catch(Exception ex) {
            throw new ServletException(ex);
        }
    }
}
