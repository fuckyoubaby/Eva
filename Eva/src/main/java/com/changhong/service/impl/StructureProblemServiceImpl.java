package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.StructureProblemDao;
import com.changhong.entities.Structureproblem;
import com.changhong.service.StructureProblemService;
import com.changhong.util.Params;
@Service("StructureProblemService")
public class StructureProblemServiceImpl implements StructureProblemService{

	@Autowired
	private StructureProblemDao structureProblemDao;

	@Override
	public void saveProblem(Structureproblem struProblem) {
		structureProblemDao.save(struProblem);
	}

	@Override
	public void updateProblem(Structureproblem struProblem) {
		structureProblemDao.update(struProblem);
	}

	@Override
	public void deleteProblem(Structureproblem struProblem) {
		structureProblemDao.delete(struProblem);
	}

	@Override
	public List getByPage(Params params, String projectId, int phaseId) {
		
		return structureProblemDao.getProblemsByPhaseForProject(params, phaseId, projectId);
	}

	@Override
	public int getAmountByParams(Params params, String projectId, int phaseId) {
		return structureProblemDao.getQueryAmountByPhaseForProject(params, phaseId, projectId);
	}

	@Override
	public Structureproblem getProblem(int structureProblemId) {
		return structureProblemDao.get(Structureproblem.class, structureProblemId);
	}

	@Override
	public void deleteProblem(int struProblemId) {
		structureProblemDao.delete(Structureproblem.class, struProblemId);
	}

	@Override
	public double getAvg(String employeeId, Date startDate, Date endDate,
			int problemType) {
		// TODO Auto-generated method stub
		return structureProblemDao.getAvg(employeeId, startDate, endDate, problemType);
	}

	@Override
	public double getSum(String employeeId, Date startDate, Date endDate,
			int problemType) {
		// TODO Auto-generated method stub
		return structureProblemDao.getSum(employeeId, startDate, endDate, problemType);
	}

	@Override
	public List<Structureproblem> getListForUser(String employeeId,
			int phaseId, String projectId, Params params) {
		// TODO Auto-generated method stub
		return structureProblemDao.getListForUser(employeeId, phaseId, projectId, params);
	}

	@Override
	public int getCountForUser(String employeeId, int phaseId, String projectId) {
		// TODO Auto-generated method stub
		return structureProblemDao.getCountForUser(employeeId, projectId, phaseId);
	}
	
	

}
