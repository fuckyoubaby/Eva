package com.changhong.service;

import java.util.List;

import com.changhong.entities.Structureproblem;
import com.changhong.util.Params;

public interface StructureProblemService {
	
	void saveProblem(Structureproblem struProblem);
	
	void updateProblem(Structureproblem struProblem);
	
	void deleteProblem(Structureproblem struProblem);
	
	void deleteProblem(int struProblemId);
	
	Structureproblem getProblem (int structureProblemId);
	
	List getByPage(Params params, String projectId, int phaseId);
	
	int getAmountByParams(Params params, String projectId, int phaseId);

}
