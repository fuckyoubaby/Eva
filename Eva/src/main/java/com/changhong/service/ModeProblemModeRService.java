package com.changhong.service;

import java.util.List;

import com.changhong.entities.Modeproblemmoder;

public interface ModeProblemModeRService {

	boolean isExist(int modeId,int problemModeId);
	void save(Modeproblemmoder modeproblemmoder);
	void delete(Modeproblemmoder modeproblemmoder);
	void update(Modeproblemmoder modeproblemmoder);
	
	List<Modeproblemmoder> getModeproblemmoders();
	
	List<Modeproblemmoder> getModeproblemmodersByModeId(int modeId);
	
	void delete(int modeId,int problemModeId);
	
}
