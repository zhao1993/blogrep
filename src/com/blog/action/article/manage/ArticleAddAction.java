package com.blog.action.article.manage;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.entity.Article;
import com.blog.service.ArticleService;
import com.blog.util.TimeUtil;

@Controller
public class ArticleAddAction {
	@Resource ArticleService articleServiceImpl;
	
	private String imagePath;
	private Article article;
	
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
		article.setCount(0);
		article.setCount1(0);
		article.setTime(TimeUtil.getNowTime());
		articleServiceImpl.save(article);
		article = null;
		return "success";
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	public Article getArticle() {
		return article;
	}

	public void setArticle(Article article) {
		this.article = article;
	}
	
}
