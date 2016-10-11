package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Train;
import com.changhong.util.Params;

public interface TrainService {

	List<Train> getTrainsByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	void save(Train train);
	void update(Train train);
	void delete(Train train);
	Train getTrain(int trainId);
	Train saveAndGet(Train train);
	
	List<Employeetrainr> getEmployeetrainrsByEmployeeIdAndDate(String employeeId,Date startTime,Date endTime);
	
	List<Employeetrainr> getTrainsByPageAndEmployeeId(int offset, int length,String keyword,String employeeId);
	int getCount(String keyword,String employeeId);
	
	List<Train> getTrainsByPage(Params params);
	int getCount(Params params);
	
	
	List<Employeetrainr> getTrainsByPageAndEmployeeId(Params params,String employeeId);
	int getCount(Params params,String employeeId);
	
	List<Train> getTrainsByTeacher(String employeeId,Date startDate,Date endDate);
	
}
