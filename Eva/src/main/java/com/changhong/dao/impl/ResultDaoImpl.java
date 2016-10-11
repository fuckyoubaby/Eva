package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ResultDao;
import com.changhong.entities.Result;
import com.changhong.util.Params;

@Repository("resultDao")
public class ResultDaoImpl extends BaseDaoImpl<Result> implements ResultDao{

	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Result> getResultsByPageAndModeId(int offset, int length,
			int modeId) {
		String hql = "from Result where overallscore.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCountByModeId(int modeId) {
		String hql = "from Result where overallscore.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list().size();
	}
	@Override
	public List<Result> getResultsByEmployeeIdAndDate(String employeeId) {
		String hql = "from Result where employee.id=? order by overallscore.createTime";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		return query.list();
	}
	@Override
	public List<Result> getResultsByPageAndModeId(Params params, int modeId) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Result where overallscore.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, modeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Result where overallscore.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, modeId);
				}else {
					hql = "from Result where overallscore.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, modeId);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Result where overallscore.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, modeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Result where overallscore.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, modeId);
				}else {
					hql = "from Result where overallscore.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, modeId);
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}
	@Override
	public int getCountByModeId(Params params, int modeId) {
		String hql = "from Result where overallscore.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, modeId);
		return query.list().size();
	}
	@Override
	public double getAVG(String colName, int overallId) {
		String hql = "select avg("+colName+") from Result  where overallscore.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, overallId);
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
	public Result getMax(String colName, int voerallId) {
		String hql = "from Result where "+colName+"=(select max("+colName+") from Result  where overallscore.id=?) ";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, voerallId);
		if (query.list().size()>0) {
			if (query.list().get(0)==null) {
				return null;
			}else {
				Result result = (Result) query.list().get(0);
				return result;
			}
		}else {
			return null;
		}
	}
	@Override
	public Result getResultByEmployeeIdAndOverallId(String employeeId,
			int overallId) {
		String hql = "from Result where employee.id=? and overallscore.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, overallId);
		if (query.list().size()>0) {
			if (query.list().get(0)!=null) {
				return (Result) query.list().get(0);
			}else {
				return null;
			}
		}else {
			return null;
		}
		
	}

}
