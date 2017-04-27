package com.blog.service;

import java.util.List;

import com.blog.entity.Connect;


public interface ConService {
	public void save(Connect con);

	public void delete(Integer id);

	public void update(Connect con);

	public Connect query(Integer id);
	
	public List<Connect> getConnects();
}
