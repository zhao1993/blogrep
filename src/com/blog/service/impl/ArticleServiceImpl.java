package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Article;
import com.blog.service.ArticleService;

@Transactional
@Repository
public class ArticleServiceImpl implements ArticleService {
	@Resource private SessionFactory sessionFactory;
	@Override
	public void save(Article article){
		sessionFactory.getCurrentSession().persist(article);
	}
	@Override
	public void delete(Integer id){
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Article.class, id));
	}
	@Override
	public void update(Article article){
		sessionFactory.getCurrentSession().merge(article);
	}
	@Override
	public Article query(Integer id){
		return (Article) sessionFactory.getCurrentSession().get(Article.class, id);
	}
	@Override
	public Article queryBefore(Integer id){
		String hql = "from Article as article where article.id<:id order by article.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("id", id);
		query.setFirstResult(0);
		query.setMaxResults(1);
		if(query.list().size()==0){
			return null;
		}
		Article article = (Article) query.list().get(0);
		return article;
	}
	@Override
	public Article queryAfter(Integer id){
		String hql = "from Article as article where article.id>:id order by article.id asc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("id", id);
		query.setFirstResult(0);
		query.setMaxResults(1);
		if(query.list().size()==0){
			return null;
		}
		Article article = (Article) query.list().get(0);
		return article;
	}
	@Override
	public Integer getSize(){
		String hql = "select count(article.id) from Article as article";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return new Integer(query.uniqueResult().toString());
	}
	@Override
	public List<Article> getArticles(Integer page, Integer pageSize){
		String hql = "from Article as article";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public List<Article> getArticlesByNotice(String notice){
		String hql = "from Article as article where article.notice=:notice order by article.time desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("notice", notice);
		query.setFirstResult(0);
		query.setMaxResults(9);
		return query.list();
	}
	@Override
	public List<Article> getNewArticles(){
		String hql = "from Article as article order by article.time desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(9);
		return query.list();
	}
	@Override
	public List<Article> getHotArticles(){
		String hql = "from Article as article order by article.count desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(0);
		query.setMaxResults(9);
		return query.list();
	}
	@Override
	public Integer getSize(String type){
		String hql = "select count(article.id) from Article as article where article.type=:type";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("type", type);
		return new Integer(query.uniqueResult().toString());
	}
	@Override
	public List<Article> getArticles(String type,Integer page, Integer pageSize){
		String hql = "from Article as article where article.type=:type";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("type", type);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	@Override
	public Integer changeReply(Integer articleId) {
		String hql = "select count(ctq.id) from Critique as ctq where ctq.articleId=:aritcleId";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setInteger("aritcleId",articleId);
		return new Integer(query.uniqueResult().toString());
	}	
}