package com.mytest.test.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.valves.rewrite.Substitution.MapElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mytest.test.model.BoardDto;
import com.mytest.test.service.BoardService;
import com.spring.common.CommonUtil;

@Controller
public class BoardController {

	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/left")
	public String leftMenu(){
		return "left";
	}
	
	@RequestMapping(value="/join" , method = RequestMethod.GET)
	public void join(){
		System.out.println("가입페이지이동");
	}
	
	@RequestMapping(value="/joinAction" , method=RequestMethod.POST)
	public String join(BoardDto boardDto, Model model){
		System.out.println("가입하기 메소드 들어옴");
		
		int isJoin = boardService.join(boardDto);
		if(isJoin ==1){
			model.addAttribute("joinInfo", boardDto);
		}
		
		return "list";
	}
	
	@RequestMapping(value = "/list", method=RequestMethod.GET)
	public String list(BoardDto boardDto, Model model, HttpServletRequest requert) {
		
		List<BoardDto> list = boardService.listArticle(boardDto);
		System.out.println(list);
		model.addAttribute("listArticle",list);
		
		return "main";
		
	}
	
	@RequestMapping(value="/view", method=RequestMethod.GET)
	@ResponseBody
	public String view(String user_no, Model model) throws IOException, ServletException{
		
		System.out.println("수정하기 페이지 이동");
//		
//		BoardDto result = boardService.viewArticle(user_no); 
//		
//		return "";
//		
		HashMap<String, Object> result = new HashMap<String, Object>();
		CommonUtil commonUtil = new CommonUtil();
		
		BoardDto resultCnt = boardService.viewArticle(user_no);
		
		result.put("result", resultCnt);
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg); 
		
		return callbackMsg;
	}
	
	@RequestMapping(value = "/viewUpdate.do", method = RequestMethod.POST)
	@ResponseBody
	public String viewUpdate(BoardDto boardDto, Locale locale) throws IOException{
		System.out.println("수정하기 메소드 이동");
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.viewUpdate(boardDto);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
		
	}
}
