package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ComprehensiveDao;
import com.changhong.entities.Comprehensive;
import com.changhong.service.ComprehensiveService;

@Service("comprehensive")
public class ComprehensiveServiceImpl implements ComprehensiveService{

	@Autowired
	private ComprehensiveDao comprehensiveDao;
	@Override
	public void save(Comprehensive comprehensive) {
		comprehensiveDao.save(comprehensive);
	}

	@Override
	public void delete(Comprehensive comprehensive) {
		comprehensiveDao.delete(comprehensive);
	}

	@Override
	public void update(Comprehensive comprehensive) {
		comprehensiveDao.update(comprehensive);
	}

	@Override
	public List<Comprehensive> getComprehensivesByPage(int offset, int length,
			String keyword) {
		// TODO Auto-generated method stub
		return comprehensiveDao.getComprehensivesByPage(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return comprehensiveDao.getCount(keyword);
	}

	@Override
	public Comprehensive getComprehensive(int comprehensiveId) {
		// TODO Auto-generated method stub
		return comprehensiveDao.get(Comprehensive.class, comprehensiveId);
	}

}
