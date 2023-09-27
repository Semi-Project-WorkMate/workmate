package com.workMate.mateapp.board.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.workMate.mateapp.board.service.BoardService;
import com.workMate.mateapp.board.vo.ArticleVO;
import com.workMate.mateapp.board.vo.ImageVO;
import com.workMate.mateapp.member.service.MemberService;
import com.workMate.mateapp.member.vo.MemberVO;


@Controller("boardController")
public class BoardControllerImpl  implements BoardController{
	@Autowired
	private BoardService boardService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ArticleVO articleVO;
	
	@Override
	@RequestMapping(value= "/board/todolist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listArticles(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		String addtodoWriteDate = (String)request.getParameter("addtodo");
		List articlesList = boardService.listArticles();
		List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("articlesList", articlesList);
		mav.addObject("membersList", membersList);
		
		if(addtodoWriteDate != null) {
			mav.addObject("addtodo", addtodoWriteDate);
		}
		else {
			mav.addObject("addtodo", "false");
		}
		
		return mav;
		
	}
	
	@RequestMapping(value = "/board/todolistFriend.do", method =  RequestMethod.GET)
	private ModelAndView form(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = (String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView();
		List membersList = memberService.listMembers();
		List articlesList = boardService.listArticles();
		mav.setViewName(viewName);
		mav.addObject("articlesList", articlesList);
		mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/board/addToDo.do" ,method = RequestMethod.POST)
	public ModelAndView addToDo(ArticleVO article, RedirectAttributes rAttr, HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String title = (String)request.getParameter("title");
		String id = (String)request.getParameter("id");
		String writeDate = (String)request.getParameter("writeDate");
		
		java.sql.Date sqlWriteDate = java.sql.Date.valueOf(writeDate);
		
		article.setTitle(title);
		article.setId(id);
		article.setWriteDate(sqlWriteDate);
		
		int result = 0;
		result = boardService.addArticle(article);
		
		rAttr.addAttribute("addtodo", writeDate);
		ModelAndView mav = new ModelAndView("redirect:/board/todolist.do");
		return mav;
	}
	
	// 할일 수정 요청
		@RequestMapping(value="/board/modToDo.do" ,method = RequestMethod.POST)
			public ModelAndView modToDo(@RequestParam("articleNo") int articleNo, @RequestParam("articleTitle") String articleTitle, HttpServletRequest request, HttpServletResponse response) throws Exception {
				request.setCharacterEncoding("utf-8");
				ArticleVO articleVO = new ArticleVO();
				
				articleVO.setArticleNO(articleNo);
				articleVO.setTitle(articleTitle);
				
				boardService.modToDo(articleVO);
				
				ModelAndView mav = new ModelAndView("redirect:/board/todolist.do");
				return mav;
			}
		
		// 할일 삭제 요청
		@RequestMapping(value="/board/removeToDo.do" ,method = RequestMethod.POST)
		public ModelAndView removeToDo(@RequestParam("articleNo") int articleNo, HttpServletRequest request, HttpServletResponse response) throws Exception {
			request.setCharacterEncoding("utf-8");
			
			boardService.removeToDo(articleNo);
			
			ModelAndView mav = new ModelAndView("redirect:/board/todolist.do");
			return mav;
		}
	
		
		// 불필요한 코드
	 //한 개 이미지 글쓰기
	@Override
	@RequestMapping(value="/board/addNewArticle.do" ,method = RequestMethod.POST)
	@ResponseBody
	public ResponseEntity addNewArticle(MultipartHttpServletRequest multipartRequest, 
	HttpServletResponse response) throws Exception {
		ResponseEntity resEnt=null;
		return resEnt;
	}
	
	
	//한 개 이미지 보여주기
	@RequestMapping(value="/board/viewArticle.do" ,method = RequestMethod.GET)
	public ModelAndView viewArticle(@RequestParam("articleNO") int articleNO,
                                    HttpServletRequest request, HttpServletResponse response) throws Exception{
		ModelAndView mav = new ModelAndView();
		return mav;
	}
	
  //한 개 이미지 수정
  @RequestMapping(value="/board/modArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity modArticle(MultipartHttpServletRequest multipartRequest,  
    HttpServletResponse response) throws Exception{
	ResponseEntity resEnt=null;
    return resEnt;
  }
  
  @Override
  @RequestMapping(value="/board/removeArticle.do" ,method = RequestMethod.POST)
  @ResponseBody
  public ResponseEntity  removeArticle(@RequestParam("articleNO") int articleNO,
                              HttpServletRequest request, HttpServletResponse response) throws Exception{
	ResponseEntity resEnt=null;
	return resEnt;
  }

	

	private String upload(MultipartHttpServletRequest multipartRequest) throws Exception{
		String imageFileName= null;
		return imageFileName;
	}
	
	
}