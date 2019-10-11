package com.mytest.test.dao;

import java.util.List;
import java.util.Map;

import com.mytest.test.model.BoardDto;

public interface BoardDao {

	public List<BoardDto> listArticle(BoardDto boardDto);
	
	public BoardDto viewArticle(BoardDto boardDto);
	
	public int viewUpdate(BoardDto boardDto);
	
	public void join(BoardDto boardDto);
}
