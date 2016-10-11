package com.changhong.service;

import java.util.List;

import com.changhong.entities.Overallscore;

public interface OverallService {

	void save(Overallscore overallscore);
	void delete(Overallscore overallscore);
	void update(Overallscore overallscore);
	
	Overallscore getOverallscoreById(int id);
	
	Overallscore saveAndGet(Overallscore overallscore);
	
	List<Overallscore> getOverallscores(int offset, int length);
	int getCount();
}
