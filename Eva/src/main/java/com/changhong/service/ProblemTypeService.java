package com.changhong.service;

import java.util.List;

import com.changhong.entities.Problemtype;

public interface ProblemTypeService {

	List<Problemtype> getProblemtypes();
	Problemtype getProblemtype(int id);
}
