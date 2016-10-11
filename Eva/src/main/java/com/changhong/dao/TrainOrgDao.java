package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Trainorg;

public interface TrainOrgDao extends BaseDao<Trainorg>{

	//查询某个员工在某个时期内组织的培训的次数
	int getCount(String employeeId,Date startDate,Date endDate);
	
	List<Trainorg> getTrainorgsByEmployeeId(String employeeId,Date startDate,Date endDate);
	
	List<Trainorg> getTrainorgs(int trainId);
}
