/**
 * 
 */
package com.blog.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import com.blog.entity.Daily;
import com.blog.service.DailyService;
@Transactional
@Repository
public class DailyServiceImpl implements DailyService {
	@Resource
	private SessionFactory sessionFactory;
	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#save(com.blog.entity.Daily)
	 */
	@Override
	public void save(Daily daily) {
		sessionFactory.getCurrentSession().persist(daily);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Daily.class, id));
	}

	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#update(com.blog.entity.Daily)
	 */
	@Override
	public void update(Daily daily) {
		sessionFactory.getCurrentSession().merge(daily);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#query(java.lang.Integer)
	 */
	@Override
	public Daily query(Integer id) {
		return  (Daily) sessionFactory.getCurrentSession().get(Daily.class, id);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#getPhotos()
	 */
	@Override
	public List<Daily> getDailys(Integer page, Integer pageSize) {
		String hql = "from Daily as daily order by daily.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setFirstResult(page);
		query.setMaxResults(pageSize);
		return query.list();
	}

	/* (non-Javadoc)
	 * @see com.blog.service.DailyService#getSize()
	 */
	@Override
	public Integer getSize() {
		String hql = "select count(*) from Daily as daily";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return new Integer(query.uniqueResult().toString());
	}

}
