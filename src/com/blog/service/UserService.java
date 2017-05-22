package com.blog.service;

import java.util.List;

import com.blog.entity.User;


public interface UserService {
	public void save(User user);

	public void delete(Integer id);
	
	public User query(String account);

	public void update(User user);

	public User query(Integer id);
	
	public List<User> getUsers();
}
