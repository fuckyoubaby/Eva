package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Train;
import com.changhong.util.Params;

public interface TrainDao extends BaseDao<Train>{
	List<Train> getTrainsByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	Train saveAndGet(Train train);
	
	List<Employeetrainr> getTrainsByEmployeeIdAndDate(String employeeId, Date startTime,Date endTime);
	
	List<Employeetrainr> getTrainsByPageAndEmployeeId(int offset,int length,String keyword, String employeeId);
	int getCountForEmployee(String keyword,String employeeId);
	
	List<Train> getTrainsByPage(Params params);
	int getCount(Params params);
	
	List<Employeetrainr> getTrainsByPageAndEmployeeId(Params params, String employeeId);
	int getCountForEmployee(Params params,String employeeId);
	
	List<Train> getExamsByTeacher(String employeeId,Date startDate,Date endDate);
}
