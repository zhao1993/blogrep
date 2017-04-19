package com.blog.service;

import java.util.List;

import com.blog.entity.Photo;

public interface PhotoService {

	public void save(Photo photo);

	public void delete(Integer id);

	public void update(Photo photo);

	public Photo query(Integer id);

	public List<Photo> getPhotos();
	
	/*
	 * 获得相册中的照片
	 */
	public List<Photo> getPhotos(String type);
	
	/*
	 * 获得所有相册
	 */
	public List<Photo> getPhotosByNotice(String notice);

}