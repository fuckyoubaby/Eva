package com.changhong.dao.impl;

import java.util.Date;



import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.TrainOrgDao;
import com.changhong.entities.Trainorg;

@Repository("trainOrgDao")
public class TrainOrgDaoImpl extends BaseDaoImpl<Trainorg> implements TrainOrgDao{

	private static final Logger log = LoggerFactory.getLogger(TrainOrgDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public int getCount(String employeeId, Date startDate, Date endDate) {
		String hql = "from Trainorg where employee.id=? and train.trainTime>=? and train.trainTime<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list().size();
	}
	@Override
	public List<Trainorg> getTrainorgs(int trainId) {
		String hql="from Trainorg where train.trainId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, trainId);
		return query.list();
	}
	@Override
	public List<Trainorg> getTrainorgsByEmployeeId(String employeeId,
			Date startDate, Date endDate) {
		log.info("AAAAAAAAAAAAAAAAAAAAAAA"+startDate+"==="+endDate);
		//String hql = "from Trainorg where employee.id=? and train.trainTime>=? and train.trainTime<=?";
		String hql = "from Trainorg where employee.id=? and train.trainTime between ? and ?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list();
	}

}
