package member.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import member.dao.MemberDao;
import member.model.Member;

public class JoinService {

	@Autowired
	private MemberDao memberDao;

	@Transactional
	public void join(JoinRequest joinReq) {

		Member member = memberDao.selectById(joinReq.getId());
		if (member != null) {
			throw new DuplicateIdException();
		}

		memberDao.insert(new Member(joinReq.getId(), joinReq.getName(), joinReq.getPassword(), new Date()));

	}
}
