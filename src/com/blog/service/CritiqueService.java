package com.blog.service;

import java.util.List;

import com.blog.entity.Critique;

public interface CritiqueService {

	public void save(Critique critique);

	public void delete(Integer id);

	public void update(Critique critique);

	public Critique query(Integer id);

	public Integer getSize(Integer articleId);
	
	public Integer getSize(String type);
	
	public Integer getSize();
	
	public List<Critique> getCritiques(Integer articleId, Integer page,
			Integer pageSize);
	
	public List<Critique> getCritiques(Integer page, Integer pageSize);
	
	public List<Critique> getNewCritiques();
	
	public List<Critique> getCritiquesByType(String type, Integer page,
			Integer pageSize);
	/**
	 * @param type 留言类型
	 * @param page 当前页
	 * @param pageSize 总页数
	 * @return 
	 */
	public List<Critique> getCritiquesForMain(String type, Integer page,
			Integer pageSize);
	
	/**
	 * 子查询
	 * @param id 
	 * @return
	 */
	public List<Critique> getCritiquesByParentId(Integer id);

}