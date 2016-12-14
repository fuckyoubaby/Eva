package com.changhong.dao;


import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Employee;
import com.changhong.util.Params;

public interface EmployeeDao extends BaseDao<Employee>{

	boolean isExist(String userName);
	Employee login(String userName,String password);
	List<Integer> getAllNum(int type,String employeeId);
	List<Employee> getAll();
	List<Employee> getEmployeesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	
	
	List<Employee> getEmployeesByPage(Params params);
	int getCount(Params params);
	
	List<Employee> getEmployeesByJobId(int jobId);
	/**
	 * 通过员工姓名获取员工对象
	 * @param employeeName
	 * @return
	 */
	List<Employee> getByName(String employeeName);
}
