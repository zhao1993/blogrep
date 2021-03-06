package com.blog.service;

import java.util.List;

import com.blog.entity.Daily;


public interface DailyService {
	public void save(Daily daily);

	public void delete(Integer id);

	public void update(Daily daily);

	public Daily query(Integer id);
	
	public Integer getSize();

	public List<Daily> getDailys(Integer page, Integer pageSize);
}
