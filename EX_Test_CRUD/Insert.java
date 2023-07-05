package board.oracle;

public class IsertOneEx {

	public static void main(String[] args) {
		
		BoardDao dao = new BoardDao();
		
		BoardDto dto = new BoardDto(0, "길라임", "글 546", "글의 내용 546", "", 0);

		dao.insertOne(dto);

	}

}
