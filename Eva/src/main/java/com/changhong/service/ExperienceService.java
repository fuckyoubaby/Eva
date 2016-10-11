package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Experience;
import com.changhong.util.Params;

public interface ExperienceService {
	List<Experience> getExperiencesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	Experience getExperience(int experienceId);
	void delete(Experience experience);
	void update(Experience experience);
	void save(Experience experience);
	List<Integer> getAllNum();
	List<Experience> getExperiencesByEmployeeIdAndDate(String employeeId,Date startTime,Date endTime);
	
	List<Experience> getExperiencesByPage(Params params);
	int getCount(Params params);
}
