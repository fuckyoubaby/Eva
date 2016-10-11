package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.OverallScoreDao;
import com.changhong.entities.Overallscore;
import com.changhong.service.OverallService;

@Service("overallService")
public class OverallServiceImpl implements OverallService{

	@Autowired
	private OverallScoreDao overallScoreDao;
	@Override
	public void save(Overallscore overallscore) {
		overallScoreDao.save(overallscore);
	}

	@Override
	public void delete(Overallscore overallscore) {
		overallScoreDao.delete(overallscore);
	}

	@Override
	public void update(Overallscore overallscore) {
		overallScoreDao.update(overallscore);
	}

	@Override
	public Overallscore getOverallscoreById(int id) {
		// TODO Auto-generated method stub
		return overallScoreDao.get(Overallscore.class, id);
	}

	@Override
	public Overallscore saveAndGet(Overallscore overallscore) {
		// TODO Auto-generated method stub
		return overallScoreDao.getAndSave(overallscore);
	}

	@Override
	public List<Overallscore> getOverallscores(int offset, int length) {
		// TODO Auto-generated method stub
		return overallScoreDao.getOverallscoresByPage(offset, length);
	}

	@Override
	public int getCount() {
		// TODO Auto-generated method stub
		return overallScoreDao.getAllCount(Overallscore.class);
	}

}
