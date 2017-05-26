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
import com.blog.entity.User;
import com.blog.service.UserService;
	
	@Transactional
	@Repository
public class UserServiceImpl implements UserService {
		@Resource
		private SessionFactory sessionFactory;
	/* (non-Javadoc)
	 * @see com.blog.service.UserService#save(com.blog.entity.User)
	 */
	@Override
	public void save(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().persist(user);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#delete(java.lang.Integer)
	 */
	@Override
	public void delete(Integer id) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().delete(
				sessionFactory.getCurrentSession().load(User.class, id));

	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#query(java.lang.String)
	 */
	@Override
	public User query(String account) {
		// TODO Auto-generated method stub
		String hql = "from User as user where user.account =:acc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("acc", account);
		return (User) query.uniqueResult();
	}
	/* (non-Javadoc)
	 * @see com.blog.service.UserService#update(com.blog.entity.User)
	 */
	@Override
	public void update(User user) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().merge(user);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#query(java.lang.Integer)
	 */
	@Override
	public User query(Integer id) {
		// TODO Auto-generated method stub
		return  (User) sessionFactory.getCurrentSession().get(User.class, id);
	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#getUsers()
	 */
	@Override
	public List<User> getUsers() {
		// TODO Auto-generated method stub
		String hql = "from User as user order by user.id desc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		return query.list();
	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#nameExist(java.lang.String)
	 */
	@Override
	public boolean nameExist(String userName) {
		// TODO Auto-generated method stub
		String hql = "from User as user where user.name=:userName";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("userName",userName);
		return query.list().size()>0;
	}

	/* (non-Javadoc)
	 * @see com.blog.service.UserService#accExist(java.lang.String)
	 */
	@Override
	public boolean accExist(String userAcc) {
		// TODO Auto-generated method stub
		String hql = "from User as user where user.account=:userAcc";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setString("userAcc",userAcc);
		 return query.list().size()>0;
	}

	

}
