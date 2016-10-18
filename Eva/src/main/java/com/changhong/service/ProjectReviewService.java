package com.changhong.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.changhong.entities.Project;
import com.changhong.entities.Projectreview;
import com.changhong.support.projectreview.ProjectReviewInfoModel;
import com.changhong.support.projectreview.datainfo.PRProjectDataInfo;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;

public interface ProjectReviewService {

	List<Projectreview> getProjectreviewsByEmployeeIdAndDate(String employeeId,Date startDate,Date endDate);
	List<Projectreview> getProjectreviewsByProjectId(String projectId);
	
	void save(Projectreview projectreview);
	void update(Projectreview projectreview);
	void delete(Projectreview projectreview);
	
	/**
	 * 删除操作
	 * @param projectreviewId
	 */
	void delete(int projectreviewId);
	/**
	 * 通过ID获取项目评审对象
	 * @param projectReviewId
	 * @return
	 */
	Projectreview getByPRId(Integer projectReviewId);
	
	/**
	 * 分页索引
	 * @param params
	 * @param projectId
	 * @param phaseId
	 * @return
	 */
	List<Projectreview> getProjectreviewsByProjectIdForPage(Params params, String projectId, int phaseId);
	/**
	 * 获取分页索引的数量
	 * @param params
	 * @param projectId
	 * @param phaseId
	 * @return
	 */
	int getAmountByProjectIdForPage(Params params, String projectId, int phaseId);
	
	/**
	 * 批量导入
	 * @param lists
	 * @return
	 */
	BatchResultTemplate saveBatch(List<Projectreview> lists);
	BatchResultTemplate batchImport(
			Map<String, List<PRProjectDataInfo>> changeTemplateAfterSetZero,
			Date modifyDate);
	
	
	int getCountNotZero(String employeeId,Date startDate,Date endDate,String colName);//获取某一列不为0的个数
	Long getSumByCol(String employeeId,Date startDate,Date endDate,String colName);//获取某一列的数字的和
	
	/**
	 * 通过ID获取项目评审对象
	 * @param projectReviewId
	 * @return
	 */
	Project getProjectById(Integer projectReviewId);
	/**
	 * 更新操作
	 * @param projectReviewId
	 * @param phaseId
	 * @param project
	 * @param employeeId
	 * @param designReg
	 * @param flowsheetReg
	 * @param workplan
	 * @param communication
	 * @param workEnt
	 * @param prexplain
	 * @param prdate
	 * @return
	 */
	JSONObject update(int projectReviewId, int phaseId, Project project, String employeeId, int designReg,
			int flowsheetReg, int workplan, int communication, int workEnt,
			String prexplain, Date prdate);
	/**
	 * 添加操作
	 * @param phaseId
	 * @param project
	 * @param employeeId
	 * @param designReg
	 * @param flowsheetReg
	 * @param workplan
	 * @param communication
	 * @param workEnt
	 * @param prexplain
	 * @param date
	 * @return
	 */
	JSONObject save(int phaseId, Project project, String employeeId, int designReg,
			int flowsheetReg, int workplan, int communication, int workEnt,
			String prexplain, Date date);
	
	List<Projectreview> getProjectreviewsByProjectIdForPageForUser(int pageNo,int pageSize, String projectId, int phaseId,String employeeId);
	int getAmountByProjectIdForPageForUser(String projectId, int phaseId,String employeeId);
	
	
	int getCountByEmployeeIdAndDate(String employee,Date startDate,Date endDate);
}
