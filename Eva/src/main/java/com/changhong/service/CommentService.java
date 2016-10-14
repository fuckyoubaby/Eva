package com.changhong.service;

import java.util.List;

import com.changhong.entities.Comment;
import com.changhong.util.Params;

/**
 * 评审Service接口
 * @author guoxioayang
 *
 */
public interface CommentService {
	/**
	 * 新增实体
	 * @param entity 实体对象
	 */
	public void saveEntity(Comment entity);
	
	/**
	 * 通过主键删除对象
	 * @param id 实体主键
	 */
	public void deleteEntity(String id);
	
	/**
	 * 更新实体
	 * @param entity 实体对象
	 */
	public void updateEntity(Comment entity);
	
	/**
	 * 通过主键获取实体
	 * @param id 实体主键
	 * @return
	 */
	public Comment getEntity(String id);
	
	/**
	 * 获取全部
	 * @return
	 */
	public List<Comment> findAll();
	
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
	 * 通过项目ID、阶段ID以及分页查询的参数获取符合条件的评审数量
	 * @param params 分页参数对象
	 * @param phaseId 阶段ID
	 * @param projectId 项目ID
	 * @return
	 */
	public int getCommentsCountByPhaseForProject(Params params, int phaseId,
			String projectId);
	
	
}
