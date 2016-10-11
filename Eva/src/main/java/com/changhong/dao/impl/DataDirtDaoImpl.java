package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.DataDirtDao;
import com.changhong.entities.DataDirt;

@Repository("dataDirtDao")
@Transactional
public class DataDirtDaoImpl extends BaseDaoImpl<DataDirt> implements DataDirtDao {

	@Autowired
	private SessionFactory sessionFactory;

	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	/**
	 * BaseDaoImpl已实现
	 */
	@Override
	public List<DataDirt> getAllLists() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getMaxNID() {
		// TODO Auto-generated method stub
		String hql = "select max(nId) from DataDirt";
		Query query = getSession().createQuery(hql);
		//query.uniqueResult();
		//List<Integer> list = query.list();
		//return list.get(0);
		return (Integer)query.uniqueResult();
	}

	/**
	 * 计算总记录数
	 */
	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		String hql = "from DataDirt";
		Query query = getSession().createQuery(hql);
		return query.list().size();
	}

	@Override
	public boolean updateDirt(Integer nId, String newName) {
		// TODO Auto-generated method stub
		String hql = "update DataDirt as dt set dt.name = ? where dt.nId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, newName);
		query.setParameter(1, nId);
		int a = query.executeUpdate();
		if(a>0){
			return true;
		}else {
			return false;
		}
	}
	
	/**
	 * 增加一条数据
	 */
	@Override
	public int addDirt(DataDirt obj) {
		// TODO Auto-generated method stub
		int result = (Integer)getSession().save(obj);
		return result;
	}

	@Override
	public List<DataDirt> getDataDirtsByPID(int pid) {
		String hql = "from DataDirt where pId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, pid);
		return query.list();
	}

	@Override
	public boolean hasChildNode(int nodeId) {
		String hql = "select count(model.nId) from DataDirt as model where model.pId =:nodeId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("nodeId", nodeId);
		int result = ((Long)query.uniqueResult()).intValue();
		if(result>0)return true;
		return false;
	}



}
