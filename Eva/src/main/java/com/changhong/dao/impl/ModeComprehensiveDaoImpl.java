package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ModeComprehensiveDao;
import com.changhong.entities.Comprehensive;
import com.changhong.entities.Modecomprehensive;

@Repository("modeComprehensiveDao")
public class ModeComprehensiveDaoImpl extends BaseDaoImpl<Modecomprehensive> implements ModeComprehensiveDao{

	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<Modecomprehensive> getModecomprehensivesByModeId(int modeId) {
		String hql = "from Modecomprehensive where mode.modeId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list();
	}

	@Override
	public void delete(int modeId, int comprehensiveId) {
		String hql = "from Modecomprehensive where mode.modeId=? and comprehensive.comprehensiveId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		query.setParameter(1, comprehensiveId);
		if (query.list().size()>0) {
			if (query.list().get(0)!=null) {
				delete((Modecomprehensive)query.list().get(0));
			}
		}
	}

}
