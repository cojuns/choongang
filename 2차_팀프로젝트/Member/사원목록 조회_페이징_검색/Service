package com.study.springboot.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.study.springboot.member.dao.MemberDao;
import com.study.springboot.member.model.Member;

@Service
public class MemberService {

	@Autowired
	private MemberDao memberDao;


	public MemberInfo authenticate(Long mno, String password) {
		Member member = memberDao.selectByMno(mno);
		if (member == null) {
			throw new WrongIdPasswordException();
		}
		if (!member.matchPassword(password)) {
			throw new WrongIdPasswordException();
		}
		return new MemberInfo(member.getMno(),

				member.getName(), member.getPhone(), member.getJob(), member.getDeptno());
	}
	
    public List<Member> searchMembers(String type, String keyword) {
        return memberDao.searchMembers(type, keyword);
    }

}
