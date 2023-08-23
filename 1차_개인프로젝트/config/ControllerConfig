package config;

import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.tomcat.jdbc.pool.DataSource;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import article.dao.ArticleContentDao;
import article.dao.ArticleDao;
import article.service.DeleteArticleService;
import article.service.ListArticleService;
import article.service.ModifyArticleService;
import article.service.ReadArticleService;
import article.service.WriteArticleService;
import auth.service.LoginService;
import controller.ArtController;
import controller.LogController;
import controller.MyController;
import member.dao.MemberDao;
import member.service.AjaxService;
import member.service.ChangePasswordService;
import member.service.JoinService;

@Configuration
@EnableTransactionManagement
@MapperScan(basePackages = "mybatis.dao")
public class ControllerConfig {
	@Bean(destroyMethod = "close")
	public DataSource dataSource() {
		DataSource ds = new DataSource();
		ds.setDriverClassName("com.mysql.cj.jdbc.Driver");
		ds.setUrl("jdbc:mysql://localhost:3306/board?" + "useSSL=true&useUnicode=true&characterEncoding=utf8");
		ds.setUsername("jspexam");
		ds.setPassword("jsppw");
		ds.setInitialSize(2);
		ds.setMaxActive(10);
		return ds;
	}

	@Bean
	public MemberDao memberDao() {
		return new MemberDao(dataSource());
	}

	@Bean
	public LoginService loginService() {
		return new LoginService();
	}

	@Bean
	public ChangePasswordService changePasswordService() {
		return new ChangePasswordService();
	}

	@Bean
	public JoinService joinService() {
		return new JoinService();
	}

	@Bean
	public PlatformTransactionManager transactionManager() {
		DataSourceTransactionManager tm = new DataSourceTransactionManager();
		tm.setDataSource(dataSource());
		return tm;
	}
	
	@Bean
    public SqlSessionFactory sqlSessionFactory() throws Exception {
        SqlSessionFactoryBean factoryBean = new SqlSessionFactoryBean();
        factoryBean.setDataSource(dataSource());
        factoryBean.setConfigLocation(new PathMatchingResourcePatternResolver().getResource("classpath:config-mybatis.xml"));
        //factoryBean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath:/mapper/**/*.xml"));
        factoryBean.setTypeAliasesPackage("mybatis.dao");
        return factoryBean.getObject();
    }

//	@Bean
//	public SqlSessionFactory sqlSessionFactory() throws Exception {
//		SqlSessionFactoryBean sqlSessionFactory = new SqlSessionFactoryBean();
//		sqlSessionFactory.setDataSource(dataSource());
//		return (SqlSessionFactory) sqlSessionFactory.getObject();
//	}

	@Bean
	public SqlSessionTemplate sqlSessionTemplate() throws Exception {
		return new SqlSessionTemplate(sqlSessionFactory());
	}


	@Bean
	public MyController myController() {
		return new MyController();
	}

	@Bean
	public LogController logController() {
		return new LogController();
	}
	
	@Bean
	ArticleContentDao articleContentDao() {
		return new ArticleContentDao(dataSource());
	}
	
	@Bean
	ArticleDao articleDao() {
		return new ArticleDao(dataSource());
	}
	
	@Bean
	ListArticleService listArticleService() {
		return new ListArticleService();
	}
	
	@Bean
	ModifyArticleService modifyArticleService() {
		return new ModifyArticleService();
	}
	
	@Bean
	ReadArticleService readArticleService() {
		return new ReadArticleService();
	}
	
	@Bean
	WriteArticleService writeArticleService() {
		return new WriteArticleService();
	}
	
	@Bean
	DeleteArticleService deleteArticleService() {
		return new DeleteArticleService();
	}
	
	@Bean
	ArtController artController() {
		return new ArtController();
	}
	@Bean
	AjaxService ajaxService() {
		return new AjaxService();
	}
}
