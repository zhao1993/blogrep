package com.blog.action.critique;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.blog.entity.Critique;
import com.blog.service.CritiqueService;

@Controller@Scope("prototype")
public class CritiqueShowAction {
	@Resource CritiqueService critiqueServiceImpl;
	private List<Critique> critiques;
	private List<Critique> allCritiques;
	private int totalPage;
	private int page=1;
	private int pageSize = 5; 
	private int size=5;
	private Integer articleId;
	private Integer albumId;
	
	public String execute(){
		size = critiqueServiceImpl.getSize();
		totalPage=size%pageSize==0?size/pageSize:size/pageSize+1;
		allCritiques = critiqueServiceImpl.getCritiquesByType(CritiqueType.LAM.name(), (page-1)*pageSize, pageSize);
		critiques = critiqueServiceImpl.getCritiques((page-1)*pageSize, pageSize);
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

	public Integer getArticleId() {
		return articleId;
	}

	public void setArticleId(Integer articleId) {
		this.articleId = articleId;
	}

	public Integer getAlbumId() {
		return albumId;
	}

	public void setAlbumId(Integer albumId) {
		this.albumId = albumId;
	}

	public List<Critique> getAllCritiques() {
		return allCritiques;
	}

	public void setAllCritiques(List<Critique> allCritiques) {
		this.allCritiques = allCritiques;
	}
	
	
}
