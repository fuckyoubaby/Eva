package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ModeDao;
import com.changhong.entities.Mode;
import com.changhong.service.ModeService;
import com.changhong.util.Params;

@Service("modeService")
public class ModeServiceImpl implements ModeService{

	@Autowired
	private ModeDao modeDao;

	@Override
	public List<Mode> getModesByPage(int offset, int length, String keyword) {
		// TODO Auto-generated method stub
		return modeDao.getModesByPage(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return modeDao.getCount(keyword);
	}

	@Override
	public void save(Mode mode) {
		modeDao.save(mode);
	}

	@Override
	public void update(Mode mode) {
		modeDao.update(mode);
	}

	@Override
	public void delete(Mode mode) {
		modeDao.delete(mode);
	}

	@Override
	public Mode getModeById(int modeId) {
		return modeDao.get(Mode.class, modeId);
	}

	@Override
	public Mode saveAndGet(Mode mode) {
		// TODO Auto-generated method stub
		return modeDao.saveAndGet(mode);
	}

	@Override
	public List<Mode> getModesByPage(Params params) {
		// TODO Auto-generated method stub
		return modeDao.getModesByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return modeDao.getCount(params);
	}
}
