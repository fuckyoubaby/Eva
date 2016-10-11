package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Exam;
import com.changhong.util.Params;

public interface ExamDao extends BaseDao<Exam>{

	List<Exam> getExamsByPages(int offset,int length,String keyword);
	int getCount(String keyword);
	
	List<Exam> getExamsByPages(Params params);
	int getCount(Params params);
	
}
