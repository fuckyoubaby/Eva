package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ReviewDao;
import com.changhong.entities.Review;

import freemarker.core.ReturnInstruction.Return;

@Repository("reviewDao")
public class ReviewDaoImpl extends BaseDaoImpl<Review> implements ReviewDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Review> getByPhase(int phaseId) {
		String hql = "from Review where phase.phaseId=:phaseId";
		Query query = getSession().createQuery(hql) ;
		query.setParameter("phaseId", phaseId);
		return query.list();
	}
	@Override
	public Review getByNameAndPhaseId(Integer phaseId, String reviewName) {
		String hql = "from Review where phase.phaseId=:pId and reviewName =:rName ";
		Query query = getSession().createQuery(hql);
		query.setParameter("pId", phaseId);
		query.setParameter("rName", reviewName);
		return (Review) query.uniqueResult();
	}

}
