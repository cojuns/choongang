package com.study.springboot.board.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.study.springboot.board.dao.BoardDao;
import com.study.springboot.board.model.Board;
import com.study.springboot.member.service.MemberInfo;

@Repository
public class ListBoardService {
	@Autowired
	private BoardDao boardDao;
	private int size = 10;

	public BoardPage getBoardPage(int pageNum, MemberInfo memberInfo) {
		try {
			// 부서번호가 1번이면 모든 문의내용 가져오기
			if (memberInfo.getDeptno() == 1) {
				int total = boardDao.selectCount();
				List<Board> content = boardDao.select((pageNum - 1) * size, size);
				return new BoardPage(total, pageNum, size, content);
			} else {
				// 부서번호가 1번이 아니면 자기 문의내용만 가져오기
				int total = boardDao.mySelectCount(memberInfo.getMno());
				List<Board> content = boardDao.mySelect((pageNum - 1) * size, size, memberInfo.getMno());
				return new BoardPage(total, pageNum, size, content);
			}
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
