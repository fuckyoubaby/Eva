package com.changhong.service;

import java.util.List;

import com.changhong.entities.Problemmode;

public interface ProblemModeService {

	void save(Problemmode problemmode);
	void delete(Problemmode problemmode);
	void update(Problemmode problemmode);
	List<Problemmode> getProblemmodes(int offset,int length,String keyword);
	int getCount(String keyword);
	Problemmode getProblemmodeById(int problemmodeId);
}
