package com.changhong.service;

import java.util.List;

import com.changhong.entities.Mode;
import com.changhong.util.Params;

public interface ModeService {
	List<Mode> getModesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	void save(Mode mode);
	void update(Mode mode);
	void delete(Mode mode);
	Mode getModeById(int modeId);
	Mode saveAndGet(Mode mode);
	
	List<Mode> getModesByPage(Params params);
	int getCount(Params params);
}
