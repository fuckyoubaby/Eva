package com.changhong.service;

import java.util.List;

import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.util.Params;

public interface EmployeeProjectRService {

	void save(Employeeprojectr employeeprojectr);
	void delete(Employeeprojectr employeeprojectr);
	
	/**
	 * 通过员工编号和项目编号删除项目成员
	 * @param empId
	 * @param projectId
	 * @return
	 */
	boolean delete(String empId,String projectId);
	void update(Employeeprojectr employeeprojectr);
	List<Employeeprojectr> getEmployeeprojectrsByProjectId(String projectId);
	/**
	 * 通过项目ID获取参与的项目成员
	 * @param projectId 项目Id 
	 * @return
	 */
	List<Employee> getEmployeeByProjectId(String projectId);
	
	List<Employeeprojectr> getEmployeeprojectrsByPageFouUser(int offset,int length,String keyword,String employeeId);
	int getCountForUser(String keyword,String employeeId);
	
	List<Employeeprojectr> getEmployeeprojectrsByPageFouUser(Params params,String employeeId);
	int getCountForUser(Params params,String employeeId);
	
	List<Employeeprojectr> getEmployeeprojectrsByemployeeId(String projectId,String employeeId);
	
	/**
	 * 获取参与指定项目的特定员工的评审项（电路+项目）数量
	 * @param empId
	 * @param projectId
	 * @return
	 */
	int getReviewItemsAmount(String empId,String projectId);
}
