package com.changhong.service;

import java.util.List;

import com.changhong.entities.Department;

public interface DepartmentService {

	List<Department> getAllList();
	Department getDepartment(int id);
}
