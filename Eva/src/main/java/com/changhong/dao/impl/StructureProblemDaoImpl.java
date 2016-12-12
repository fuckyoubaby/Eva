package com.changhong.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.StructureProblemDao;
import com.changhong.entities.Structureproblem;
import com.changhong.util.Params;

@Repository("structureProblemDao")
public class StructureProblemDaoImpl extends BaseDaoImpl<Structureproblem>  implements StructureProblemDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	

	@Override
	public List<Structureproblem> getProblemsByPhaseForProject(Params params,
			int phaseId, String projectId) {
		Map<String,Object> values = new HashMap<String, Object>();
	   if(params == null) return null;
	   StringBuilder sb = new StringBuilder();
	   sb.append("from Structureproblem as model where 1=1 ");
	   if(StringUtils.isNotBlank(projectId)){
		   sb.append(" and model.project.projectId=:projectId ");
		   values.put("projectId", projectId);
	   }
	   
	   if(phaseId>0){
		   sb.append(" and model.phase.phaseId=:phaseId ");
		   values.put("phaseId", phaseId);
	   }
	   
	   if(StringUtils.isNotBlank(params.getOrderName())){
		   sb.append(" order by model."+params.getOrderName().trim()+" ");
		   if(StringUtils.isNotBlank(params.getOrderType())){
			   sb.append(params.getOrderType());
		   }
	   }else sb.append(" order by model.createDate desc ");
	   
	   	Query query = getSession().createQuery(sb.toString());
	   	
	   	for(Map.Entry<String, Object> entry : values.entrySet()){
	   		query.setParameter(entry.getKey(), entry.getValue());
	   	}
	   	
	   	query.setFirstResult(params.getPageNo());
	   	query.setMaxResults(params.getPageSize());
	   return query.list();
	}

	@Override
	public int getQueryAmountByPhaseForProject(Params params, int phaseId,
			String projectId) {
			Map<String,Object> values = new HashMap<String, Object>();
		   if(params == null) return 0;
		   StringBuilder sb = new StringBuilder();
		   sb.append("select count(model.id) from Structureproblem as model where 1=1 ");
		   if(StringUtils.isNotBlank(projectId)){
			   sb.append(" and model.project.projectId=:projectId ");
			   values.put("projectId", projectId);
		   }
		   
		   if(phaseId>0){
			   sb.append(" and model.phase.phaseId=:phaseId ");
			   values.put("phaseId", phaseId);
		   }
		   
		   
		   	Query query = getSession().createQuery(sb.toString());
		   	
		   	for(Map.Entry<String, Object> entry : values.entrySet()){
		   		query.setParameter(entry.getKey(), entry.getValue());
		   	}
		   	
		   return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public int getCountByDate(Date startDate, Date endDate, int problemType) {
		String hql = "select count(model.id)  from Structureproblem as model where model.createDate>=:startDate and model.createDate<=:endDate "
				+ "and model.problemtype.typeId=:problemType";
		Query query = getSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("problemType", problemType);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public int getCountByDateAndEmployee(String employeeId, Date startDate,
			Date endDate, int problemType) {
		String hql = "select count(model.id)  from Structureproblem as model where model.createDate>=:startDate and model.createDate<=:endDate "
				+ "and model.problemtype.typeId=:problemType and model.employee.id=:employeeId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("problemType", problemType);
		query.setParameter("employeeId", employeeId);
		return ((Long)query.uniqueResult()).intValue();
	}


	@Override
	public double getAvg(String employeeId, Date startDate, Date endDate,
			int problemType) {
		String hql = "select avg(score) from Structureproblem  where employee.id=:employeeId and createDate>=:startDate and createDate<=:endDate and problemtype.typeId=:problemType";
		Query query = getSession().createQuery(hql);
		query.setParameter("employeeId", employeeId);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("problemType", problemType);
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
	public double getSum(String employeeId, Date startDate, Date endDate,
			int problemType) {
		String hql = "select SUM(score) from Structureproblem  where employee.id=:employeeId and createDate>=:startDate and createDate<=:endDate and problemtype.typeId=:problemType";
		Query query = getSession().createQuery(hql);
		query.setParameter("employeeId", employeeId);
		query.setParameter("startDate", startDate);
		query.setParameter("endDate", endDate);
		query.setParameter("problemType", problemType);
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
	public List<Structureproblem> getListForUser(String employeeId,
			int phaseId, String projectId, Params params) {
		String hql = "from Structureproblem  where employee.id=:employeeId and project.projectId=:projectId and phase.phaseId=:phaseId";
		Query query = getSession().createQuery(hql);
		query.setParameter("employeeId", employeeId);
		query.setParameter("projectId", projectId);
		query.setParameter("phaseId", phaseId);
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}


	@Override
	public int getCountForUser(String employeeId, String projectId, int phaseId) {
		String hql = "from Structureproblem  where employee.id=:employeeId and project.projectId=:projectId and phase.phaseId=:phaseId";
		Query query = getSession().createQuery(hql);
		query.setParameter("employeeId", employeeId);
		query.setParameter("projectId", projectId);
		query.setParameter("phaseId", phaseId);
		return query.list().size();
	}

}
