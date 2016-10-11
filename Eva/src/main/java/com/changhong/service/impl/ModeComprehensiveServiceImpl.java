package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ModeComprehensiveDao;
import com.changhong.entities.Modecomprehensive;
import com.changhong.service.ModeComprehensiveService;

@Service("modeComprehensiveService")
public class ModeComprehensiveServiceImpl implements ModeComprehensiveService{

	@Autowired
	private ModeComprehensiveDao modeComprehensiveDao;
	@Override
	public void save(Modecomprehensive modeComprehensive) {
		modeComprehensiveDao.save(modeComprehensive);
	}

	@Override
	public void delete(Modecomprehensive modeComprehensive) {
		modeComprehensiveDao.delete(modeComprehensive);
	}

	@Override
	public void update(Modecomprehensive modeComprehensive) {
		modeComprehensiveDao.update(modeComprehensive);
	}

	@Override
	public List<Modecomprehensive> getModecomprehensives() {
		// TODO Auto-generated method stub
		return modeComprehensiveDao.findAll(Modecomprehensive.class);
	}

	@Override
	public List<Modecomprehensive> getModecomprehensivesByModeId(int modeId) {
		// TODO Auto-generated method stub
		return modeComprehensiveDao.getModecomprehensivesByModeId(modeId);
	}

	@Override
	public void delete(int modeId, int comprehensiveId) {
		modeComprehensiveDao.delete(modeId, comprehensiveId);
	}

}
