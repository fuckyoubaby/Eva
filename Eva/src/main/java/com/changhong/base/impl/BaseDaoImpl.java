package com.changhong.base.impl;

import java.io.Serializable;
import java.util.List;

import javax.persistence.criteria.From;

import org.apache.poi.ss.formula.functions.Count;
import org.apache.struts2.components.Select;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.changhong.base.BaseDao;


@Transactional
public class BaseDaoImpl<T> implements BaseDao<T>{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public T get(Class<T> entityClass, Serializable id) {
		// TODO Auto-generated method stub
		return (T) getSession().get(entityClass, id);
	}

	@Override
	public void save(T entity) {
		//getSession().save(entity);
		getSession().merge(entity);
	}

	@Override
	public void update(T entity) {
		getSession().merge(entity);
	}

	@Override
	public void delete(T entity) {
		Session session = getSession();
		session.clear();
		session.delete(entity);
		
		
	}

	@Override
	public void delete(Class<T> entityClass, Serializable id) {
		delete(get(entityClass, id));
	}

	@Override
	public List<T> findAll(Class<T> entityClass) {
		// TODO Auto-generated method stub
		//return find("select * from " +entityClass.getSimpleName() );
	/*	System.out.println(" getSimpleName = "+entityClass.getSimpleName());
		System.out.println(" getName = "+entityClass.getName());*/
		return getSession().createQuery("from "+entityClass.getSimpleName()).list();
	}
	protected List<T> find(String hql){
		return getSession().createQuery(hql).list();
	}
	
	protected List<T> find(String hql, Object... params){
		Query query = getSession().createQuery(hql);
		
		for(int i=0, len = params.length ; i<len; i++){
			query.setParameter(i, params[i]);
		}
		
		return query.list();
	}
	@Override
	public List<T> findByPage(Class<T> entityClass, int offset, int length) {
		Query query = getSession().createQuery("from "+entityClass.getSimpleName());
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getAllCount(Class<T> entityClass) {
		String hql = "Select Count(*) from " + entityClass.getSimpleName() + " as count";
		Query query = getSession().createQuery(hql);
		
		return ((Long)query.uniqueResult()).intValue();
	}
	@Override
	public int save(List<T> lists) {
		int size = lists.size();
		Session session = getSession();
		for(int i=0;i<size;i++){
			//session.save(lists.get(i));
			session.merge(lists.get(i));
			if(i%20==0){
				session.flush();
				session.clear();
			}
		}
		session.flush();
		session.clear();
		return size;
	}

}
