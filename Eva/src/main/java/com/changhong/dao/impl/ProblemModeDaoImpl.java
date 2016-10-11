package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProblemModeDao;
import com.changhong.entities.Problemmode;

@Repository("problemModeDao")
public class ProblemModeDaoImpl extends BaseDaoImpl<Problemmode> implements ProblemModeDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Problemmode> getProblemmodes(int offset, int length,
			String keyword) {
		String hql = "from Problemmode";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCount(String keyword) {
		String hql = "from Problemmode";
		Query query = getSession().createQuery(hql);
		return query.list().size();
	}

}
