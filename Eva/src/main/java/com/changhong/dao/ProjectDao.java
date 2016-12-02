package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Project;
import com.changhong.util.Params;

public interface ProjectDao extends BaseDao<Project>{
	List<Project> getProjectsByPage(int offset,int length,String keyword);
	int getCount(String keyword);
	
	List<Project> getProjectsByPage(Params params);
	int getCount(Params params);
	
	List<Project> getPorjectsByPageForUser(int offset,int length,String keyword,String employeeId);
	int getCountForUser(String keyword,String employeeId);
	
	
	List<Project> getPorjectsByPageForUser(Params params,String employeeId);
	int getCountForUser(Params params,String employeeId);
	
	/**
	 * 通过项目名称获取项目对象
	 * @param projectName
	 * @return
	 */
	Project getByName(String projectName);
	
	/**
	 * 查询指定项目名称的项目个数
	 * @param projectName
	 * @return
	 */
	int getAmountForProjectName(String projectName);
	
	//通过projectId找到reviewId
	public String getReviewIdByProjectId(String projectId);
	
	List getAllReviewCount(String projectId, int phaseId);
	
	List getAllEmployeeReviewCount(String projectId, int phaseId, String employeeId);
}
