package member.dao;

import java.sql.Timestamp;
import java.util.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.jdbc.core.JdbcTemplate;

import member.model.Member;

public class MemberDao {
	
	private JdbcTemplate jdbcTemplate;
	
	public MemberDao(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	public int selectCount() {
		String sql = "select count(*) from member";
		Integer count = jdbcTemplate.queryForObject(sql, Integer.class);
		return count;
	}
	
	public List<Member> selectAll() {
		String sql = "select * from member";
		List<Member> list = this.jdbcTemplate.query(sql, (rs, r)->{
			Member member = new Member(
					rs.getString("memberid"), 
					rs.getString("name"), 
					rs.getString("password"),
					toDate(rs.getTimestamp("regdate")));
			return member;
		});
		return list;
		
	}

	public Member selectById(String id) {
		String sql = "select * from member where memberid = ?";
		List<Member> list = this.jdbcTemplate.query(sql, (rs, r)->{
			Member member = new Member(
					rs.getString("memberid"), 
					rs.getString("name"), 
					rs.getString("password"),
					toDate(rs.getTimestamp("regdate")));
			return member;
		}, id);
		return list.isEmpty() ? null : list.get(0);
	}

	private Date toDate(Timestamp date) {
		return date == null ? null : new Date(date.getTime());
	}

	public void insert(Member mem) {
		String sql = "insert into member(memberid, name, password, regdate)"
				+ " values(?,?,?,now())";
		this.jdbcTemplate.update(sql, mem.getId(), mem.getName(),
				mem.getPassword());

	}

	public void update(Member member) {
		String sql = "update member set name = ?, password = ? where memberid = ?";
		this.jdbcTemplate.update(sql, member.getName(), 
				member.getPassword(), member.getId());
		
	}
}
