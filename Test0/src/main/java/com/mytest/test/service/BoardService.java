package com.mytest.test.service;

import java.util.List;
import java.util.Map;

import com.mytest.test.model.BoardDto;


public interface BoardService {
	
	public List<BoardDto> listArticle(BoardDto boardDto);
	
	public BoardDto viewArticle(String user_no);
	
	public int viewUpdate(BoardDto boardDto);
	
	public int join(BoardDto boardDto);

}
 