package com.blog.service;

import com.blog.entity.Me;

public interface MeService {

	public void save(Me me);

	public void delete(Integer id);

	public void update(Me me);

	public Me query(Integer id);

}