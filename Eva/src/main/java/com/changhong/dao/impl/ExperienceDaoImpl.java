package com.changhong.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ExperienceDao;
import com.changhong.entities.DataDirt;
import com.changhong.entities.Experience;
import com.changhong.util.ExpParams;
import com.changhong.util.Params;
@Repository("experienceDao")
public class ExperienceDaoImpl extends BaseDaoImpl<Experience> implements ExperienceDao{

	private static final Logger log = LoggerFactory.getLogger(ExperienceDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Experience> getExperiencesByPage(int offset, int length,
			String keyword) {
		Query query=null;
		log.info("keyword = "+keyword);
		if (keyword==null||keyword.equals("")) {
			String hql="from Experience";
			query = getSession().createQuery(hql);
		}
		else{
			//String hql = "from Experience where experienceName=? or employee.name=? or area=? or exState=? or title=?";
			String hql = "from Experience where experienceName like ? or employee.name like ? or area like ? or exState like ? or title like ?";
			query = getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
			query.setParameter(4, "%"+keyword+"%");
		}
		
		
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCount(String keyword) {
		Query query=null;
		if (keyword==null||keyword.equals("")) {
			String hql="from Experience";
			query = getSession().createQuery(hql);
		}
		else{
			//String hql = "from Experience where experienceName=? or employee.name=? or area=? or exState=? or title=?";
			String hql = "from Experience where experienceName like ? or employee.name like ? or area like ? or exState like ? or title like ?";
			query = getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
			query.setParameter(4, "%"+keyword+"%");
		}
		return query.list().size();
	}
	@Override
	public List<Integer> getAllNum() {
		CallableStatement proc = null; 
		List<Integer> list = new ArrayList<Integer>();
		try {
			String hql = "{Call experience_num(?,?,?)}";
			Connection conn = SessionFactoryUtils.getDataSource(sessionFactory).getConnection();
//			Connection conn = SessionFactoryUtils.getDataSource(getSession().getSessionFactory()).getConnection();
			proc = conn.prepareCall(hql);
			
			proc.registerOutParameter(1, java.sql.Types.INTEGER);
			proc.registerOutParameter(2, java.sql.Types.INTEGER);
			proc.registerOutParameter(3, java.sql.Types.INTEGER);
			proc.execute();
			
			
			list.add(proc.getInt(1));
			list.add(proc.getInt(2));
			list.add(proc.getInt(3));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Experience> getExperiencesByEmployeeIdAndDate(
			String employeeId, Date startTime, Date endTime) {
		String hql = "from Experience where employee.id=? and exTime>=? and exTime<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startTime);
		query.setParameter(2, endTime);
		return query.list();
	}
	@Override
	public List<Experience> getExperiencesByPage(Params params) {
		Query query = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("from Experience as model where 1=1 ");
		Map<String,Object> maps = new HashMap<String,Object>();
		
		if(params instanceof ExpParams){
			ExpParams p  =(ExpParams)params;
			if(StringUtils.isNotBlank(p.getState())){
				sb.append(" and model.exState=:exState ");
				maps.put("exState", p.getState());
			}
			
			if(p.getDirctId()!=-1){
				if(p.isHasChild()){
					sb.append(" and model.dataDirt.nId in ("
							+ " select(dirt.nId) from DataDirt as dirt where dirt.nId=:nodeId or dirt.pId=:nodeId ) ");
				}else{
					sb.append(" and model.dataDirt.nId in("
							+ " select(dirt.nId) from DataDirt as dirt where dirt.nId=:nodeId)");
				}
				maps.put("nodeId", p.getDirctId());
			}
		}
		
		if(StringUtils.isNotBlank(params.getKeyword())){
			sb.append(" and ( model.experienceName like :keyword or model.employee.name like :keyword  or model.area like :keyword or model.title like :keyword ) ");
			maps.put("keyword", "%"+params.getKeyword()+"%");
		}
		
		if(StringUtils.isNotBlank(params.getOrderName())){
			sb.append(" order by model."+params.getOrderName());
			if(StringUtils.isNotBlank(params.getOrderType())){
				sb.append(" "+params.getOrderType());
			}
		}
		query = getSession().createQuery(sb.toString());
		for (String proeprtyName : maps.keySet()) {
			query.setParameter(proeprtyName, maps.get(proeprtyName));
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		log.info("list size = "+query.list().size());
		
		return query.list();
	}
	@Override
	public int getCount(Params params) {
		Query query = null;

		StringBuilder sb = new StringBuilder();
		sb.append("select count(model) from Experience as model where 1=1 ");
		Map<String,Object> maps = new HashMap<String,Object>();
		
		if(params instanceof ExpParams){
			ExpParams p  =(ExpParams)params;
			if(StringUtils.isNotBlank(p.getState())){
				sb.append(" and model.exState=:exState ");
				maps.put("exState", p.getState());
			}
			
			if(p.getDirctId()!=-1){
				if(p.isHasChild()){
					sb.append(" and model.dataDirt.nId in ("
							+ " select(dirt.nId) from DataDirt as dirt where dirt.nId=:nodeId or dirt.pId=:nodeId ) ");
				}else{
					sb.append(" and model.dataDirt.nId in("
							+ " select(dirt.nId) from DataDirt as dirt where dirt.nId=:nodeId)");
				}
				maps.put("nodeId", p.getDirctId());
			}
		}
		
		if(StringUtils.isNotBlank(params.getKeyword())){
			sb.append(" and ( model.experienceName like :keyword or model.employee.name like :keyword  or model.area like :keyword or model.title like :keyword ) ");
			maps.put("keyword", "%"+params.getKeyword()+"%");
		}
		
		
		query = getSession().createQuery(sb.toString());
		for (String proeprtyName : maps.keySet()) {
			query.setParameter(proeprtyName, maps.get(proeprtyName));
		}
		
		return ((Long)query.uniqueResult()).intValue();
	}
	
	
}
