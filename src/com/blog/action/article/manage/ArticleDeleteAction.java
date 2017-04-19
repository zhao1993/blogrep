package com.blog.action.article.manage;

import java.io.File;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;

import com.blog.BaseAction;
import com.blog.entity.Article;
import com.blog.service.ArticleService;

@Controller
public class ArticleDeleteAction extends BaseAction{
	@Resource ArticleService articleServiceImpl;
	
	private Integer id;
	private String imagePath;
	private Article article;
	private String realPath;
	
	public String execute(){
		article = articleServiceImpl.query(id);
		if(article.getImage()==null||"".equals(article.getImage().trim())){
			articleServiceImpl.delete(id);
			return "success";
		}
		imagePath = article.getImage();
		imagePath = imagePath.substring(3, imagePath.length());
		realPath = servletContext.getRealPath(imagePath);
		File file = new File(realPath);
		if(file.exists()){
			file.delete();
		}
		articleServiceImpl.delete(id);
		return "success";
		
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	
}
