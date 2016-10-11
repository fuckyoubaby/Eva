package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.util.Params;

public interface EmployeeProjectRDao extends BaseDao<Employeeprojectr>{
	List<Employeeprojectr> getEmployeeprojectrsByProjectId(String projectId);
	List<Employeeprojectr> gETEmployeeprojectrsByPageAndEmployeeId(int offset,int length,String keyword, String employeeId);
	int getCountForUser(String keyword,String employeeId);
	
	
	List<Employeeprojectr> getEmployeeprojectrsByPageAndEmployeeId(Params params, String employeeId);
	int getCountForUser(Params params ,String employeeId);
	
	/**
	 * 通过员工ID和项目ID获取相应的EmployeeProjectR对象数量
	 * @param projectId 项目ID
	 * @param employeeId 员工ID
	 * @return
	 */
	int getCountByProjectAndEmployee(String projectId, String employeeId);
	
	/**
	 * 通过项目ID获取参与的员工对象链表
	 * @param projectId
	 * @return
	 */
	List<Employee> getEmployeeByProjectId(String projectId);
	
	List<Employeeprojectr> getEmployeeprojectrsByemployeeId(String projectId,String employeeId);
	
	/**
	 * 删除项目ID相关联的员工参与列表
	 * @param projectId
	 */
	void deleteByProjectId(String projectId);
	/**
	 * 删除指定的醒目的员工参与关联
	 * @param empId
	 * @param projectId
	 */
	int delete(String empId, String projectId);
}
