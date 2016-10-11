package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Trainorg;

public interface TrainOrgService {

	//查询某个员工在某个时期内组织的培训的次数
	int getCount(String employeeId,Date startDate,Date endDate);
	
	List<Trainorg> getTrainorgsByEmployeeId(String employeeId,Date startDate,Date endDate);
	
	void save(Trainorg trainorg);
	void update(Trainorg trainorg);
	void delete(Trainorg trainorg);
	
	List<Trainorg> getTrainorgs(int trainId);
}
