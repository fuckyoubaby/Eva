package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Assist;
import com.changhong.util.Params;

public interface AssistService {

	//根据员工的标号获取某个时间区间的辅助类加分项目。
	List<Assist> getAssistsByEmployeeId(String employeeId,Date startDate,Date endDate);
	void save(Assist assist);
	void delete(Assist assist);
	void update(Assist assist);
	Assist get(int id);
	
	List<Assist> getAssistsByPage(Params params);
	int getCount(Params params);
}
