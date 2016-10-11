package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Problem;
import com.changhong.util.Params;

public interface ProblemDao extends BaseDao<Problem>{

	List<Problem> getProblems(int offset,int length ,String keyword);
	int getCountByPhase(String keyword);
	List<Problem> getProblemsByReviewId(int offset,int length ,int reviewId);
	int getCountByReview(int reviewId);
	List<Problem> getProblemByEmployeeId(String employeeId);
	List<Problem> getProblemByEmployeeId(String employeeId,Date startTime,Date endTime);
	
	
	List<Problem> getProblemsByReviewIdForUser(int offset,int length ,int reviewId,String employeeId);
	int getCountForUser(int reviewId,String employeeId);
	
	List<Problem> getProblemsByReviewIdForProject(Params params,String projectId,int reviewId,int phaseId);
	int getCountByReviewForProject(Params params,String projectId,int reviewId,int phaseId);
	
	/**
	 * 获取指定项目中问题数量
	 * @param projectId
	 * @return
	 */
	int getProblemAmountForProject(String projectId);
	/**
	 * 获取员工参与的项目中设计评审出现的问题数量
	 * @param empId
	 * @param projectId
	 * @return
	 */
	int getProblemAmountByProAndEmp(String empId,String projectId);
	
	
	List<Problem> getProblemsByPageAndReviewForUser(int offset,
			int length,int reviewId, String employeeId, String projectId);
	
	int getCountForUser(int reviewId,String employeeId,String projectId);
	
	int getCountForUser(int phaseId,int reviewId,String employeeId,String projectId);
	List<Problem> getProblemsByPageAndReviewForUser(int offset,int length,int phaseId,int reviewId, String employeeId, String projectId);
}
