package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Comprehensive;
import com.changhong.entities.Modecomprehensive;

public interface ModeComprehensiveDao extends BaseDao<Modecomprehensive>{
	
	List<Modecomprehensive> getModecomprehensivesByModeId(int modeId);
	void delete(int modeId,int comprehensiveId);
}
