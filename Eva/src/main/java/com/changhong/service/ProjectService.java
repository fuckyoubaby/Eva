package com.changhong.service;

import java.util.List;
import java.util.Map;

import com.changhong.entities.Project;
import com.changhong.util.Params;
import com.changhong.util.QuestionCount;

public interface ProjectService {
	List<Project> getProjectByPage(int pno,int length,String keyword);
	Project getProjectById(String projectId);
	int getCount(String keyword);
	void save(Project project);
	void delete(Project project);
	void update(Project project);
	List<Project> getProjectByPageForUser(int pno,int length,String keyword,String employeeId);
	int getCountForUser(String keyword,String employeeId);
	
	
	List<Project> getProjectByPage(Params params);
	int getCount(Params params);
	
	List<Project> getProjectByPageForUser(Params params,String employeeId);
	int getCountForUser(Params params,String employeeId);
	
	int getCountForProjectName(String projectName);
	public String getReviewIdByProjectId(String projectId);
	
	Map<Integer, QuestionCount> getProjectProblemsCount(String projectId);
}
