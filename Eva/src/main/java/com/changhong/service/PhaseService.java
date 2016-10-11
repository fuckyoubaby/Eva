package com.changhong.service;

import java.util.List;

import com.changhong.entities.Phase;

public interface PhaseService {

	List<Phase> getAll();
	void delete(Phase phase);
	void save(Phase phase);
	void update(Phase phase);
	Phase getPhase(int id);
}
