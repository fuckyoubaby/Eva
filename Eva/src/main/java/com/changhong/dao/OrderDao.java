package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Order;
import com.changhong.util.Params;

public interface OrderDao extends BaseDao<Order>{

	//获取某个员工在某段时期内的订单情况
	List<Order> getOrdersByEmployeeId(String employeeId,Date startDate,Date endDate);
	List<Order> getOrdersByPage(Params params);
	int getCount(Params params);
}
