package com.blog.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.blog.entity.Manager;
import com.blog.service.ManagerService;

@Transactional
@Repository
public class ManagerServiceImpl implements ManagerService {
	@Resource
	private SessionFactory sessionFactory;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.impl.ManagerService#save(com.blog.entity.Manager)
	 */
	public void save(Manager manager) {
		sessionFactory.getCurrentSession().persist(manager);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.impl.ManagerService#delete(java.lang.Integer)
	 */
	public void delete(Integer id) {
		sessionFactory.getCurrentSession().delete(sessionFactory.getCurrentSession().load(Manager.class, id));
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.impl.ManagerService#update(com.blog.entity.Manager)
	 */
	public void update(Manager manager) {
		sessionFactory.getCurrentSession().merge(manager);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.impl.ManagerService#querty(java.lang.Integer)
	 */
	public Manager querty(Integer id) {
		Manager manager = (Manager) sessionFactory.getCurrentSession().get(Manager.class, id);
		return manager;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.impl.ManagerService#querty(java.lang.String)
	 */
	public Manager querty(String account) {
		Manager m = null;
		String hql = "from Manager as manager where manager.account=:account";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("account", account);
		if (query.list().size() == 0) {
			return null;
		}
		return (Manager) sessionFactory.getCurrentSession().createQuery(hql).setString("account", account).list()
				.get(0);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.blog.service.ManagerService#quertyByCommand(java.lang.String)
	 */
	@Override
	public boolean quertyByCommand(String command) {
		Manager m = null;
		String hql = "from Manager";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		List<Manager> managers = query.list();
		for (Manager manager : managers) {
			if(command.equals(new StringBuffer(manager.getAccount()).append(manager.getPassword()).toString()))
				return true;
		}
		return false;
	}
}
