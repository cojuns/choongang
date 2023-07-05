package board.oracle;

public class DeleteTestEx {

	public static void main(String[] args) {
		BoardDao dao = new BoardDao();
		
		dao.deleteOne(9);

	}

}
