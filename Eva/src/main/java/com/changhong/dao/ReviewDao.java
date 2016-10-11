package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Review;

public interface ReviewDao extends BaseDao<Review>{
 
	List<Review> getByPhase(int phaseId);

	Review getByNameAndPhaseId(Integer phase, String reviewName);
}
