package com.spring.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.spring.board.HomeController;
import com.spring.board.service.boardService;
import com.spring.board.vo.BoardVo;
import com.spring.board.vo.ComCodeVo;
import com.spring.board.vo.MemberVo;
import com.spring.board.vo.PageVo;
import com.spring.common.CommonUtil;
import com.sun.tracing.dtrace.ModuleAttributes;

@Controller
@SessionAttributes("userInfo")
public class BoardController {
	
	@Autowired 
	boardService boardService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	//게시물리스트 뿌리기 num, type , boardid 필수
	@RequestMapping(value = "/board/boardList.do", method = RequestMethod.GET)
	public String boardList(Locale locale, Model model,PageVo pageVo) throws Exception{
		
		List<BoardVo> boardList = new ArrayList<BoardVo>();
		
		int page = 1;
		int totalCnt = 0;
		
		if(pageVo.getPageNo() == 0){
			pageVo.setPageNo(page);;
		}
		
		boardList = boardService.SelectBoardList(pageVo);
		totalCnt = boardService.selectBoardCnt();
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("totalCnt", totalCnt);
		model.addAttribute("pageNo", page);
		
		return "board/boardList";
	}
	
	//글 상세보기 type과 num 필수 값
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardView.do", method = RequestMethod.GET)
	public String boardView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardView";
	}
	//글수정 페이지이동
	@RequestMapping(value = "/board/{boardType}/{boardNum}/boardUpdate.do", method = RequestMethod.GET)
	public String updateView(Locale locale, Model model
			,@PathVariable("boardType")String boardType
			,@PathVariable("boardNum")int boardNum) throws Exception{
		
		BoardVo boardVo = new BoardVo();
		
		
		boardVo = boardService.selectBoard(boardType,boardNum);
		
		model.addAttribute("boardType", boardType);
		model.addAttribute("boardNum", boardNum);
		model.addAttribute("board", boardVo);
		
		return "board/boardUpdate";
	}
	
	//글 수정하기
	@RequestMapping(value = "/board/boardUpdateAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardUpdate(Locale locale, BoardVo boardVo) throws Exception{
		System.out.println("글수정하기 메소드 들어옴");
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardUpdate(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//글쓰기 페이지 이동
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String boardWrite(Locale locale, Model model, ComCodeVo comCodeVo) throws Exception{
		List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
		
		codeList = boardService.codeList(comCodeVo);
		
		model.addAttribute("codeList", codeList);
		
		return "board/boardWrite";
	}
	
	//글 작성
	@RequestMapping(value = "/board/boardWriteAction.do", method = RequestMethod.POST)
	@ResponseBody
	public String boardWriteAction(Locale locale,BoardVo boardVo) throws Exception{
		
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardInsert(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	
	//글삭제
	@RequestMapping(value = "/board/boardDelete.do",method = RequestMethod.GET)
	@ResponseBody
	public String boardDelete(Locale locale, BoardVo boardVo) throws Exception{
		System.out.println("삭제 메소드 들어옴");
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.boardDelete(boardVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg);
		
		return callbackMsg;
	}
	//회원가입 페이지이동
	@RequestMapping(value = "/board/join.do" , method = RequestMethod.GET)
	public String joinView(Locale locale, Model model, ComCodeVo comCodeVo) throws Exception{
		List<ComCodeVo> codeList = new ArrayList<ComCodeVo>();
		
		codeList = boardService.joinView(comCodeVo);
		
		model.addAttribute("phoneList", codeList);
		
		return "board/join";
	}
	//회원가입
	@RequestMapping(value = "/board/joinAction.do" , method = RequestMethod.POST)
	@ResponseBody
	public String join(Locale locale, Model model, MemberVo memberVo) throws Exception{
		System.out.println("회원가입 메소드 들어옴");
		HashMap<String, String> result = new HashMap<String, String>();
		CommonUtil commonUtil = new CommonUtil();
		
		int resultCnt = boardService.join(memberVo);
		
		result.put("success", (resultCnt > 0)?"Y":"N");
		String callbackMsg = commonUtil.getJsonCallBackString(" ",result);
		
		System.out.println("callbackMsg::"+callbackMsg); 
		
		return callbackMsg;
	}
	//ID중복검사 userId를 검색 COUNT를 통한 1 과 0 반환
	@RequestMapping(value = "/board/idCheck.do")
	@ResponseBody
	public Map<Object, Object> idcheck(@RequestBody String userid) throws Exception {
        
        int count = 0;
        Map<Object, Object> map = new HashMap<Object, Object>();
 
        count = boardService.idCheck(userid);
        map.put("cnt", count);
 
        return map;
    }
	//로그인페이지이동
	@RequestMapping(value = "/board/login.do")
	public String loginView(){
		return "board/login";
	}
	//로그인요청
	@RequestMapping(value = "/board/loginAction.do", method = RequestMethod.POST)
	public String login(Model model, MemberVo memberVo) throws Exception{
		System.out.println("로그인하기 메소드 들어옴");
		
//		System.out.println("로그인 메소드 : 받은 값" + memberVo);
		
		MemberVo loginMember = boardService.login(memberVo);
		
//		System.out.println("로그인 한 객체 받아옴 : " + loginMember);
		
		if(loginMember != null) {
			model.addAttribute("userInfo", loginMember);
			return "redirect:/board/boardList.do";
		} else {
			model.addAttribute("msg", "fail");
			return "board/login";
		}
		
	}
	
	// 로그아웃하기
		@RequestMapping(value = "/board/logout.do")
		public String logout(@ModelAttribute("userInfo") MemberVo memberVo, SessionStatus sessionStatus) {
			System.out.println("로그아웃하기 메소드 들어옴");
			sessionStatus.setComplete();
			return "redirect:/board/boardList.do";
		}
}
