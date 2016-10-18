package com.changhong.dao;

import java.util.Date;
import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Comment;
import com.changhong.util.Params;

public interface CommentDao extends BaseDao<Comment> {

	
	/**
	 * comment保存不需要主键，并返回带主键的comment
	 * @param comment 实体类
	 * @return 实体主键，UUID32位字符串
	 */
	public String saveEntity(Comment comment);
	
	/**
	 * 通过项目ID、阶段ID以及分页查询的参数获取评审列表
	 * @param params 分页参数对象
	 * @param phaseId 阶段ID
	 * @param projectId 项目ID
	 * @return
	 */
	public List<Comment> getCommentsByPhaseForProject(Params params,
			int phaseId, String projectId);

	/**
	 * 通过项目ID、阶段ID以及分页查询的参数获取评审的个数
	 * @param params 分页参数对象
	 * @param phaseId 阶段ID
	 * @param projectId 项目ID
	 * @return
	 */
	public int getCommentsCountByPhaseForProject(Params params, int phaseId,
			String projectId);
	

	/**
	 *   计算某段时间内的评审次数
	 * @param startDate  评审开始时间
	 * @param endDate  评审结束时间
	 * @return
	 */
	public int getCountByDate(Date startDate,Date endDate);
}
