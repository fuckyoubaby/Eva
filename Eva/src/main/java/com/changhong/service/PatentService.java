package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Patent;
import com.changhong.util.Params;

public interface PatentService {

	List<Patent> getPatentsByEmployeeId(String employeeId,Date startDate,Date endDate);
	
	void save(Patent patent);
	void update(Patent patent);
	void delete(Patent patent);
	Patent get(String patentId);
	
	boolean isExit(String patentId);
	
	List<Patent> getPatentsByPage(Params params);
	int getCount(Params params);
}
