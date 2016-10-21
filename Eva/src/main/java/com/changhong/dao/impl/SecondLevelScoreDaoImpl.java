package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.SecondLevelScoreDao;
import com.changhong.entities.Secondlevelscore;

@Repository("secondLevelScoreDao")
public class SecondLevelScoreDaoImpl extends BaseDaoImpl<Secondlevelscore> implements SecondLevelScoreDao{

	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Secondlevelscore> getSecondlevelscoresByModeId(int modeId) {
		String hql = "from Secondlevelscore where mode.modeId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list();
	}

	@Override
	public List<Secondlevelscore> getSecondlevelscoresByEmployeeId(
			String employeeId) {
		String hql = "from Secondlevelscore where employee.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		return query.list();
		
	}

	@Override
	public List<Secondlevelscore> getSecondlevelscoresByModeIdAndEmployeeId(
			int modeId, String employeeId) {
		String hql = "from Secondlevelscore where overallscore.id=? and employee.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		query.setParameter(1, employeeId);
		return query.list();
	}
	@Override
	public double getAvg(String type, int overallId) {
		String hql = "select avg(score) from Secondlevelscore  where overallscore.id=? and secondLevel=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, overallId);
		query.setParameter(1, type);
		if (query.list().size()>0) {
			if (query.list().get(0)==null) {
				return 0;
			}else {
				double t =  (Double) query.list().get(0);
				return t;
			}
			
		}else {
			return 0;
		}
	}
	@Override
	public List<Secondlevelscore> getSecondlevelscoresByOverallIdAndEmployeeId(
			String employeeId, int overallId) {
		String hql = "from Secondlevelscore where overallscore.id=? and employee.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, overallId);
		query.setParameter(1, employeeId);
		return query.list();
	}

}
