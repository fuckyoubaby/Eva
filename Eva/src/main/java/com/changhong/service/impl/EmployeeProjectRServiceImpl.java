package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.EmployeeProjectRDao;
import com.changhong.dao.ProblemDao;
import com.changhong.dao.ProjectReviewDao;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.util.Params;

@Service("employeeProjectRService")
public class EmployeeProjectRServiceImpl implements EmployeeProjectRService{

	@Autowired
	private EmployeeProjectRDao employeeProjectRDao;
	
	@Autowired
	private ProjectReviewDao projectReviewDao;
	
	@Autowired
	private ProblemDao problemDao;

	@Override
	public void save(Employeeprojectr employeeprojectr) {
		employeeProjectRDao.save(employeeprojectr);
	}

	@Override
	public void delete(Employeeprojectr employeeprojectr) {
		employeeProjectRDao.delete(employeeprojectr);		
	}

	@Override
	public void update(Employeeprojectr employeeprojectr) {
		employeeProjectRDao.update(employeeprojectr);
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByProjectId(
			String projectId) {
		
		return employeeProjectRDao.getEmployeeprojectrsByProjectId(projectId);
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByPageFouUser(int offset,
			int length, String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return employeeProjectRDao.gETEmployeeprojectrsByPageAndEmployeeId(offset, length, keyword, employeeId);
	}

	@Override
	public int getCountForUser(String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return employeeProjectRDao.getCountForUser(keyword, employeeId);
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByPageFouUser(
			Params params, String employeeId) {
		// TODO Auto-generated method stub
		return employeeProjectRDao.getEmployeeprojectrsByPageAndEmployeeId(params, employeeId);
	}

	@Override
	public int getCountForUser(Params params, String employeeId) {
		return employeeProjectRDao.getCountForUser(params, employeeId);
	}

	@Override
	public List<Employee> getEmployeeByProjectId(String projectId) {
		return employeeProjectRDao.getEmployeeByProjectId(projectId);
	}

	@Override
	public List<Employeeprojectr> getEmployeeprojectrsByemployeeId(
			String projectId, String employeeId) {
		// TODO Auto-generated method stub
		return employeeProjectRDao.getEmployeeprojectrsByemployeeId(projectId, employeeId);
	}
	
	@Override
	public boolean delete(String empId, String projectId) {
		if(getReviewItemsAmount(empId, projectId)>0){
			return false;
		}
		int amount = employeeProjectRDao.delete(empId,projectId);
		if(amount!=-1) return true;
		return false;
	}

	@Override
	public int getReviewItemsAmount(String empId, String projectId) {
		int amount = 0;
		amount += problemDao.getProblemAmountByProAndEmp(empId, projectId);
		amount += projectReviewDao.getAmountByEmpAndProject(empId, projectId);
		return amount;
	}
	
}
