package board.oracle;

import java.sql.Connection;
import java.util.ArrayList;

public interface Board {
	Connection getConnection();
	ArrayList<BoardDto> selectList();
	BoardDto selectOne(int num, boolean incHits);
	void insertOne(BoardDto dto);
	void updateOne(BoardDto dto);
	void deleteOne(int num);
}
