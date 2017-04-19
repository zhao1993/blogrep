package com.blog.action.article.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Article;
import com.blog.service.ArticleService;

@Controller
public class ArticleRecommendAction {
	@Resource ArticleService articleServiceImpl;
	
	private Integer id;
	private Article article;
	public String execute(){
		article = articleServiceImpl.query(id);
		article.setNotice("recommendArticles");
		articleServiceImpl.update(article);
		article = null;
		return "success";
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	
}
