package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.EmployeeTrainDao;
import com.changhong.entities.Employeetrainr;
import com.changhong.service.EmployeeTrainService;

@Service("employeeTrainService")
public class EmployeeTrainServiceImpl implements EmployeeTrainService{

	@Autowired
	private EmployeeTrainDao employeeTrainDao;
	@Override
	public void save(Employeetrainr employeetrainr) {
		employeeTrainDao.save(employeetrainr);
	}

	@Override
	public void delete(Employeetrainr employeetrainr) {
		employeeTrainDao.delete(employeetrainr);
	}

	@Override
	public void update(Employeetrainr employeetrainr) {
		employeeTrainDao.update(employeetrainr);
	}

	@Override
	public List<Employeetrainr> getEmployeetrainrsByTrainId(int trainId) {
		// TODO Auto-generated method stub
		return employeeTrainDao.getEmployeetrainrsByTrainId(trainId);
	}

}
