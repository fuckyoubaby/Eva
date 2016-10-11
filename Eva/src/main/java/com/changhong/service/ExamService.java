package com.changhong.service;

import java.util.List;

import com.changhong.entities.Exam;
import com.changhong.util.Params;

public interface ExamService {

	List<Exam> getExamsByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	void save(Exam exam);
	void update(Exam exam);
	void delete(Exam exam);
	Exam getExam(int examId);
	
	List<Exam> getExamsByPage(Params params);
	int getCount(Params params);
}
