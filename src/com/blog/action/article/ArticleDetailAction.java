package com.blog.action.article;


import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.blog.entity.Article;
import com.blog.service.ArticleService;


@Controller
@Scope("prototype")
public class ArticleDetailAction {
	@Resource ArticleService articleServiceImpl;
	private Integer id;
	private Article article;
	private Article articleBefore;
	private Article articleAfter;
	public String execute(){
		articleBefore = articleServiceImpl.queryBefore(id);
		articleAfter = articleServiceImpl.queryAfter(id);
		article = articleServiceImpl.query(id);
		Integer count1 = articleServiceImpl.changeReply(id);
		Integer count = article.getCount();
		article.setCount(count==null?0:++count);
		article.setCount1(count1==null?0:count1);
		articleServiceImpl.update(article);
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

	public Article getArticleBefore() {
		return articleBefore;
	}

	public void setArticleBefore(Article articleBefore) {
		this.articleBefore = articleBefore;
	}

	public Article getArticleAfter() {
		return articleAfter;
	}

	public void setArticleAfter(Article articleAfter) {
		this.articleAfter = articleAfter;
	}

	
}
