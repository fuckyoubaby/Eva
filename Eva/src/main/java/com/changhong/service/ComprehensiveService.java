package com.changhong.service;

import java.util.List;

import com.changhong.entities.Comprehensive;

public interface ComprehensiveService {

	void save(Comprehensive comprehensive);
	void delete(Comprehensive comprehensive);
	void update(Comprehensive comprehensive);
	List<Comprehensive> getComprehensivesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	Comprehensive getComprehensive(int comprehensiveId);
}
