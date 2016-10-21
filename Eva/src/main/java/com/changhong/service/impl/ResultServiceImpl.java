package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ResultDao;
import com.changhong.entities.Result;
import com.changhong.service.ResultService;
import com.changhong.util.Params;

@Service("resultService")
public class ResultServiceImpl implements ResultService{

	@Autowired
	private ResultDao resultDao;
	@Override
	public void save(Result result) {
		resultDao.save(result);
	}

	@Override
	public void delete(Result result) {
		resultDao.delete(result);
	}

	@Override
	public void update(Result result) {
		resultDao.update(result);
	}

	@Override
	public List<Result> getResultsByPageAndModeId(int offset, int length,
			int modeId) {
		// TODO Auto-generated method stub
		return resultDao.getResultsByPageAndModeId(offset, length, modeId);
	}

	@Override
	public int getCountByModeId(int modeId) {
		// TODO Auto-generated method stub
		return resultDao.getCountByModeId(modeId);
	}

	@Override
	public List<Result> getResultsByEmployeeIdAndDate(String employeeId) {
		// TODO Auto-generated method stub
		return resultDao.getResultsByEmployeeIdAndDate(employeeId);
	}

	@Override
	public List<Result> getResultsByPageAndModeId(Params params, int modeId) {
		// TODO Auto-generated method stub
		return resultDao.getResultsByPageAndModeId(params, modeId);
	}

	@Override
	public int getCountByModeId(Params params, int modeId) {
		// TODO Auto-generated method stub
		return resultDao.getCountByModeId(params, modeId);
	}

	@Override
	public Result getResultById(int resultId) {
		// TODO Auto-generated method stub
		return resultDao.get(Result.class, resultId);
	}

	@Override
	public double getAVG(String colName, int overallId) {
		// TODO Auto-generated method stub
		return resultDao.getAVG(colName, overallId);
	}

	@Override
	public Result getMax(String colName, int overallId) {
		// TODO Auto-generated method stub
		return resultDao.getMax(colName, overallId);
	}

	@Override
	public Result getResultByEmployeeIdAndOverallId(String employeeId,
			int overallId) {
		// TODO Auto-generated method stub
		return resultDao.getResultByEmployeeIdAndOverallId(employeeId, overallId);
	}

	@Override
	public List<Result> getResultsRankByCol(int overallId, Params params) {
		// TODO Auto-generated method stub
		return resultDao.getResultsRankByCol(overallId, params);
	}

}
