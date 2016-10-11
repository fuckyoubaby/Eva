package com.changhong.service;

import java.util.List;

import com.changhong.entities.Secondweight;

public interface SecondWeightService {

	//根据模式Id进行筛选
	List<Secondweight> getSecondweightsByModeId(int modeId);
	
	Secondweight getSecondweightByModeIdAndType(int modeId,String problemType);
	
	void save(Secondweight secondweight);
	void update(Secondweight secondweight);
	void delete(Secondweight secondweight);
}
