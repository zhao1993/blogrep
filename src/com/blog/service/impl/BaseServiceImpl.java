/**
 * 
 */
package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Hibernate;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.blog.entity.Base;
import com.blog.service.BaseService;

@Transactional
@Repository
public class BaseServiceImpl implements BaseService {
	@Resource private SessionFactory sessionFactory;
	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#save(com.blog.entity.Base)
	 */
	@Override
	public void save(Base base) {
		sessionFactory.getCurrentSession().persist(base);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Base.class, id));
	}

	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#update(com.blog.entity.Base)
	 */
	@Override
	public void update(Base base) {
		sessionFactory.getCurrentSession().merge(base);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#query(java.lang.Integer)
	 */
	@Override
	public Base query(Integer id) {
		Base base = (Base) sessionFactory.getCurrentSession().get(Base.class, id);
		Hibernate.initialize(base.getStitle());
		return base;
	}

	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#getBases()
	 */
	@Override
	public List<Base> getBases() {
		String hql = "from Base as base";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	/* (non-Javadoc)
	 * @see com.blog.service.BaseService#getSize()
	 */
	@Override
	public Integer getSize() {
		String hql = "select count(*) from Base as base";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return new Integer(query.uniqueResult().toString());
	}

}
