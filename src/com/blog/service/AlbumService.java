package com.blog.service;

import java.util.List;

import com.blog.entity.Album;

public interface AlbumService {

	public void save(Album album);

	public void delete(Integer id);

	public void update(Album album);

	public Album query(Integer id);

	public List<Album> getAlbums();

}