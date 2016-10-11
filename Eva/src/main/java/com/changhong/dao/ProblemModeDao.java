package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Problemmode;

public interface ProblemModeDao extends BaseDao<Problemmode>{

	List<Problemmode> getProblemmodes(int offset,int length,String keyword);
	int getCount(String keyword);
}
