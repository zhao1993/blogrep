package com.blog.action.critique;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;

@Controller@Scope("prototype")
public class MessageShowAction {
	@Resource CritiqueService critiqueServiceImpl;
	private List<Critique> critiques;
	private int totalPage;
	private int page=1;
	private int pageSize; 
	private int size;
	
	public String execute(){
		size = critiqueServiceImpl.getSize(CritiqueType.LAM.name());
		totalPage = size%pageSize==0?size/pageSize:size/pageSize+1;
		critiques = critiqueServiceImpl.getCritiquesByType(CritiqueType.LAM.name(), (page-1)*pageSize, pageSize);
		/* List<Critique> oldCritiques = critiqueServiceImpl.getCritiques((page-1)*pageSize, pageSize);
		List<Critique> oldCritiques = critiqueServiceImpl.getCritiquesByType(CritiqueType.LAM.name(), (page-1)*pageSize, pageSize);
		critiques = new ArrayList<Critique>();
		Object obj = ServletActionContext.getRequest().getSession().getAttribute("manager");
		for (Critique critique : oldCritiques) {
			String notice = critique.getNotice();
			Critique cri = critique;
			if(null!=obj && null != notice  || null != notice  && notice.endsWith("Y")){
				cri.setNotice("联系方式:"+notice.substring(0, notice.length()-1));
				critiques.add(cri);
				continue;
			}
			if(null == notice || "".equals(notice) || notice.endsWith("N")){
				cri.setNotice("没有联系方式或者未公开！");
				critiques.add(cri);
			}
		}*/
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
	

}
