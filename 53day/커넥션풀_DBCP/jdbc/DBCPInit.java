package jdbc;

import java.sql.DriverManager;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;

import org.apache.commons.dbcp2.ConnectionFactory;
import org.apache.commons.dbcp2.DriverManagerConnectionFactory;
import org.apache.commons.dbcp2.PoolableConnection;
import org.apache.commons.dbcp2.PoolableConnectionFactory;
import org.apache.commons.dbcp2.PoolingDriver;
import org.apache.commons.pool2.impl.GenericObjectPool;
import org.apache.commons.pool2.impl.GenericObjectPoolConfig;

public class DBCPInit extends HttpServlet { // 서블릿 상속 

	@Override
	public void init() throws ServletException {
		loadJDBCDriver();
		initConnectionPool(); // 풀(안에 커넥션있음) 초기화
	}

	private void loadJDBCDriver() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException ex) {
			throw new RuntimeException("fail to load JDBC Driver", ex);
		}
	}

	private void initConnectionPool() {
		try {
			String jdbcUrl = 
					"jdbc:mysql://localhost:3306/chap14?" + // 데이터 베이스 이름 = chap14
					"useUnicode=true&characterEncoding=utf8";
			String username = "jspexam";
			String pw = "jsppw";

			ConnectionFactory connFactory = 
					new DriverManagerConnectionFactory(jdbcUrl, username, pw);

			PoolableConnectionFactory poolableConnFactory = 
					new PoolableConnectionFactory(connFactory, null);
			poolableConnFactory.setValidationQuery("select 1");// 테스트 쿼리

			GenericObjectPoolConfig poolConfig = new GenericObjectPoolConfig();
			poolConfig.setTimeBetweenEvictionRunsMillis(1000L * 60L * 5L);
			poolConfig.setTestWhileIdle(true);
			poolConfig.setMinIdle(4);
			poolConfig.setMaxTotal(50);

			GenericObjectPool<PoolableConnection> connectionPool = 
					new GenericObjectPool<>(poolableConnFactory, poolConfig);
			poolableConnFactory.setPool(connectionPool);
			
			Class.forName("org.apache.commons.dbcp2.PoolingDriver");// 드라이버 로딩 
			PoolingDriver driver = 
					(PoolingDriver) DriverManager.getDriver("jdbc:apache:commons:dbcp:");
			driver.registerPool("chap14", connectionPool);// 데이터 베이스 이름 = chap14
		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}
}
