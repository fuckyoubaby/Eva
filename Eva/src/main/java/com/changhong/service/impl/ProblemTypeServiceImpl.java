package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ProblemTypeDao;
import com.changhong.entities.Problemtype;
import com.changhong.service.ProblemTypeService;

@Service("problemTypeService")
public class ProblemTypeServiceImpl implements ProblemTypeService{

	@Autowired
	private ProblemTypeDao problemTypeDao;
	@Override
	public List<Problemtype> getProblemtypes() {
		// TODO Auto-generated method stub
		return problemTypeDao.findAll(Problemtype.class);
	}
	@Override
	public Problemtype getProblemtype(int id) {
		// TODO Auto-generated method stub
		return problemTypeDao.get(Problemtype.class, id);
	}

}
