package com.changhong.service;

import java.util.Date;
import java.util.List;

import com.changhong.entities.Problem;
import com.changhong.entities.Project;
import com.changhong.support.problem.ProblemModel;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;

public interface ProblemService {

	List<Problem> getProblems(int offset,int length,String keyword);
	int getCountByPhase(String keyword);
	void add(Problem problem);
	void delete(Problem problem);
	void update(Problem problem);
	List<Problem> getProblemsByReviewId(int offset,int length,int reviewId);
	int getCountByReview(int reviewId);
	Problem getProblemById(int problemId);
	List<Problem> getProblemsByEmployeeId(String employeeId);
	List<Problem> getProblemsByEmployeeId(String employeeId,Date startTime,Date endTime);
	
	
	List<Problem> getProblemsByPageAndReviewForUser(int offset,int length,int reviewId,String employeeId);
	int getCountForUser(int reviewId,String employeeId);
	
	
	List<Problem> getProblemsByReviewIdForProject(Params params,String projectId,int reviewId,int phaseId);
	int getCountByReviewForProject(Params params,String projectId,int reviewId,int phaseId);
	
	/**
	 * 批量添加评审问题
	 * @param problems 评审问题链表
	 * @return 结果集
	 */
	public BatchResultTemplate saveTemplates(List<Problem> problems);
	
	/**
	 * 批量添加
	 * @param lists 读取Excel文件解析的模板对象链表
	 * @param createDate 评审创建日期
	 * @param phaseId 项目流程Id
	 * @param reviewId 项目评审Id
	 * @param employeeId 问题所属责任人
	 * @param projectId 所属项目
	 * @return
	 */
	public BatchResultTemplate saveTemplates(List<ProblemModel> lists, Date createDate, int phaseId, int reviewId, String employeeId,String projectId);
	
	/**
	 * 批量添加
	 * @param lists 读取Excel文件解析的模板对象链表
	 * @param createDate 评审创建日期
	 * @param phaseId 项目流程Id
	 * @param reviewId 项目评审Id
	 * @param employeeId 问题所属责任人
	 * @param project 所属项目
	 * @return
	 */
	public BatchResultTemplate saveTemplates(List<ProblemModel> lists, Date createDate, int phaseId, int reviewId, String employeeId,Project project);
	
	
	public List<Problem> getProblemsByPageAndReviewForUser(int offset,int length,int reviewId, String employeeId, String projectId);
	public int getCountForUser(int reviewId, String employeeId, String projectId);
	
	public List<Problem> getProblemsByPageAndReviewForUser(int offset,int length,int phaseId,int reviewId, String employeeId, String projectId);
	public int getCountForUser(int phaseId, int reviewId, String employeeId, String projectId);
}
