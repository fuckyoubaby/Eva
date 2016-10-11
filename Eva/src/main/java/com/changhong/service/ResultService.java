package com.changhong.service;

import java.util.List;

import com.changhong.entities.Result;
import com.changhong.util.Params;

public interface ResultService {

	void save(Result result);
	void delete(Result result);
	void update(Result result);
	
	List<Result> getResultsByPageAndModeId(int offset,int length,int modeId);
	int getCountByModeId(int modeId);
	
	
	List<Result> getResultsByEmployeeIdAndDate(String employeeId);
	
	List<Result> getResultsByPageAndModeId(Params params,int modeId);
	int getCountByModeId(Params params,int modeId);
	
	Result getResultById(int resultId);
	
	double getAVG(String colName,int overallId);
	Result getMax(String colName,int overallId);
	
	Result getResultByEmployeeIdAndOverallId(String employeeId,int overallId);
}
