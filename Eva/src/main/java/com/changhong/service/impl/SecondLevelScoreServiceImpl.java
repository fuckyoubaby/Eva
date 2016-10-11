package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;

import com.changhong.dao.SecondLevelScoreDao;
import com.changhong.entities.Secondlevelscore;
import com.changhong.service.SecondLevelScoreService;

@Service("secondLevelScoreService")
public class SecondLevelScoreServiceImpl implements SecondLevelScoreService{

	@Autowired
	private SecondLevelScoreDao secondLevelScoreDao;
	@Override
	public List<Secondlevelscore> getSecondlevelscoresByModeId(int modeId) {
		// TODO Auto-generated method stub
		return secondLevelScoreDao.getSecondlevelscoresByModeId(modeId);
	}

	@Override
	public List<Secondlevelscore> getSecondlevelscoresByEmployeeId(
			String employeeId) {
		// TODO Auto-generated method stub
		return secondLevelScoreDao.getSecondlevelscoresByEmployeeId(employeeId);
	}

	@Override
	public List<Secondlevelscore> getSecondlevelscoresByModeIdAndEmployeeId(
			int modeId, String employeeId) {
		// TODO Auto-generated method stub
		return secondLevelScoreDao.getSecondlevelscoresByModeIdAndEmployeeId(modeId, employeeId);
	}

	@Override
	@org.springframework.transaction.annotation.Transactional(propagation = Propagation.REQUIRED)
	public void save(Secondlevelscore secondlevelscore) {
		secondLevelScoreDao.save(secondlevelscore);
	}

	@Override
	public void delete(Secondlevelscore secondlevelscore) {
		secondLevelScoreDao.delete(secondlevelscore);
	}

	@Override
	public void update(Secondlevelscore secondlevelscore) {
		secondLevelScoreDao.update(secondlevelscore);
	}

	@Override
	public double getAvg(String type, int overallId) {
		// TODO Auto-generated method stub
		return secondLevelScoreDao.getAvg(type, overallId);
	}

	@Override
	public List<Secondlevelscore> getSecondlevelscoresByOverallIdAndEmployeeId(
			String employeeId, int overallId) {
		// TODO Auto-generated method stub
		return secondLevelScoreDao.getSecondlevelscoresByOverallIdAndEmployeeId(employeeId, overallId);
	}

}
