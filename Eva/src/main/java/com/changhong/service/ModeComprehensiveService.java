package com.changhong.service;

import java.util.List;

import com.changhong.entities.Modecomprehensive;

public interface ModeComprehensiveService {

	void save(Modecomprehensive modeComprehensive);
	void delete(Modecomprehensive modeComprehensive);
	void update(Modecomprehensive modeComprehensive);
	
	List<Modecomprehensive> getModecomprehensives();
	List<Modecomprehensive> getModecomprehensivesByModeId(int modeId);
	void delete(int modeId,int comprehensiveId);
}
