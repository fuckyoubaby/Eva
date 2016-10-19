package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.CommentDao;
import com.changhong.dao.ProblemDao;
import com.changhong.entities.Comment;
import com.changhong.service.CommentService;
import com.changhong.util.Params;


@Service("commentService")
public class CommentServiceImpl implements CommentService {

	@Autowired
	private CommentDao commentDao;
	
	@Autowired
	private ProblemDao problemDapo;
	
	@Override
	public void saveEntity(Comment entity) {
		commentDao.save(entity);
	}

	@Override
	public void deleteEntity(String id) {
		problemDapo.deleteByCommentId(id);
		commentDao.delete(Comment.class, id);
	}

	@Override
	public void updateEntity(Comment entity) {
		commentDao.update(entity);
	}

	@Override
	public Comment getEntity(String id) {
		return commentDao.get(Comment.class, id);
	}

	@Override
	public List<Comment> findAll() {
		return commentDao.findAll(Comment.class);
	}

	@Override
	public List<Comment> getCommentsByPhaseForProject(Params params,
			int phaseId, String projectId) {
		
		return commentDao.getCommentsByPhaseForProject(params,
				phaseId, projectId);
	}

	@Override
	public int getCommentsCountByPhaseForProject(Params params, int phaseId,
			String projectId) {
		return commentDao.getCommentsCountByPhaseForProject(params,
				phaseId, projectId);
	}

	@Override
	public List<Comment> getCommentsByPhaseForProjectForUser(Params params,
			int phaseId, String projectId) {
		return commentDao.getCommentsByPhaseForProject(params, phaseId, projectId);
	}

	@Override
	public int getCommentsCountByPhaseForProjectForUser(Params params,
			int phaseId, String projectId) {
		return commentDao.getCommentsCountByPhaseForProject(params, phaseId, projectId);
	}



}
