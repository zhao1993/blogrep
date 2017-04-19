package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Critique;
import com.blog.service.CritiqueService;

@Transactional
@Repository
public class CritiqueServiceImpl implements CritiqueService {
	@Resource private SessionFactory sessionFactory;
	
	public void save(Critique critique){
		sessionFactory.getCurrentSession().persist(critique);
	}
	
	public void delete(Integer id){
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Critique.class, id));
	}
	
	public void update(Critique critique){
		sessionFactory.getCurrentSession().merge(critique);
	}
	
	public Critique query(Integer id){
		return (Critique) sessionFactory.getCurrentSession().get(Critique.class, id);
	}
	
	public Integer getSize(Integer articleId) {
		String hql = "select count(*) from Critique as critique where critique.articleId=:articleId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("articleId", articleId);
		return new Integer(query.uniqueResult().toString());
	}
	
	public List<Critique> getCritiques(Integer articleId,Integer page, Integer pageSize){
		String hql = "from Critique as critique where critique.articleId=:articleId order by critique.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("articleId", articleId);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}
	
	public List<Critique> getCritiques(Integer page, Integer pageSize){
		String hql = "from Critique as critique order by critique.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}
	
	public List<Critique> getNewCritiques(){
		String hql = "from Critique as critique order by critique.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(5);
		return query.list();
	}

	public Integer getSize() {
		String hql = "select count(*) from Critique as critique";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return new Integer(query.uniqueResult().toString());
	}

	public Integer getSize(String type) {
		String hql = "select count(*) from Critique as critique where critique.type=:type";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("type", type);
		return new Integer(query.uniqueResult().toString());
	}

	public List<Critique> getCritiquesByType(String type, Integer page,
			Integer pageSize) {
		String hql = "from Critique as critique where critique.type=:type order by critique.id desc" ;
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("type", type);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}
	
	
}
