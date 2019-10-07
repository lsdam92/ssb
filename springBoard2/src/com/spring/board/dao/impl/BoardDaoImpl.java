package com.spring.board.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.spring.board.dao.BoardDao;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;

@Repository
public class BoardDaoImpl implements BoardDao{
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public String selectTest() throws Exception {
		// TODO Auto-generated method stub
		
		String a = sqlSession.selectOne("board.boardList");
		
		return a;
	}
	/**
	 * 
	 * */
	@Override
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.boardList",pageVo);
	}
	
	@Override
	public int selectBoardCnt() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardTotal");
	}
	
	@Override
	public BoardVo selectBoard(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	
	@Override
	public int boardInsert(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.boardInsert", boardVo);
	}
	@Override
	public List<ComCodeVo> codeList(ComCodeVo comCodeVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.codeList", comCodeVo);
	}
	@Override
	public int boardUpdate(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update("board.boardUpdate", boardVo);
	}
	@Override
	public BoardVo updateView(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.boardView", boardVo);
	}
	@Override
	public int boardDelete(BoardVo boardVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.delete("board.boardDelete", boardVo);
	}
	@Override
	public List<ComCodeVo> joinView(ComCodeVo comCodeVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("board.phoneList" , comCodeVo);
	}
	@Override
	public int join(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.insert("board.join", memberVo);
	}
	@Override
	public int idCheck(String userId) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.idCheck", userId);
	}
	@Override
	public MemberVo login(MemberVo memberVo) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("board.login", memberVo);
	}
	
	
	
	
}
