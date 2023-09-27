package com.workMate.mateapp.board.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.workMate.mateapp.board.vo.ArticleVO;

public interface BoardService {
	public List<ArticleVO> listArticles() throws Exception;
	public int addNewArticle(Map articleMap) throws Exception;
	public void modToDo(ArticleVO artivleVO) throws Exception;
	public void removeToDo(int articleNO) throws Exception;
	public ArticleVO viewArticle(int articleNO) throws Exception;
	//public Map viewArticle(int articleNO) throws Exception;
	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;
	public int addArticle(ArticleVO articleVO) throws DataAccessException;
}
