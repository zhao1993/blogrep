package com.blog.service;

import java.util.List;

import com.blog.entity.Base;

public interface BaseService {

	public void save(Base base);

	public void delete(Integer id);

	public void update(Base base);

	public Base query(Integer id);
	
	public List<Base> getBases();

	public Integer getSize();
}