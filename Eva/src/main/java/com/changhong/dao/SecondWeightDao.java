package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Secondweight;

public interface SecondWeightDao extends BaseDao<Secondweight>{

	//根据模式Id进行筛选
	List<Secondweight> getSecondweightsByModeId(int modeId);
	
	List<Secondweight> getSecondweightsByModeIdAndType(int modeId,String problemType);
	
}
