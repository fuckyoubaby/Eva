package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Modeproblemmoder;

public interface ModeProblemModeRDao extends BaseDao<Modeproblemmoder>{
	
	boolean isExist(int modeId,int problemModeId);
	List<Modeproblemmoder> getModeproblemmodersByModeId(int modeId);
	
	void delete(int modeId,int problemModeId);

}
