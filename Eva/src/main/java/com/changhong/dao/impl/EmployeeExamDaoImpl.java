package com.changhong.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.EmployeeExamDao;
import com.changhong.entities.Employeeexamr;
import com.changhong.util.Params;

@Repository("employeeExamDao")
public class EmployeeExamDaoImpl extends BaseDaoImpl<Employeeexamr> implements EmployeeExamDao{

	private static final Logger log = LoggerFactory.getLogger(EmployeeExamDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Employeeexamr> getMin(int examId) {
		String hql = "from Employeeexamr where score=(select min(score) from Employeeexamr  where exam.examId=?) ";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, examId);
		return query.list();
	}
	@Override
	public List<Employeeexamr> getMax(int examId) {
		String hql = "from Employeeexamr where score=(select max(score) from Employeeexamr  where exam.examId=?) ";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, examId);
		return query.list();
	}
	@Override
	public double getAvg(int examId) {
		String hql = "select avg(score) from Employeeexamr  where exam.examId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, examId);
		log.info("querylist.size = "+query.list().size()+" list 0 = "+query.list().get(0));
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
	public List<Employeeexamr> getEmployeeexamrsByPage(int offset, int length,
			String keyword,int examId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeexamr where exam.examId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, examId);
		}else {
			//"from Person p where p.project.id = :id")
		  //  .setParameter("id", projectId)
		  //  .list();
			String hql = "from Employeeexamr where employee.name=? and exam.examId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, keyword);
			query.setParameter(1, examId);
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCount(String keyword,int examId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeexamr where exam.examId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, examId);
		}else {
			String hql = "from Employeeexamr where employee.name=? and exam.examId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, keyword);
			query.setParameter(1, examId);
		}
		return query.list().size();
	}
	@Override
	public List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(int offset,
			int length, String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeexamr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			//"from Person p where p.project.id = :id")
		  //  .setParameter("id", projectId)
		  //  .list();
			String hql = "from Employeeexamr where exam.examName=? and employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, keyword);
			query.setParameter(1, employeeId);
		}
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}
	@Override
	public int getCount(String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeeexamr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			//"from Person p where p.project.id = :id")
		  //  .setParameter("id", projectId)
		  //  .list();
			String hql = "from Employeeexamr where exam.examName=? and employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, keyword);
			query.setParameter(1, employeeId);
		}
		return query.list().size();
	}
	@Override
	public Employeeexamr getEmployeeexamrByEmployeeIdAndExamId(int examId,
			String employeeId) {
		String hql = "from Employeeexamr where exam.examId=? and employee.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, examId);
		query.setParameter(1, employeeId);
		if (query.list().size()>0) {
			return (Employeeexamr) query.list().get(0);
		}else {
			return null;
		}
	}
	@Override
	public List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(
			Params params, String employeeId) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employeeexamr where employee.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeeexamr where employee.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}else {
					hql = "from Employeeexamr where employee.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employeeexamr where employee.id=? and (exam.examName like ? or exam.examContent like ? or exam.organizer like ? or exam.examLocation like ?)";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
				query.setParameter(4, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeeexamr where employee.id=? and (exam.examName like ? or exam.examContent like ? or exam.organizer like ? or exam.examLocation like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
					query.setParameter(4, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Employeeexamr where employee.id=? and (exam.examName like ? or exam.examContent like ? or exam.organizer like ? or exam.examLocation like ?) order by " +params.getOrderName() +" desc";
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
		return query.list();
	}
	@Override
	public int getCount(Params params, String employeeId) {
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			String hql = "from Employeeexamr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			//"from Person p where p.project.id = :id")
		  //  .setParameter("id", projectId)
		  //  .list();
			String hql = "from Employeeexamr where employee.id=? and (exam.examName like ? or exam.examContent like ? or exam.organizer like ? or exam.examLocation like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
			query.setParameter(3, "%"+params.getKeyword()+"%");
			query.setParameter(4, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}
	@Override
	public long getExisitCount(int examId, String employeeId) {
		String hql = "select count(employeeExamRid) from   Employeeexamr where employee.id=:employeeId and exam.examId=:examId ";
		Query query = getSession().createQuery(hql);
		query.setParameter("employeeId", employeeId);
		query.setParameter("examId", examId);
		return (Long)query.uniqueResult();
	}
	@Override
	public double getAvgByEmployeeId(String employeeId, Date startDate,
			Date endDate) {
		String hql = "select avg(score) from Employeeexamr  where employee.id=? and exam.examTime>=? and exam.examTime<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		log.info("querylist.size = "+query.list().size()+" list 0 = "+query.list().get(0));
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
}
