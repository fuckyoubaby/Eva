package com.changhong.dao.impl;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.SessionFactoryUtils;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.EmployeeDao;
import com.changhong.entities.Employee;
import com.changhong.util.Params;

@Repository("employeeDao")
public class EmployeeDaoImpl extends BaseDaoImpl<Employee> implements EmployeeDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public boolean isExist(String userName) {
		String hql = "from Employee where id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, userName);
		if (query.list().size()>0) {
			return true;
		}else {
			return false;
		}
	}

	@Override
	public Employee login(String userName, String password) {
		String hql = "from Employee where id=? and password=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, userName);
		query.setParameter(1, password);
		if (query.list().size()>0) {
			return (Employee) query.list().get(0);
		}else
		{
			return null;
		}
		
	}
	@Override
	public List<Integer> getAllNum(int type,String employeeId) {
		CallableStatement proc = null; 
		List<Integer> list = new ArrayList<Integer>();
		try {
			if (type==0) {
				
				String hql = "{Call admin_sort_num(?,?,?,?)}";
				Connection conn = SessionFactoryUtils.getDataSource(sessionFactory).getConnection();
				proc = conn.prepareCall(hql);
				
				proc.registerOutParameter(1, java.sql.Types.INTEGER);
				proc.registerOutParameter(2, java.sql.Types.INTEGER);
				proc.registerOutParameter(3, java.sql.Types.INTEGER);
				proc.registerOutParameter(4, java.sql.Types.INTEGER);
				proc.execute();
				//result.put("name", proc.getString(1));
	            //result.put("age", proc.getString(2));
				
				
				list.add(proc.getInt(1));
				list.add(proc.getInt(2));
				list.add(proc.getInt(3));
				list.add(proc.getInt(4));
			}else if(type==1)
			{
				String hql = "{Call employee_sorts_num(?,?,?,?)}";
				Connection conn = SessionFactoryUtils.getDataSource(sessionFactory).getConnection();
				proc = conn.prepareCall(hql);
				
				proc.setObject(1, employeeId);
				proc.registerOutParameter(2, java.sql.Types.INTEGER);
				proc.registerOutParameter(3, java.sql.Types.INTEGER);
				proc.registerOutParameter(4, java.sql.Types.INTEGER);
				proc.execute();
				
				
				
				list.add(proc.getInt(2));
				list.add(proc.getInt(3));
				list.add(proc.getInt(4));	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	@Override
	public List<Employee> getEmployeesByPage(int offset, int length,
			String keyword) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employee";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Employee where name like ? or id like ?";
			query=getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCount(String keyword) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employee";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Employee where name like ? or id like ?";
			query=getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
		}
		return query.list().size();
	}
	@Override
	public List<Employee> getEmployeesByPage(Params params) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employee";
				query = getSession().createQuery(hql);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employee order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
				}else {
					hql = "from Employee order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employee where name like ? or id like ? or job.jobName like ?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employee where (name like ? or id like ? or job.jobName like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Employee where (name like ? or id like ? or job.jobName like ?) order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
				}
				
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}
	@Override
	public int getCount(Params params) {
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			String hql = "from Employee";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Employee where name like ? or id like ?  or job.jobName like ?";
			query=getSession().createQuery(hql);
			query.setParameter(0, "%"+params.getKeyword()+"%");
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}
	@Override
	public List<Employee> getEmployeesByJobId(int jobId) {
		String hql = "from Employee where job.jobId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, jobId);
		return query.list();
	}
	@Override
	public List<Employee> getByName(String employeeName) {
		String hql = "from Employee where name=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeName);
		return query.list();
	}

}
