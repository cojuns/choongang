package sec;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class BackDto {
	int num;
	String name;
	String phone;
	String support;
	String content;
}
