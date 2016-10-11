package com.changhong.service;

import java.util.List;

import com.changhong.entities.Secondlevelscore;

public interface SecondLevelScoreService {

	List<Secondlevelscore> getSecondlevelscoresByModeId(int modeId);
	List<Secondlevelscore> getSecondlevelscoresByEmployeeId(String employeeId);
	List<Secondlevelscore> getSecondlevelscoresByModeIdAndEmployeeId(int modeId,String employeeId);
	void save(Secondlevelscore secondlevelscore);
	void delete(Secondlevelscore secondlevelscore);
	void update(Secondlevelscore secondlevelscore);
	
	double getAvg(String type,int overallId);
	List<Secondlevelscore> getSecondlevelscoresByOverallIdAndEmployeeId(String employeeId,int overallId);
}
