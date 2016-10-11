package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.TrainDao;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Train;
import com.changhong.service.TrainService;
import com.changhong.util.Params;

@Service("trainService")
public class TrainServiceImpl implements TrainService{

	@Autowired
	private TrainDao trainDao;
	@Override
	public List<Train> getTrainsByPage(int offset, int length, String keyword) {
		// TODO Auto-generated method stub
		return trainDao.getTrainsByPage(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return trainDao.getCount(keyword);
	}

	@Override
	public void save(Train train) {
		trainDao.save(train);
	}

	@Override
	public void update(Train train) {
		trainDao.update(train);
	}

	@Override
	public void delete(Train train) {
		trainDao.delete(train);
	}

	@Override
	public Train getTrain(int trainId) {
		// TODO Auto-generated method stub
		return trainDao.get(Train.class, trainId);
	}

	@Override
	public Train saveAndGet(Train train) {
		// TODO Auto-generated method stub
		return trainDao.saveAndGet(train);
	}

	@Override
	public List<Employeetrainr> getEmployeetrainrsByEmployeeIdAndDate(
			String employeeId, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return trainDao.getTrainsByEmployeeIdAndDate(employeeId, startTime, endTime);
	}

	@Override
	public List<Employeetrainr> getTrainsByPageAndEmployeeId(int offset,
			int length, String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return trainDao.getTrainsByPageAndEmployeeId(offset, length, keyword, employeeId);
	}

	@Override
	public int getCount(String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return trainDao.getCountForEmployee(keyword, employeeId);
	}

	@Override
	public List<Train> getTrainsByPage(Params params) {
		// TODO Auto-generated method stub
		return trainDao.getTrainsByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return trainDao.getCount(params);
	}

	@Override
	public List<Employeetrainr> getTrainsByPageAndEmployeeId(Params params,
			String employeeId) {
		// TODO Auto-generated method stub
		return trainDao.getTrainsByPageAndEmployeeId(params, employeeId);
	}

	@Override
	public int getCount(Params params, String employeeId) {
		// TODO Auto-generated method stub
		return trainDao.getCountForEmployee(params, employeeId);
	}

	@Override
	public List<Train> getTrainsByTeacher(String employeeId, Date startDate,
			Date endDate) {
		// TODO Auto-generated method stub
		return trainDao.getExamsByTeacher(employeeId, startDate, endDate);
	}

}
