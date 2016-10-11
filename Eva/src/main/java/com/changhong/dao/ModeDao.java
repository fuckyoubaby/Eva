package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Mode;
import com.changhong.util.Params;

public interface ModeDao extends BaseDao<Mode>{
	List<Mode> getModesByPage(int offset,int length, String keyword);
	int getCount(String keyword);
	Mode saveAndGet(Mode mode);
	
	List<Mode> getModesByPage(Params params);
	int getCount(Params params);
}
