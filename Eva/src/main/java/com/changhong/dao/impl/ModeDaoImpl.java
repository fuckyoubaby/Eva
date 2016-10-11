package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ModeDao;
import com.changhong.entities.Mode;
import com.changhong.util.Params;

@Repository("modeDao")
public class ModeDaoImpl extends BaseDaoImpl<Mode> implements ModeDao{
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Mode> getModesByPage(int offset, int length, String keyword) {
		String hql = "from Mode";
		Query query = getSession().createQuery(hql);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	@Override
	public int getCount(String keyword) {
		String hql = "from Mode";
		Query query = getSession().createQuery(hql);
		return query.list().size();
	}

	@Override
	public Mode saveAndGet(Mode mode) {
		save(mode);
		String hql = "from Mode where createTime=? and modeName=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, mode.getCreateTime());
		query.setParameter(1, mode.getModeName());
		if (query.list().size()>0) {
			return (Mode) query.list().get(0);
		}else {
			return null;
		}
		
	}

	@Override
	public List<Mode> getModesByPage(Params params) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Mode";
				query = getSession().createQuery(hql);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Mode order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
				}else {
					hql = "from Mode order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Mode where modeName like ?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Mode where (modeName like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Mode where (modeName like ?) order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}

	@Override
	public int getCount(Params params) {
		String hql = "";
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			hql = "from Mode";
		}else {
			hql = "from Mode where modeName like ?";
		}
		Query query = getSession().createQuery(hql);
		if (params.getKeyword()!=null&&!(params.getKeyword().equals(""))) {
			query.setParameter(0, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}

}
