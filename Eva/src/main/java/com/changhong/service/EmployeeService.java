package com.changhong.service;

import java.util.List;

import com.changhong.entities.Employee;
import com.changhong.support.employee.EmployeeModel;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;

public interface EmployeeService {

	boolean isExist(String userName);
	Employee login(String userName,String password);
	List<Integer> getAllNum(int type,String employeeId);
	List<Employee> getAllEmployees();
	Employee getEmployee(String employeeId);
	List<Employee> getEmployeesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	
	List<Employee> getEmployeesByPage(Params params);
	int getCount(Params params);
	
	void update(Employee employee);
	void delete(Employee employee);
	void save(Employee employee);
	
	List<Employee> getEmployeesByJobId(int jobId);
	
	/**
	 * 批量添加
	 * @param employeeLists 批量添加对象
	 * @return
	 */
	public BatchResultTemplate save(List<Employee> employeeLists);
	/**
	 * 批量添加
	 * @param templateLists 批量添加EXCEL读出的模板对象
	 * @return
	 */
	public BatchResultTemplate saveTemplate(List<EmployeeModel> templateLists);
}
