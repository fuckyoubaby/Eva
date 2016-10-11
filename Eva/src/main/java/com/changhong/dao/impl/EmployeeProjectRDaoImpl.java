package com.changhong.dao.impl;

import java.util.List;

import javassist.compiler.ast.Keyword;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.EmployeeProjectRDao;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.entities.Project;
import com.changhong.util.Params;
import com.opensymphony.xwork2.util.Key;

@Repository("employeeProjectRDao")
public class EmployeeProjectRDaoImpl extends BaseDaoImpl<Employeeprojectr> implements EmployeeProjectRDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByProjectId(
			String projectId) {
		String hql = "from Employeeprojectr where project.projectId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, projectId);
		return query.list();
	}

	@Override
	public List<Employeeprojectr> gETEmployeeprojectrsByPageAndEmployeeId(
			int offset, int length, String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeprojectr where employee.id=?";
			
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeeprojectr where employee.id=? and (project.projectName like ? or project.introduction like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	@Override
	public int getCountForUser(String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeprojectr where employee.id=?";
			
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeeprojectr where employee.id=? and (project.projectName like ? or project.introduction like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByPageAndEmployeeId(
			Params params, String employeeId) {
		Query query = null;
		String hql = null;
		System.out.println("AAAAAAAAAAA keyword = "+params.getKeyword());
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employeeprojectr where employee.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeeprojectr where employee.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}else {
					hql = "from Employeeprojectr where employee.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			System.out.println("BBBBBBBBBBBBBBBBB keyword = "+params.getKeyword()+" employee = "+employeeId);
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				//hql = "from Employeeprojectr where employee.id=? and (project.projectName like ? or project.introduction like ?)";
				hql = "from Employeeprojectr where employee.id=? and project.projectName like ? ";
				query = getSession().createQuery(hql);
				query.setParameter(1, "%"+params.getKeyword()+"%");
				//query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(0, employeeId);
				System.out.println(query.list().size());
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeeprojectr where employee.id=? and project.projectName like ? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					//query.setParameter(2, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Employeeprojectr where employee.id=? and project.projectName like ? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					//query.setParameter(2, "%"+params.getKeyword()+"%");
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}

	@Override
	public int getCountForUser(Params params, String employeeId) {
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			String hql = "from Employeeprojectr where employee.id=?";
			
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeeprojectr where employee.id=? and project.projectName like ?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+params.getKeyword()+"%");
			//query.setParameter(2, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}

	@Override
	public int getCountByProjectAndEmployee(String projectId, String employeeId) {
		String hql = "select count(model.employeeProjectRid) from Employeeprojectr as model where model.project.projectId=:projectId and model.employee.id=:employeeId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("employeeId", employeeId);
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public List<Employee> getEmployeeByProjectId(String projectId) {
		String hql ="select model.employee from Employeeprojectr as model where model.project.projectId=:projectId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		return query.list();
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByemployeeId(
			String projectId, String employeeId) {
		String hql = "from Employeeprojectr as model where model.project.projectId=:projectId and model.employee.id=:employeeId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("employeeId", employeeId);
		return query.list();
	}
	
	@Override
	public void deleteByProjectId(String projectId) {
		String hql = "delete from Employeeprojectr as model where model.project.projectId=:projectId";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.executeUpdate();
	}

	@Override
	public int delete(String empId, String projectId) {
		String hql = "delete from Employeeprojectr as model where model.project.projectId=:projectId and model.employee.id=:empId";
		try{
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("empId", empId);
		return query.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
	}
}
