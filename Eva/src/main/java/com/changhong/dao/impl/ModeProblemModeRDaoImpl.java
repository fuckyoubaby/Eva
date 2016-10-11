package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ModeProblemModeRDao;
import com.changhong.entities.Modeproblemmoder;

@Repository("modeProblemModeRDao")
public class ModeProblemModeRDaoImpl extends BaseDaoImpl<Modeproblemmoder> implements ModeProblemModeRDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public boolean isExist(int modeId, int problemModeId) {
		String hql = "from Modeproblemmoder where mode.modeId=? and problemmode.problemModeId=?";
		Query query = getSession().createQuery(hql);
		if (query.list().size()>0) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public List<Modeproblemmoder> getModeproblemmodersByModeId(int modeId) {
		String hql = "from Modeproblemmoder where mode.modeId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list();
	}
	@Override
	public void delete(int modeId, int problemModeId) {
		String hql = "from Modeproblemmoder where mode.modeId=? and problemmode.problemModeId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		query.setParameter(1, problemModeId);
		if (query.list().size()>0) {
			if (query.list().get(0)!=null) {
				delete((Modeproblemmoder)query.list().get(0));
			}
		}
	}

}
