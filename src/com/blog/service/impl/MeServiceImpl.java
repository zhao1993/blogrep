package com.blog.service.impl;


import javax.annotation.Resource;

import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Me;
import com.blog.service.MeService;

@Transactional
@Repository
public class MeServiceImpl implements MeService {
	@Resource private SessionFactory sessionFactory;
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.MeService#save(com.blog.entity.Me)
	 */
	public void save(Me me){
		sessionFactory.getCurrentSession().persist(me);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.impl.MeService#delete(java.lang.Integer)
	 */
	public void delete(Integer id){
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(Me.class, id));
	}

	/* (non-Javadoc)
	 * @see com.blog.service.impl.MeService#update(com.blog.entity.Me)
	 */
	public void update(Me me){
		sessionFactory.getCurrentSession().merge(me);
	}
	
	/* (non-Javadoc)
	 * @see com.blog.service.impl.MeService#query(java.lang.Integer)
	 */
	public Me query(Integer id){
		return (Me) sessionFactory.getCurrentSession().get(Me.class, id);
	}

}
