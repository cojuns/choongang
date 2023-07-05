package board.oracle;

public class SelectOneTest {

	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		BoardDto dto = dao.selectOne(7, false);
		System.out.println(dto);
		
		

	}

}
