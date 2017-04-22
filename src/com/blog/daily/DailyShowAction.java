package com.blog.daily;

import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import com.blog.entity.Daily;
import com.blog.service.DailyService;

@Controller
public class DailyShowAction {
	@Resource DailyService dailyServiceImpl;
	private List<Daily> dailys;
	private int totalPage;
	private int page=1;
	private int pageSize = 5; 
	private int size=5;
	
	public String execute(){
		size = dailyServiceImpl.getSize();
		totalPage=size%pageSize==0?size/pageSize:size/pageSize+1;
		dailys = dailyServiceImpl.getDailys((page-1)*pageSize, pageSize);
		return "success";
	}

	public List<Daily> getDailys() {
		return dailys;
	}

	public void setDailys(List<Daily> dailys) {
		this.dailys = dailys;
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
