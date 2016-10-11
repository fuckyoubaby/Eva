package com.changhong.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.TrainDao;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Exam;
import com.changhong.entities.Train;
import com.changhong.util.Params;

@Repository("trainDao")
public class TrainDaoImpl extends BaseDaoImpl<Train> implements TrainDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Train> getTrainsByPage(int offset, int length, String keyword) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Train";
			query = getSession().createQuery(hql);
		}else {
			String hql = "from Train where information like ? or teacher like ? or trainContent like ? or trainName like ?";
			query = getSession().createQuery(hql);
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
			String hql = "from Train";
			query = getSession().createQuery(hql);
		}else {
			String hql = "from Train where information like ? or teacher like ? or trainContent like ? or trainName like ?";
			query = getSession().createQuery(hql);
			query.setParameter(0, "%"+keyword+"%");
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
		}
		return query.list().size();
	}

	@Override
	public Train saveAndGet(Train train) {
		save(train);
		String hql = "from Train where information=? or teacher=? or trainContent=? or trainName=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, train.getInformation());
		query.setParameter(1,train.getTeacher());
		query.setParameter(2, train.getTrainContent());
		query.setParameter(3, train.getTrainName());
		if (query.list().size()>0) {
			return (Train) query.list().get(0);
		}else {
			return null;
		}
		
	}

	@Override
	public List<Employeetrainr> getTrainsByEmployeeIdAndDate(String employeeId,
			Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		String hql = "from Employeetrainr where employee.id=? and train.trainTime>=? and train.trainTime<=?";
		Query query = getSession().createQuery(hql);
		
		query.setParameter(0, employeeId);
		query.setParameter(1, startTime);
		query.setParameter(2, endTime);
		return query.list();
	}

	@Override
	public List<Employeetrainr> getTrainsByPageAndEmployeeId(int offset,
			int length, String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeetrainr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
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
	public int getCountForEmployee(String keyword, String employeeId) {
		Query query = null;
		if (keyword==null||keyword.equals("")) {
			String hql = "from Employeetrainr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?)";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setParameter(1, "%"+keyword+"%");
			query.setParameter(2, "%"+keyword+"%");
			query.setParameter(3, "%"+keyword+"%");
			query.setParameter(4, "%"+keyword+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Train> getTrainsByPage(Params params) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Train";
				query = getSession().createQuery(hql);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Train order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
				}else {
					hql = "from Train order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Train where information like ? or teacher like ? or trainContent like ? or trainName like ?";
				query = getSession().createQuery(hql);
				query.setParameter(0, "%"+params.getKeyword()+"%");
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Train where (information like ? or teacher like ? or trainContent like ? or trainName like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, "%"+params.getKeyword()+"%");
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Train where (information like ? or teacher like ? or trainContent like ? or trainName like ?) order by " +params.getOrderName() +" desc";
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
			String hql = "from Train";
			query = getSession().createQuery(hql);
		}else {
			String hql = "from Train where information like ? or teacher like ? or trainContent like ? or trainName like ?";
			query = getSession().createQuery(hql);
			query.setParameter(0, "%"+params.getKeyword()+"%");
			query.setParameter(1, "%"+params.getKeyword()+"%");
			query.setParameter(2, "%"+params.getKeyword()+"%");
			query.setParameter(3, "%"+params.getKeyword()+"%");
		}
		return query.list().size();
	}

	@Override
	public List<Employeetrainr> getTrainsByPageAndEmployeeId(Params params,
			String employeeId) {
		Query query = null;
		String hql = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employeetrainr where employee.id=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeetrainr where employee.id=? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}else {
					hql = "from Employeetrainr where employee.id=? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
				}
				
			}/// username  username or 1=1;  :=id    set("id",value);
		}else {
			if (params.getOrderName()==null||params.getOrderName().equals("")) {
				hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?)";
				query = getSession().createQuery(hql);
				query.setParameter(0, employeeId);
				query.setParameter(1, "%"+params.getKeyword()+"%");
				query.setParameter(2, "%"+params.getKeyword()+"%");
				query.setParameter(3, "%"+params.getKeyword()+"%");
				query.setParameter(4, "%"+params.getKeyword()+"%");
			}else {
				if (params.getOrderType().equals("asc")) {
					hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?) order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, employeeId);
					query.setParameter(1, "%"+params.getKeyword()+"%");
					query.setParameter(2, "%"+params.getKeyword()+"%");
					query.setParameter(3, "%"+params.getKeyword()+"%");
					query.setParameter(4, "%"+params.getKeyword()+"%");
				}else {
					hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?) order by " +params.getOrderName() +" desc";
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
	public int getCountForEmployee(Params params, String employeeId) {
		Query query = null;
		if (params.getKeyword()==null||params.getKeyword().equals("")) {
			String hql = "from Employeetrainr where employee.id=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
		}else {
			String hql = "from Employeetrainr where employee.id=? and (train.information like ? or train.trainName like ? or train.trainContent like ? or train.teacher like ?)";
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
	public List<Train> getExamsByTeacher(String employeeId, Date startDate,
			Date endDate) {
		String hql = "from Train where employee.id=? and trainTime>=? and trainTime<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list();
	}
}
