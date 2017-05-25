package com.blog.action.critique;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;
import com.opensymphony.xwork2.ActionSupport;

@Controller
@Scope("prototype")
public class MessageShowAction extends ActionSupport{
	@Resource CritiqueService critiqueServiceImpl;
	private List<Critique> critiques;
	private Critique critique;
	private int parentId;
	private int totalPage;
	private int page=1;
	private int pageSize; 
	private int size;
	public String execute(){
		/*size = critiqueServiceImpl.getNotParentSize();
		//size = critiqueServiceImpl.getSize(CritiqueType.LAM.name());
		totalPage = size%pageSize==0?size/pageSize:size/pageSize+1;
		critiques = critiqueServiceImpl.getCritiquesByType(CritiqueType.LAM.name(), (page-1)*pageSize, pageSize);
*/		return "success";
	}
	public String critiqueForJson(){
		//是否是文章相册或者普通留言
		size = critiqueServiceImpl.getSize(critique.getType());
		if(null != critique.getArticleId())
		size = critiqueServiceImpl.getSize(critique.getArticleId());
		totalPage = size%pageSize==0?size/pageSize:size/pageSize+1;
		if(null != critique.getArticleId())
		critiques = critiqueServiceImpl.getCritiquesForArticle(critique.getArticleId(), (page-1)*pageSize, pageSize);
		else
		critiques = critiqueServiceImpl.getCritiquesForMain(critique.getType(), (page-1)*pageSize, pageSize);
		return "success";
	}
	public String critiqueForChildJson(){
		critiques = critiqueServiceImpl.getCritiquesByParentId(parentId);
		return "success";
	}
	
	public List<Critique> getCritiques() {
		return critiques;
	}

	public void setCritiques(List<Critique> critiques) {
		this.critiques = critiques;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}
	public int getParentId() {
		return parentId;
	}

	public void setParentId(int parentId) {
		this.parentId = parentId;
	}
	public Critique getCritique() {
		return critique;
	}
	public void setCritique(Critique critique) {
		this.critique = critique;
	}



}
