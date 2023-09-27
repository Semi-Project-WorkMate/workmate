package com.workMate.mateapp.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.workMate.mateapp.board.dao.BoardDAO;
import com.workMate.mateapp.board.vo.ArticleVO;
import com.workMate.mateapp.board.vo.ImageVO;


@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl  implements BoardService{
	@Autowired
	BoardDAO boardDAO;
	
	public List<ArticleVO> listArticles() throws Exception{
		List<ArticleVO> articlesList =  boardDAO.selectAllArticlesList();
        return articlesList;
	}
	
	@Override
	public int addArticle(ArticleVO articleVO) throws DataAccessException {
		return boardDAO.insertArticle(articleVO);
	}
	
	@Override
	public void modToDo(ArticleVO articleVO) throws DataAccessException {
		boardDAO.updatemodToDo(articleVO);
	}
	
	@Override
	public void removeToDo(int articleNO) throws DataAccessException {
		boardDAO.deleteToDo(articleNO);
	}

	
	//단일 이미지 추가
	@Override
	public int addNewArticle(Map articleMap) throws Exception{
		return boardDAO.insertNewArticle(articleMap);
	}
	
	
	 //단일 파일 보이기
	@Override
	public ArticleVO viewArticle(int articleNO) throws Exception {
		ArticleVO articleVO = boardDAO.selectArticle(articleNO);
		return articleVO;
	}
	
	
	@Override
	public void modArticle(Map articleMap) throws Exception {
		boardDAO.updateArticle(articleMap);
	}
	
	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}
	

	
}
