package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProjectDao;
import com.changhong.entities.Project;
import com.changhong.entities.Review;
import com.changhong.util.Params;

@Repository("projectDao")
public class ProjectDaoImpl extends BaseDaoImpl<Project> implements ProjectDao{

	private static final Logger log = LoggerFactory.getLogger(ProjectDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Project> getProjectsByPage(int offset, int length,
			String keyword) {
		String hql = "";
		if (keyword==null||keyword.equals("")) {
			hql = "from Project order by employee.id";
		}else {
			hql = "from Project where (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) order by employee.id";
		}
		Query query = getSession().createQuery(hql);
		if (keyword!=null&&!(keyword.equals(""))) {
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		
		return query.list();
	}

	@Override
	public int getCount(String keyword) {
		String hql = "";
		if (keyword==null||keyword.equals("")) {
			hql = "from Project";
		}else {
			hql = "from Project where projectName like ? or projectState like ? or projectId like ? or employee.name like ?";
		}
		Query query = getSession().createQuery(hql);
		if (keyword!=null&&!(keyword.equals(""))) {
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Project> getPorjectsByPageForUser(int offset, int length,
			String keyword, String employeeId) {
		String hql = "";
		if (keyword==null||keyword.equals("")) {
			hql = "from Project";
		}else {
			hql = "from Project where (projectName like ? or projectState like ? or projectId like ?) and employee.id=?";
		}
		Query query = getSession().createQuery(hql);
		if (keyword!=null&&!(keyword.equals(""))) {
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, employeeId);
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	@Override
	public int getCountForUser(String keyword, String employeeId) {
		String hql = "";
		if (keyword==null||keyword.equals("")) {
			hql = "from Project";
		}else {
			hql = "from Project where (projectName like ? or projectState like ? or projectId like ?) and employee.id=?";
		}
		Query query = getSession().createQuery(hql);
		if (keyword!=null&&!(keyword.equals(""))) {
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, employeeId);
		}
		return query.list().size();
	}

	@Override
	public List<Project> getProjectsByPage(Params params) {
		log.info("params = "+params.getOrderName());
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Project";
				query = getSession().createQuery(hql);
			}else {
				log.info("ordername="+params.getOrderName()+"--ordertype="+params.getOrderType());
				if (params.getOrderType().equals("asc")) {
					hql = "from Project order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
				}else {
					hql = "from Project order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Project where projectName like ? or projectState like ? or projectId like ? or employee.name like ?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Project where (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
				}else {
					log.info(" ordertype = "+params.getOrderType());
					hql = "from Project where (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		log.info("list size = "+query.list().size());
		return query.list();
	}

	@Override
	public int getCount(Params params) {
		String hql = "";
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			hql = "from Project";
		}else {
			hql = "from Project where projectName like ? or projectState like ? or projectId like ? or employee.name like ?";
		}
		Query query = getSession().createQuery(hql);
		if (params.getKeyword()!=null&&!(params.getKeyword().equals(""))) {
			query.setParameter(0, "%"+params.getKeyword()+"%");
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
			query.setParameter(3, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Project> getPorjectsByPageForUser(Params params,
			String employeeId) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Project where employee.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Project where employee.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}else {
					hql = "from Project where employee.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Project where (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) and employee.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
				query.setParameter(4, employeeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Project where employee.id=? and (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
					query.setParameter(4, "%"+params.getKeyword()+"%");
				}else {
					log.info(" ordertype = "+params.getOrderType());
					hql = "from Project where employee.id=? and (projectName like ? or projectState like ? or projectId like ? or employee.name like ?) order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
					query.setParameter(4, "%"+params.getKeyword()+"%");
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		log.info("list size = "+query.list().size());
		return query.list();
	}

	@Override
	public int getCountForUser(Params params, String employeeId) {
		String hql = "";
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			hql = "from Project where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			hql = "from Project where employee.id=? and (projectName like ? or projectState like ? or projectId like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
			query.setParameter(3, "%"+params.getKeyword()+"%");
		}
		
		return query.list().size();
	}

	@Override
	public Project getByName(String projectName) {
		String hql = "from Project where projectName=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, projectName);
		return (Project) query.uniqueResult();
	}
	@Override
	public int getAmountForProjectName(String projectName) {
		String hql ="select count(projectId) from Project where projectName=:proName";
		Query query = getSession().createQuery(hql);
		query.setParameter("proName", projectName);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public String getReviewIdByProjectId(String projectId) {
		// TODO Auto-generated method stub
		String hql = "from Project where projectId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, projectId);
		Project project = (Project)query.uniqueResult();
		Review review = project.getReview();
		return review.getReviewId().toString();
	}
}
