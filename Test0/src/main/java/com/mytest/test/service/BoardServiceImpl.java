package com.mytest.test.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.mytest.test.dao.BoardDao;
import com.mytest.test.model.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;
	
	
	@Override
	public List<BoardDto> listArticle(BoardDto boardDto) {
		
		return boardDao.listArticle(boardDto);
	}

	@Override
	public BoardDto viewArticle(String user_no) {

		BoardDto boardDto = new BoardDto();
		
		boardDto.setUser_no(user_no);
		
		return boardDao.viewArticle(boardDto);
	}

	@Override
	public int join(BoardDto boardDto) {
		 return 1;
	}

	@Override
	public int viewUpdate(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return boardDao.viewUpdate(boardDto);
	}

}
