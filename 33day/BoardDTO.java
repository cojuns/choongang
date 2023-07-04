package board.oracle;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

// @Data는 성능 문제 때문에 밑에 처럼 많이 사용
@AllArgsConstructor // 생성자 여러개 짜리 만들기
@NoArgsConstructor // 기본 생성자 
@Getter
@Setter
@ToString

public class BoardDto {
    private int    num;
    private String writer;
    private String title;
    private String content;
    private String regtime;
    private int    hits;
}
