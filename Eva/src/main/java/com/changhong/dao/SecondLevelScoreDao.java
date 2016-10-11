package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Secondlevelscore;

public interface SecondLevelScoreDao extends BaseDao<Secondlevelscore>{

	List<Secondlevelscore> getSecondlevelscoresByModeId(int modeId);
	List<Secondlevelscore> getSecondlevelscoresByEmployeeId(String employeeId);
	List<Secondlevelscore> getSecondlevelscoresByModeIdAndEmployeeId(int modeId,String employeeId);
	
	double getAvg(String type,int overallId);
	List<Secondlevelscore> getSecondlevelscoresByOverallIdAndEmployeeId(String employeeId,int overallId);
	
	
}
