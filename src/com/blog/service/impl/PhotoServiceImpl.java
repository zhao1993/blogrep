package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Photo;
import com.blog.service.PhotoService;

@Transactional
@Repository
public class PhotoServiceImpl implements PhotoService {
	@Resource private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.PhotoService#save(com.blog.entity.Photo)
	 */
	public void save(Photo photo){
		sessionFactory.getCurrentSession().persist(photo);
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.PhotoService#delete(java.lang.Integer)
	 */
	public void delete(Integer id){
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Photo.class, id));
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.PhotoService#update(com.blog.entity.Photo)
	 */
	public void update(Photo photo){
		sessionFactory.getCurrentSession().merge(photo);
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.PhotoService#query(java.lang.Integer)
	 */
	public Photo query(Integer id){
		return (Photo) sessionFactory.getCurrentSession().get(Photo.class, id);
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.PhotoService#getPhotos()
	 */
	public List<Photo> getPhotos(){
		String hql = "from Photo as photo";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	public List<Photo> getPhotos(String type) {
		String hql = "from Photo as photo where photo.type=:type";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("type", type);
		return query.list();
	}

	public List<Photo> getPhotosByNotice(String notice) {
		String hql = "from Photo as photo where photo.notice=:notice";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("notice", notice);
		return query.list();
	}
}
