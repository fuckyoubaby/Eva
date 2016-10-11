package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Employeeexamr;
import com.changhong.support.exam.ExamScoreModel;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;

public interface EmployeeExamService {
	List<Employeeexamr> getMin(int examId);
	List<Employeeexamr> getMax(int examId);
	double getAvg(int examId);
	void save(Employeeexamr employeeexamr);
	void delete(Employeeexamr employeeexamr);
	void update(Employeeexamr employeeexamr);
	List<Employeeexamr> getEmployeeexamrsByPages(int offset,int length,String keyword,int examId);
	int getCount(String keyword,int examId);
	Employeeexamr getEmployeeexamrById(int employeeExamId);
	
	
	List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(int offset,int length,String keyword,String employeeId);
	int getCountForEmployee(String keyword,String employeeId);
	
	Employeeexamr getEmployeeexamrByEmployeeIdAndExamId(int examId,String employeeId);
	
	List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(Params params,String employeeId);
	int getCountForEmployee(Params params,String employeeId);
	
	/**
	 * 批量添加
	 * @param employeeExamrLists 批量添加对象
	 * @return
	 */
	public BatchResultTemplate saveTemplate(List<Employeeexamr> employeeExamrLists);
	
	
	/**
	 * 批量添加
	 * @param templateLists 批量添加EXCEL读出的模板对象
	 * @param examId 考试Id
	 * @return
	 */
	public BatchResultTemplate saveTemplate(List<ExamScoreModel> templateLists, int examId);
	
	double getAvgByEmployeeId(String employeeId,Date startDate, Date endDate);
}
