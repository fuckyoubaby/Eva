package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Assist;
import com.changhong.util.Params;

public interface AssistDao extends BaseDao<Assist>{
	List<Assist> getAssistsByEmployeeId(String employeeId,Date startDate,Date endDate);
	List<Assist> getAssistsByPage(Params params);
	int getCount(Params params);
}
