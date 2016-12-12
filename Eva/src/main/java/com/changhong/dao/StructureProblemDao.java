package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Structureproblem;
import com.changhong.util.Params;

public interface StructureProblemDao extends BaseDao<Structureproblem>{
	
	/**
	 * 通过项目ID、阶段ID以及分页查询的参数获取问题信息
	 * @param params 分页查询参数对象
	 * @param phaseId 阶段ID
	 * @param projecId 项目ID
	 * @return
	 */
	public List<Structureproblem> getProblemsByPhaseForProject(Params params, int phaseId, String projecId);
	
	/**
	 * 通过项目ID、阶段ID以及分页查询的参数获取评审的个数
	 * @param params
	 * @param phaseId
	 * @param projectId
	 * @return
	 */
	public int getQueryAmountByPhaseForProject(Params params, int phaseId, String projectId);

	/**
	 * 获取固定时间内的指定类型的结构问题数量(用于统计开模次数)
	 * @param startDate 起止时间
	 * @param endDate 结束时间
	 * @param problemType 问题类型，默认为一般设计缺陷 value=1
	 * @return
	 */
	public int getCountByDate(Date startDate, Date endDate, int problemType);
	
	/**
	 * 
	 * 获取固定时间内的指定类型的结构问题数量(用于统计开模次数)
	 * @param employeeId 员工ID
	 * @param startDate 起止时间
	 * @param endDate 结束时间
	 * @param problemType 问题类型，默认为一般设计缺陷 value=1
	 * @return
	 */
	public int getCountByDateAndEmployee(String employeeId, Date startDate, Date endDate, int problemType);
	
	/**
	 * 获取某类错误的平均值
	 * @param employeeId
	 * @param startDate
	 * @param endDate
	 * @param problemType
	 * @return
	 */
	public double getAvg(String employeeId,Date startDate,Date endDate,int problemType);
	
	/**
	 * 获取某类错误的总分
	 * @param employeeId
	 * @param startDate
	 * @param endDate
	 * @param problemType
	 * @return
	 */
	public double getSum(String employeeId,Date startDate,Date endDate,int problemType);
	/**
	 * 根据员工id，阶段id和项目id
	 * @param employeeId
	 * @param phaseId
	 * @param projectId
	 * @return
	 */
	List<Structureproblem> getListForUser(String employeeId,int phaseId,String projectId,Params params);
	
	int getCountForUser(String employeeId,String projectId,int phaseId);
}
