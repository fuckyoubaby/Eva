package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.SecondWeightDao;
import com.changhong.entities.Secondweight;

@Repository("secondWeightDao")
public class SecondWeightDaoImpl extends BaseDaoImpl<Secondweight> implements SecondWeightDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Secondweight> getSecondweightsByModeId(int modeId) {
		String hql="from Secondweight where mode.modeId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list();
	}
	@Override
	public List<Secondweight> getSecondweightsByModeIdAndType(int modeId,
			String problemType) {
		String hql = "from Secondweight where mode.modeId=? and secondLevel=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		query.setParameter(1, problemType);
		return query.list();
	}

}
