package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Project;
import com.changhong.entities.Projectreview;
import com.changhong.util.Params;

public interface ProjectReviewDao extends BaseDao<Projectreview>{

	List<Projectreview> getProjectreviewsByEmployeeIdAndDate(String employeeId,Date startDate,Date endDate);
	List<Projectreview> getProjectreviewsByProjectId(String projectId);
	List<Projectreview> getProjectreviewsByProjectIdForPage(Params params, String projectId,
			int phaseId);
	int getAmountByProjectIdForPage(Params params, String projectId, int phaseId);
	
	
	int getCountNotZero(String employeeId,Date startDate,Date endDate,String colName);
	Long getSumByCol(String employeeId,Date startDate,Date endDate,String colName);
	
	/**
	 * 通过评审ID获取项目独享
	 * @param projectReviewId
	 * @return
	 */
	Project getProjectById(Integer projectReviewId);
	
	/**
	 * 通过项目ID获取项目评审数量
	 * @param projectId
	 * @return
	 */
	int getAmountByProjectId(String projectId);
	/**
	 * 通过项目ID和员工ID获取项目评审数量
	 * @param empId
	 * @param projectId
	 * @return
	 */
	int getAmountByEmpAndProject(String empId,String projectId);
	
	public List<Projectreview> getProjectreviewsByProjectIdForPageForUser(int pageNo, int pageSize, String projectId, int phaseId,
			String employeeId);
	public int getAmountByProjectIdForPageForUser(String projectId,int phaseId, String employeeId);
	
	/**计算某段时间内的评审次数
	 * 
	 * @param employeeId  员工id
	 * @param startDate  评审开始 时间
	 * @param endDate   评审结束时间
	 * @return
	 */
	public int getCountByDateAndEmployee(String employeeId,Date startDate,Date endDate);
}
