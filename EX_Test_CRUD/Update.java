package board.oracle;

public class UpdateOneEx {

	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		BoardDto dto = new BoardDto(11, "이미래", "제목 11", "내용 11", null, 0);
		
		dao.updateOne(dto);

	}

}
