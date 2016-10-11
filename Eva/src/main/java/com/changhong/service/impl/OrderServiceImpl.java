package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.OrderDao;
import com.changhong.entities.Order;
import com.changhong.service.OrderService;
import com.changhong.util.Params;

@Service("orderService")
public class OrderServiceImpl implements OrderService{

	@Autowired
	private OrderDao orderDao;
	@Override
	public List<Order> getOrdersByEmployeeId(String employeeId, Date startDate,
			Date endDate) {
		// TODO Auto-generated method stub
		return orderDao.getOrdersByEmployeeId(employeeId, startDate, endDate);
	}
	@Override
	public void save(Order order) {
		// TODO Auto-generated method stub
		orderDao.save(order);
	}
	@Override
	public void update(Order order) {
		orderDao.update(order);
	}
	@Override
	public void delete(Order order) {
		orderDao.delete(order);
	}
	@Override
	public List<Order> getOrdersByPage(Params params) {
		// TODO Auto-generated method stub
		return orderDao.getOrdersByPage(params);
	}
	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return orderDao.getCount(params);
	}
	@Override
	public Order get(int id) {
		// TODO Auto-generated method stub
		return orderDao.get(Order.class, id);
	}

}
