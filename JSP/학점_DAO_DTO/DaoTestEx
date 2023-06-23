package oracle0623;

public class DaoTestEx {

	public static void main(String[] args) {
		ScoreDao dao = new ScoreDao();
		NumberDto dto = dao.selectMax();
		
		System.out.println("국영수 최고 점수");
		System.out.println(dto);
		
		System.out.print("전체 평균: " + dao.selectTotalAvg());

	}

}
