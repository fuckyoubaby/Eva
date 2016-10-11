package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ExamDao;
import com.changhong.entities.Exam;
import com.changhong.service.ExamService;
import com.changhong.util.Params;

@Service("examService")
public class ExamServiceImpl implements ExamService{

	@Autowired
	private ExamDao examDao;
	@Override
	public List<Exam> getExamsByPage(int offset, int length, String keyword) {
		// TODO Auto-generated method stub
		return examDao.getExamsByPages(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return examDao.getCount(keyword);
	}

	@Override
	public void save(Exam exam) {
		examDao.save(exam);
	}

	@Override
	public void update(Exam exam) {
		examDao.update(exam);
	}

	@Override
	public void delete(Exam exam) {
		examDao.delete(exam);
	}

	@Override
	public Exam getExam(int examId) {
		return examDao.get(Exam.class, examId);
	}

	@Override
	public List<Exam> getExamsByPage(Params params) {
		return examDao.getExamsByPages(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return examDao.getCount(params);
	}

}
