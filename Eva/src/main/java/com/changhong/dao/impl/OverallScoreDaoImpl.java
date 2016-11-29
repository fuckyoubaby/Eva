package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.OverallScoreDao;
import com.changhong.entities.Overallscore;

@Repository("overallScoreDao")
public class OverallScoreDaoImpl extends BaseDaoImpl<Overallscore> implements OverallScoreDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public Overallscore getAndSave(Overallscore overallscore) {
		save(overallscore);
		String hql = "from Overallscore where createTime=? and name=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, overallscore.getCreateTime());
		query.setParameter(1, overallscore.getName());
		if (query.list().size()>0) {
			return (Overallscore) query.list().get(0);
		}else
		{
			return null;
		}
		
	}
	@Override
	public List<Overallscore> getOverallscoresByPage(int offset, int length) {
		String hql = "from Overallscore order by id desc";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	

}
