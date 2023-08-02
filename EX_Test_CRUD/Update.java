package board.oracle;

public class UpdateOneEx {

	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		BoardDto dto = new BoardDto(11, "이미래", "제목 11", "내용 11", null, 0);
		
		dao.updateOne(dto);

	}

}



	public void update(Member member) {
	    String sql = "update member set password=?, name=?, email=? "
	            + "where memberid = ?";

	    jdbcTemplate.update(sql, // sql 쿼리문 순서대로
	            member.getPassword(),
	            member.getName(), member.getEmail(), member.getMemberid()
	    );
	    System.out.println("업데이트 완료");
	}

public class TestMemberDao {

	public static void main(String[] args) { // DTO, DB 순서대로
		
			Member member = new Member("test4", "222", "신마적","ewewe@dd.com");
		memberDao.update(member);
		
	}
}
