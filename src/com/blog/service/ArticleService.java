package com.blog.service;

import java.util.List;

import com.blog.entity.Article;

public interface ArticleService {

	public void save(Article article);

	public void delete(Integer id);

	public void update(Article article);

	public Article query(Integer id);
	
	public Article queryBefore(Integer id);
	
	public Article queryAfter(Integer id);

	public Integer getSize();
	
	public List<Article> getArticles(Integer page, Integer pageSize);
	
	public List<Article> getArticlesByNotice(String notice);
	
	public List<Article> getNewArticles();

	public List<Article> getHotArticles();

	public Integer getSize(String type);

	public List<Article> getArticles(String type, Integer page, Integer pageSize);
	
	public Integer changeReply(Integer articleId);

	public List<Article> getArticlesBySearch(String search, int i, int pageSize);

	public int getSizeBySearch(String search); 

}