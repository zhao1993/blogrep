package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Album;
import com.blog.service.AlbumService;

@Transactional
@Repository
public class AlbumServiceImpl implements AlbumService {
	@Resource private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.AlbumService#save(com.blog.entity.Album)
	 */
	public void save(Album album){
		sessionFactory.getCurrentSession().persist(album);
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.AlbumService#delete(java.lang.Integer)
	 */
	public void delete(Integer id){
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Album.class, id));
	}
	/* (non-Javadoc)
	 * @see com.blog.service.impl.AlbumService#update(com.blog.entity.Album)
	 */
	public void update(Album album){
		sessionFactory.getCurrentSession().merge(album);
	}
	/* (non-Javadoc)
	 * @see com.blog.service.impl.AlbumService#query(java.lang.Integer)
	 */
	public Album query(Integer id){
		Album album = (Album) sessionFactory.getCurrentSession().get(Album.class, id);
		Hibernate.initialize(album.getPhotos());
		return album;
	}
	/* (non-Javadoc)
	 * @see com.blog.service.impl.AlbumService#getAlbums()
	 */
	public List<Album> getAlbums(){
		String hql = "from Album as album";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}
}
