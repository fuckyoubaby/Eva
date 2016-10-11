package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.PhaseDao;
import com.changhong.entities.Phase;
import com.changhong.service.PhaseService;

@Service("phaseService")
public class PhaseServiceImpl implements PhaseService{

	@Autowired
	private PhaseDao phaseDao;
	@Override
	public List<Phase> getAll() {
		return phaseDao.findAll(Phase.class);
	}

	@Override
	public void delete(Phase phase) {
		phaseDao.delete(phase);
	}

	@Override
	public void save(Phase phase) {
		phaseDao.save(phase);
	}

	@Override
	public void update(Phase phase) {
		phaseDao.update(phase);
	}

	@Override
	public Phase getPhase(int id) {
		
		return phaseDao.get(Phase.class, id);
	}

}
