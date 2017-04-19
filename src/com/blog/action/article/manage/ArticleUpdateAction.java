package com.blog.action.article.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Article;
import com.blog.service.ArticleService;

@Controller
public class ArticleUpdateAction {
	@Resource ArticleService articleServiceImpl;
	
	private Article article;
	private String imagePath;
	
	public String execute(){
		if(imagePath==null){
			
		}else{
			article.setImage("../"+imagePath);
		}
		if(article.getNotice().equals("1")){
			article.setNotice("recommendArticles");
		}else{
			article.setNotice("");
		}
		articleServiceImpl.update(article);
		article = null;
		return "success";
		
	}
	public Article getArticle() {
		return article;
	}
	public void setArticle(Article article) {
		this.article = article;
	}
	public String getImagePath() {
		return imagePath;
	}
	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}
	
}
