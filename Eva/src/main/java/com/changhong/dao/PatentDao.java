package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Patent;
import com.changhong.util.Params;

public interface PatentDao extends BaseDao<Patent>{

	List<Patent> getPatentsByEmployeeId(String employeeId,Date startDate,Date endDate);
	List<Patent> getPatentsByPage(Params params);
	int getCount(Params params);
}
