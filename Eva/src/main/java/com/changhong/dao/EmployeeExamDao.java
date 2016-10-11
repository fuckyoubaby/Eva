package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Employeeexamr;
import com.changhong.util.Params;

public interface EmployeeExamDao extends BaseDao<Employeeexamr>{

	List<Employeeexamr> getMin(int examId);
	List<Employeeexamr> getMax(int examId);
	double getAvg(int examId);
	
	List<Employeeexamr> getEmployeeexamrsByPage(int offset,int length,String keyword,int examId);
	int getCount(String keyword,int examId);
	
	List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(int offset, int length,String keyword,String employeeId);
	int getCount(String keyword,String employeeId);
	
	Employeeexamr getEmployeeexamrByEmployeeIdAndExamId(int examId, String employeeId);
	
	
	List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(Params params,String employeeId);
	int getCount(Params params,String employeeId);
	
	
	long getExisitCount(int examId,String employeeId);
	
	double getAvgByEmployeeId(String employeeId,Date startDate, Date endDate);
}
