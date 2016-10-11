package com.changhong.service;

import java.util.List;

import com.changhong.entities.Employeetrainr;

public interface EmployeeTrainService {

	void save(Employeetrainr employeetrainr);
	void delete(Employeetrainr employeetrainr);
	void update(Employeetrainr employeetrainr);
	
	List<Employeetrainr> getEmployeetrainrsByTrainId(int trainId);
}
