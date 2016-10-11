package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Overallscore;

public interface OverallScoreDao extends BaseDao<Overallscore>{

	Overallscore getAndSave(Overallscore overallscore);
	
	List<Overallscore> getOverallscoresByPage(int offset,int length);
	
}
