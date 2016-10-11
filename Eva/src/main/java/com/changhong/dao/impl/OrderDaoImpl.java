package com.changhong.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.OrderDao;
import com.changhong.entities.Order;
import com.changhong.util.Params;

@Repository("orderDao")
public class OrderDaoImpl extends BaseDaoImpl<Order> implements OrderDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<Order> getOrdersByEmployeeId(String employeeId, Date startDate,
			Date endDate) {
		String hql = "from Order where employee.id=? and date>=? and date<= ?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startDate);
		query.setParameter(2, endDate);
		return query.list();
	}
	@Override
	public List<Order> getOrdersByPage(Params params) {
		String hql = null;
		Query query = null;
		if (params.getOrderName()==null||params.getOrderName().equals("")) {
			hql = "from Order";
		}else {
			if (params.getOrderType().equals("asc")) {
				hql = "from Order order by "+params.getOrderName()+" asc";
			}else {
				hql = "from Order order by "+params.getOrderName()+" desc";
			}
		}
		query = getSession().createQuery(hql);
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}
	@Override
	public int getCount(Params params) {
		String hql = "from Order";
		Query query = getSession().createQuery(hql);
		return query.list().size();
	}

}
