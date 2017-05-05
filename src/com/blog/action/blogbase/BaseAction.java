package com.blog.action.blogbase;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.blog.entity.Base;
import com.blog.service.BaseService;

@Controller
public class BaseAction{
	@Resource BaseService baseServiceImpl;
	private List<Base> bases;
	
	private Base base;
	
	public String select() throws Exception{ 
		bases = baseServiceImpl.getBases();
		base = bases.get((int) (Math.random()*bases.size()));
		return "select";
	}
	
	public String selectAll() throws Exception{ 
		bases = baseServiceImpl.getBases();
		return "selectAll";
	}
	
	public String update() throws Exception{
		bases = baseServiceImpl.getBases();
		Base base1 = bases.get((int) (Math.random()*bases.size()));
		base.setId(base1.getId());
		baseServiceImpl.update(base);
		return "update";
	}
	
	public String delete() throws Exception{
		baseServiceImpl.delete(base.getId());
		return "delete";
	}
	public String add() throws Exception{
		baseServiceImpl.save(base);
		return "add";
	}
	
	public Base getBase() {
		return base;
	}
	public void setBase(Base base) {
		this.base = base;
	}
	public List<Base> getBases() {
		return bases;
	}

	public void setBases(List<Base> bases) {
		this.bases = bases;
	}
}
