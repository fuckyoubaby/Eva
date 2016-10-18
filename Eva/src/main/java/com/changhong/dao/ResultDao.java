package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.RankObject;
import com.changhong.entities.Result;
import com.changhong.util.Params;

public interface ResultDao extends BaseDao<Result>{

	//根据overallid 取的数据   
	List<Result> getResultsByPageAndModeId(int offset,int length,int modeId);
	int getCountByModeId(int modeId);
	
	List<Result> getResultsByEmployeeIdAndDate(String employeeId);
	
	List<Result> getResultsByPageAndModeId(Params params,int modeId);
	int getCountByModeId(Params params,int modeId);
	
	double getAVG(String colName, int overallId);
	Result getMax(String colName, int voerallId);
	
	Result getResultByEmployeeIdAndOverallId(String employeeId,int overallId);
	
	
	void getResult();
	
}
