package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.DepartmentDao;
import com.changhong.entities.Department;
import com.changhong.service.DepartmentService;

@Service("departmentService")
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	private DepartmentDao departmentDao;
	
	@Override
	public List<Department> getAllList() {
		// TODO Auto-generated method stub
		return departmentDao.findAll(Department.class);
	}

	@Override
	public Department getDepartment(int id) {
		// TODO Auto-generated method stub
		return departmentDao.get(Department.class, id);
	}

}
