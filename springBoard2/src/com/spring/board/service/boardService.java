package com.spring.board.service;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;

public interface boardService {

	public String selectTest() throws Exception;

	public List<BoardVo> SelectBoardList(PageVo pageVo) throws Exception;

	public BoardVo selectBoard(String boardType, int boardNum) throws Exception;

	public int selectBoardCnt() throws Exception;

	public int boardInsert(BoardVo boardVo) throws Exception;

	public List<ComCodeVo> codeList(ComCodeVo comCodeVo) throws Exception;
	
	public int boardUpdate(BoardVo boardVo) throws Exception;
	
	public BoardVo updateView(String boardType, int boardNum) throws Exception;
	
	public int boardDelete(BoardVo boardVo) throws Exception;
	
	public List<ComCodeVo> joinView(ComCodeVo comCodeVo) throws Exception;
	
	public int join(MemberVo memberVo) throws Exception;
	
	public int idCheck(String userId) throws Exception;
	
	public MemberVo login(MemberVo memberVo) throws Exception;
}
