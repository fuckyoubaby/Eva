package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.TrainOrgDao;
import com.changhong.entities.Trainorg;
import com.changhong.service.TrainOrgService;

@Service("trainOrgService")
public class TrainOrgServiceImpl implements  TrainOrgService{

	@Autowired
	private TrainOrgDao trainOrgDao;
	@Override
	public int getCount(String employeeId, Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return trainOrgDao.getCount(employeeId, startDate, endDate);
	}
	@Override
	public void save(Trainorg trainorg) {
		trainOrgDao.save(trainorg);
	}
	@Override
	public void update(Trainorg trainorg) {
		trainOrgDao.update(trainorg);
	}
	@Override
	public void delete(Trainorg trainorg) {
		trainOrgDao.delete(trainorg);
	}
	@Override
	public List<Trainorg> getTrainorgs(int trainId) {
		// TODO Auto-generated method stub
		return trainOrgDao.getTrainorgs(trainId);
	}
	@Override
	public List<Trainorg> getTrainorgsByEmployeeId(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return trainOrgDao.getTrainorgsByEmployeeId(employeeId, startDate, endDate);
	}

}
