package com.changhong.service;

import java.util.List;

import com.changhong.entities.Classify;

public interface ClassifyService {

	Classify getClassify(int id);
	List<Classify> getAll();
}
