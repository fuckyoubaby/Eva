package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Employeetrainr;

public interface EmployeeTrainDao extends BaseDao<Employeetrainr>{

	List<Employeetrainr> getEmployeetrainrsByTrainId(int trainId);
}
