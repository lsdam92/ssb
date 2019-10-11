package com.mytest.test.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.mytest.test.model.BoardDto;

@Repository
public class BoardDaoImpl implements BoardDao {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BoardDto> listArticle(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.listArticle", boardDto);
	}

	@Override
	public BoardDto viewArticle(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.viewArticle", boardDto);
	}

	@Override
	public void join(BoardDto boardDto) {
		// TODO Auto-generated method stub

	}

	@Override
	public int viewUpdate(BoardDto boardDto) {
		// TODO Auto-generated method stub
		return sqlSession.update("board.viewUpdate", boardDto);
	}

}
