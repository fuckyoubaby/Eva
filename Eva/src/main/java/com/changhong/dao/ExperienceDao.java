package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Experience;
import com.changhong.util.Params;

public interface ExperienceDao extends BaseDao<Experience>{

	List<Experience> getExperiencesByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	List<Integer> getAllNum();
	
	List<Experience> getExperiencesByEmployeeIdAndDate(String employeeId,Date startTime,Date endTime);
	
	List<Experience> getExperiencesByPage(Params params);
	int getCount(Params params);
	
	
}
