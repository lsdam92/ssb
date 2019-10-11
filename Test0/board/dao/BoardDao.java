package com.spring.board.dao;

import java.util.List;

import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;

public interface BoardDao {

	public String selectTest() throws Exception;
	//리스트페이지
	public List<BoardVo> selectBoardList(PageVo pageVo) throws Exception;
	//상세페이지
	public BoardVo selectBoard(BoardVo boardVo) throws Exception;
	//게시판개수
	public int selectBoardCnt() throws Exception;
	//게시물작성 페이지 이동
	public List<ComCodeVo> codeList(ComCodeVo comCodeVo) throws Exception;
	//게시물작성
	public int boardInsert(BoardVo boardVo) throws Exception;
	//글 수정 페이지 이동
	public BoardVo updateView(BoardVo boardVo) throws Exception;
	//글 수정하기
	public int boardUpdate(BoardVo boardVo) throws Exception;
	//글삭제하기
	public int boardDelete(BoardVo boardVo) throws Exception;
	//회원가입페이지이동
	public List<ComCodeVo> joinView(ComCodeVo comCodeVo) throws Exception;
	//회원가입
	public int join(MemberVo memberVo) throws Exception;
	//ID중복검사
	public int idCheck(String userId) throws Exception;
	//로그인하기
	public MemberVo login(MemberVo memberVo) throws Exception;
}
