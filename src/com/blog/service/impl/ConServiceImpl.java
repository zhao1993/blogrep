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

import com.blog.entity.Connect;
import com.blog.entity.Daily;
import com.blog.service.ConService;

@Transactional
@Repository
public class ConServiceImpl implements ConService {
	@Resource
	private SessionFactory sessionFactory;
	/* (non-Javadoc)
	 * @see com.blog.service.ConService#save(com.blog.entity.Connect)
	 */
	@Override
	public void save(Connect con) {
		sessionFactory.getCurrentSession().persist(con);

	}

	/* (non-Javadoc)
	 * @see com.blog.service.ConService#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Connect.class, id));

	}

	/* (non-Javadoc)
	 * @see com.blog.service.ConService#update(com.blog.entity.Connect)
	 */
	@Override
	public void update(Connect con) {
		sessionFactory.getCurrentSession().merge(con);

	}

	/* (non-Javadoc)
	 * @see com.blog.service.ConService#query(java.lang.Integer)
	 */
	@Override
	public Connect query(Integer id) {
		return  (Connect) sessionFactory.getCurrentSession().get(Connect.class, id);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.ConService#getConnects(java.lang.Integer, java.lang.Integer)
	 */
	@Override
	public List<Connect> getConnects() {
		String hql = "from Connect as con order by con.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

}
