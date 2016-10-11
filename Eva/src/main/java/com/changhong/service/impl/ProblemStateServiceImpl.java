package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ProblemStateDao;
import com.changhong.entities.Problemstate;
import com.changhong.service.ProblemStateService;
@Service("problemStateService")
public class ProblemStateServiceImpl implements ProblemStateService{

	@Autowired
	private ProblemStateDao problemStateDao;
	@Override
	public List<Problemstate> getList() {
		// TODO Auto-generated method stub
		return problemStateDao.findAll(Problemstate.class);
	}

	@Override
	public Problemstate getProblemstateById(int id) {
		// TODO Auto-generated method stub
		return problemStateDao.get(Problemstate.class, id);
	}

}
