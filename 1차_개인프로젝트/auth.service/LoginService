package auth.service;

import org.springframework.beans.factory.annotation.Autowired;

import member.dao.MemberDao;
import member.model.Member;

public class LoginService {

	@Autowired
	private MemberDao memberDao;

	public User login(String id, String password) {

		Member member = memberDao.selectById(id);
		if (member == null) {
			throw new LoginFailException();
		}
		if (!member.matchPassword(password)) {
			throw new LoginFailException();
		}
		return new User(member.getId(), member.getName());

	}
}
