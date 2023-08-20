package member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import member.dao.MemberDao;
import member.model.Member;

public class ChangePasswordService {

	@Autowired
	private MemberDao memberDao;

	@Transactional
	public void changePassword(String userId, String curPwd, String newPwd) {

		Member member = memberDao.selectById(userId);
		if (member == null) {
			throw new MemberNotFoundException();
		}
		if (!member.matchPassword(curPwd)) {
			throw new InvalidPasswordException();
		}
		member.changePassword(newPwd);
		memberDao.update(member);
	}
}
