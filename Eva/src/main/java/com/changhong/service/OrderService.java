package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Order;
import com.changhong.util.Params;

public interface OrderService {

	//获取某个员工在某段时期内的订单情况
	List<Order> getOrdersByEmployeeId(String employeeId,Date startDate,Date endDate);
	
	void save(Order order);
	void update(Order order);
	void delete(Order order);
	Order get(int id);
	
	List<Order> getOrdersByPage(Params params);
	int getCount(Params params);
}
