package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ProblemModeDao;
import com.changhong.entities.Problemmode;
import com.changhong.service.ProblemModeService;

@Service("problemModeService")
public class ProblemModeServiceImpl implements ProblemModeService{

	@Autowired
	private ProblemModeDao problemModeDao;
	@Override
	public void save(Problemmode problemmode) {
	
		problemModeDao.save(problemmode);
	}

	@Override
	public void delete(Problemmode problemmode) {
		problemModeDao.delete(problemmode);
	}

	@Override
	public void update(Problemmode problemmode) {
		problemModeDao.update(problemmode);
	}

	@Override
	public List<Problemmode> getProblemmodes(int offset, int length,
			String keyword) {
		// TODO Auto-generated method stub
		return problemModeDao.getProblemmodes(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return problemModeDao.getCount(keyword);
	}

	@Override
	public Problemmode getProblemmodeById(int problemmodeId) {
		// TODO Auto-generated method stub
		return problemModeDao.get(Problemmode.class, problemmodeId);
	}

	
}
