package com.changhong.service;

import java.util.List;

import com.changhong.entities.Problemstate;

public interface ProblemStateService {

	List<Problemstate> getList();
	Problemstate getProblemstateById(int id);
}
