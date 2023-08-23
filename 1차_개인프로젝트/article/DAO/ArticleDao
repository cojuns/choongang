package article.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.time.Duration;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Date;
import java.util.List;

import org.apache.tomcat.jdbc.pool.DataSource;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;

import article.model.Article;
import article.model.Writer;

public class ArticleDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public ArticleDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

//	public Article insert(Article article) {
//		
//		String sql = "insert into article"
//				+ "(writer_id, writer_name, title, regdate, moddate, read_cnt)"
//				+ "values (?,?,?,now(),now(),0)";
//		int insertedCount = jdbcTemplate.update(sql, article.getWriter().getId(),
//													 article.getWriter().getName(),
//													 article.getTitle());
//		if (insertedCount > 0) {// 스프링 197페이지
//			int num = jdbcTemplate.queryForObject("select last_insert_id()"
//													, Integer.class);
//			article.setNumber(num);
//			return article;
//		}return null;
//				
//	}
	
	// 게시물 추가 메서드
	// 201~203쪽 keyHolder, 람다식
	public Article insert(Article article) {
	
	String sql = "insert into article"
			+ "(writer_id, writer_name, title, regdate, moddate, read_cnt) values (?,?,?,now(),now(),0)";
	
	KeyHolder keyHolder = new GeneratedKeyHolder();
	jdbcTemplate.update((con) -> {
		PreparedStatement pstm = con.prepareStatement(sql, new String[] {"article_no"});
		pstm.setString(1, article.getWriter().getId());
		pstm.setString(2, article.getWriter().getName());
		pstm.setString(3, article.getTitle());
		return pstm;
	},keyHolder);
	// 자동 생성된 키 값 가져오기 및 설정
	Number keyvalue = keyHolder.getKey();
	article.setNumber(keyvalue.intValue());
	return article;
	

			
}
	
	
	
	
    // 전체 게시물 개수 조회
	private Timestamp toTimestamp(Date date) {
		return new Timestamp(date.getTime());
	}

	public int selectCount()  {
		
		String sql = "select count(*) from article";
		
		return jdbcTemplate.queryForObject(sql, Integer.class);
	}
	
	// 특정 범위의 게시물 목록 조회
	public List<Article> select(int startRow, int size) {
		
		String sql = "select * from article order by article_no desc limit ?, ?";
		
		return jdbcTemplate.query(sql,
				(rs, n)-> convertArticle(rs), startRow, size);

	}
	
	// ResultSet을 Article 객체로 변환
	private Article convertArticle(ResultSet rs) throws SQLException {
		return new Article(rs.getInt("article_no"),
				new Writer(
						rs.getString("writer_id"),
						rs.getString("writer_name")),
				rs.getString("title"),
				formatTimeDifference(rs.getTimestamp("regdate")),
				formatTimeDifference(rs.getTimestamp("moddate")),
				rs.getInt("read_cnt"));
	}
	
	
	 //Timestamp를 Date로 변환
	private Date toDate(Timestamp timestamp) {
		return new Date(timestamp.getTime());
	}
//	
//	private String formatDate(Date date) {
//	    if (date != null) {
//	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	        return sdf.format(date);
//	    }
//	    return null;
//	}
	
    private String formatTimeDifference(Date date) {
        if (date != null) {
            LocalDateTime currentTime = LocalDateTime.now();
            LocalDateTime convertedDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
            Duration timeDifference = Duration.between(convertedDate, currentTime);

            if (timeDifference.toMinutes() < 1) {
                return timeDifference.getSeconds() + "초 전";
            } else if (timeDifference.toHours() < 1) {
                return timeDifference.toMinutes() + "분 전";
            } else if (timeDifference.toDays() < 1) {
                return timeDifference.toHours() + "시간 전";
            } else if (timeDifference.toDays() < 365) {
                return timeDifference.toDays() + "일 전";
            } else {
                return timeDifference.toDays() / 365 + "년 전";
            }
        }
        return null;
    }
	
	
	// 특정 ID에 해당하는 게시물 조회
	public Article selectById(int no)  {
		
		String sql = "select * from article where article_no = ?";
		
		List<Article> list = jdbcTemplate.query(sql,
				(rs, n) -> convertArticle(rs), no);
		
		return list.isEmpty() ? null : list.get(0);
		

	}
	  // 게시물의 조회수 증가
	public void increaseReadCount(int no) {
		String sql = "update article set read_cnt = read_cnt + 1 where article_no = ?";
		jdbcTemplate.update(sql, no);
		

	}
	 // 게시물 정보 업데이트 메서드
	public int update(int no, String title) {
		String sql = "update article set title = ?, moddate = now() where article_no = ?";
		
		return jdbcTemplate.update(sql, title, no);

	}
	// 게시물 삭제 메서드
	public int delete(int no) {
		String sql = "delete from article where article_no = ?";
		return jdbcTemplate.update(sql, no);
	}
	
	
}
