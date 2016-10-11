package com.changhong.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ExamDao;
import com.changhong.entities.Exam;
import com.changhong.util.Params;

@Repository("examDao")
public class ExamDaoImpl extends BaseDaoImpl<Exam> implements ExamDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Exam> getExamsByPages(int offset, int length, String keyword) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Exam";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Exam where examName like ? or examContent like ? or organizer like ? or examLocation like ?";
			query=getSession().createQuery(hql);
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
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Exam";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Exam where examName like ? or examContent like ? or organizer like ? or examLocation like ?";
			query=getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Exam> getExamsByPages(Params params) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Exam";
				query = getSession().createQuery(hql);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Exam order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
				}else {
					hql = "from Exam order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Exam where examName like ? or examContent like ? or organizer like ? or examLocation like ?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Exam where (examName like ? or examContent like ? or organizer like ? or examLocation like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Exam where (examName like ? or examContent like ? or organizer like ? or examLocation like ?) order by " +params.getOrderName() +" desc";
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
		return query.list();
	}

	@Override
	public int getCount(Params params) {
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			String hql = "from Exam";
			query=getSession().createQuery(hql);
		}else {
			String hql = "from Exam where examName like ? or examContent like ? or organizer like ? or examLocation like ?";
			query=getSession().createQuery(hql);
			query.setParameter(0, "%"+params.getKeyword()+"%");
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
			query.setParameter(3, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}
}
