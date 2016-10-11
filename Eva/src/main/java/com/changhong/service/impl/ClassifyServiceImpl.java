package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ClassifyDao;
import com.changhong.entities.Classify;
import com.changhong.service.ClassifyService;

@Service("classifyService")
public class ClassifyServiceImpl implements ClassifyService{

	@Autowired
	private ClassifyDao classifyDao;

	@Override
	public Classify getClassify(int id) {
		// TODO Auto-generated method stub
		return classifyDao.get(Classify.class, id);
	}

	@Override
	public List<Classify> getAll() {
		// TODO Auto-generated method stub
		return classifyDao.findAll(Classify.class);
	}
	
	
}
