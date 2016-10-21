package com.changhong.dao.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProjectReviewDao;
import com.changhong.entities.Project;
import com.changhong.entities.Projectreview;
import com.changhong.util.Params;

@Repository("projectReviewDao")
public class ProjectReviewDaoImpl extends BaseDaoImpl<Projectreview> implements ProjectReviewDao{

	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	
	public ProjectReviewDaoImpl() {
		
	}

	@Override
	public List<Projectreview> getProjectreviewsByEmployeeIdAndDate(
			String employeeId, Date startDate, Date endDate) {
		String hql = "from Projectreview where employee.id=? and prdate>=? and prdate<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list();
	}

	@Override
	public List<Projectreview> getProjectreviewsByProjectId(String projectId) {
		String hql = "from Projectreview where project.projectId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, projectId);
		return query.list();
	}
	@Override
	public List<Projectreview> getProjectreviewsByProjectIdForPage(
			Params params, String projectId, int phaseId) {
		StringBuffer sb = new StringBuffer();
		sb.append("from Projectreview as model where 1=1 ");
		Map<String,Object> maps = new HashMap<String,Object>();
		if(!StringUtils.isBlank(projectId)){
			sb.append(" and model.project.projectId=:projectId ");
			maps.put("projectId", projectId);
		}
		if(phaseId>0){
			sb.append(" and model.phase.phaseId=:phaseId ");
			maps.put("phaseId", phaseId);
		}
		if(StringUtils.isNotBlank(params.getOrderName())){
			sb.append("order by model."+params.getOrderName()+" ");
			if(StringUtils.isNotBlank(params.getOrderType())){
				sb.append(params.getOrderType());
			}
		}
		Query query = getSession().createQuery(sb.toString());
		if(maps.size()>0){
		  for (Map.Entry<String, Object> entry : maps.entrySet()) { 
			  query.setParameter(entry.getKey(), entry.getValue());
	        }  
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}
	@Override
	public int getAmountByProjectIdForPage(Params params, String projectId,
			int phaseId) {
		
		StringBuffer sb = new StringBuffer();
		sb.append("select count(model.projectReviewId) from Projectreview as model where 1=1 ");
		Map<String,Object> maps = new HashMap<String,Object>();
		if(!StringUtils.isBlank(projectId)){
			sb.append(" and model.project.projectId=:projectId ");
			maps.put("projectId", projectId);
		}
		if(phaseId>0){
			sb.append(" and model.phase.phaseId=:phaseId ");
			maps.put("phaseId", phaseId);
		}

		Query query = getSession().createQuery(sb.toString());
		if(maps.size()>0){
		  for (Map.Entry<String, Object> entry : maps.entrySet()) { 
			  query.setParameter(entry.getKey(), entry.getValue());
	        }  
		}
		return ((Long)query.uniqueResult()).intValue();
	}
	@Override
	public int getCountNotZero(String employeeId, Date startDate, Date endDate,
			String colName) {
		String hql = "from Projectreview where employee.id=? and prdate>=? and prdate<=? and "+colName+"!=0";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list().size();
	}
	@Override
	public Long getSumByCol(String employeeId, Date startDate, Date endDate,
			String colName) {
		String hql = "select SUM("+colName+") from Projectreview where employee.id=? and prdate>=? and prdate<=? and "+colName+"!=0";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		
		if (query.list().size()>0) {
			if (query.list().get(0)==null) {
				return 0l;
			}else {
				Long t =  (Long) query.list().get(0);
				return t;
			}
			
		}else {
			return 0l;
		}
	}
	@Override
	public Project getProjectById(Integer projectReviewId) {
		String hql ="select model.project from Projectreview as model where model.projectReviewId =:projectReviewId";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectReviewId", projectReviewId);
		return (Project) query.uniqueResult();
	}

	@Override
	public int getAmountByProjectId(String projectId) {
		String hql ="select count(projectReviewId) from Projectreview where project.projectId=:project";
		Query query = getSession().createQuery(hql);
		query.setParameter("project", projectId);
		return ((Long)query.uniqueResult()).intValue();
	}
	@Override
	public int getAmountByEmpAndProject(String empId, String projectId) {
		String hql ="select count(projectReviewId) from Projectreview where project.projectId=:project and employee.id=:empId";
		Query query = getSession().createQuery(hql);
		query.setParameter("project", projectId);
		query.setParameter("empId", empId);
		return ((Long)query.uniqueResult()).intValue();
	}
	
	@Override
	public List<Projectreview> getProjectreviewsByProjectIdForPageForUser(
			int pageNo, int pageSize, String projectId, int phaseId,
			String employeeId) {
		String hql = "from Projectreview where project.projectId=:projectId and phase.phaseId =:phaseId and employee.id=:id";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("phaseId", phaseId);
		query.setParameter("id", employeeId);
		query.setFirstResult(pageNo);
		query.setMaxResults(pageSize);
		return query.list();
	}
	@Override
	public int getAmountByProjectIdForPageForUser(String projectId,
			int phaseId, String employeeId) {
		// TODO Auto-generated method stub
		String hql = "from Projectreview where project.projectId=:projectId and phase.phaseId =:phaseId and employee.id=:id";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("phaseId", phaseId);
		query.setParameter("id", employeeId);
		return query.list().size();
	}

	@Override
	public int getCountByDateAndEmployee(String employeeId, Date startDate,
			Date endDate) {
		String hql = "from Projectreview where employee.id=? and prdate>=? and prdate<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list().size();
	}

}
