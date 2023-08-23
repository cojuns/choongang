package article.dao;

import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;

import article.model.ArticleContent;

public class ArticleContentDao {

	private JdbcTemplate jdbcTemplate;
	
	public ArticleContentDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	// 게시물 내용을 삽입
	public ArticleContent insert(ArticleContent content) { 
		String sql = "insert into article_content (article_no, content) values (?,?)";
		int insertedCount 
		 = jdbcTemplate.update(sql, content.getNumber(),content.getContent());
			

			if (insertedCount > 0) {
				return content;
			} else {
				return null;
			}
	}
	// 특정 ID에 해당하는 게시물 내용을 조회
	public ArticleContent selectById(int no){
		String sql = "select * from article_content where article_no = ?";
		List<ArticleContent> list = jdbcTemplate.query(sql, (rs, n)->{
			return new ArticleContent(
					rs.getInt("article_no"),
					rs.getString("content"));
		},no);
		return list.isEmpty() ? null : list.get(0);

	}
	
	// 특정 ID에 해당하는 게시물 내용을 업데이트
	public int update(int no, String content) {
		String sql = "update article_content set content = ? where article_no = ?";
		return jdbcTemplate.update(sql, content, no);
		

	}
	
	public int delete(int no) {
		String sql = "delete from article_content where article_no = ?";
		return jdbcTemplate.update(sql, no);
	}

}
