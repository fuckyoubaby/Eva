package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.EmployeeTrainDao;
import com.changhong.entities.Employeetrainr;

@Repository("employeeTrainDao")
public class EmployeeTrainDaoImpl extends BaseDaoImpl<Employeetrainr> implements EmployeeTrainDao{

	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Employeetrainr> getEmployeetrainrsByTrainId(int trainId) {
		String hql = "from Employeetrainr where train.trainId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, trainId);
		return query.list();
	}
	
}
