package com.changhong.dao.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.CommentDao;
import com.changhong.entities.Comment;
import com.changhong.util.Params;

@Repository("commentDao")
public class CommentDaoImpl extends BaseDaoImpl<Comment> implements CommentDao {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession(){
		return sessionFactory.getCurrentSession();
	}

	@Override
	public String saveEntity(Comment comment) {
		return (String) getSession().save(comment);
	}

	@Override
	public void save(Comment entity) {
		String id = saveEntity(entity);
		entity.setId(id);
	}

	@Override
	public List<Comment> getCommentsByPhaseForProject(Params params,
			int phaseId, String projectId) {
		Map<String,Object> maps = new HashMap<String, Object>();
		if(params==null) return null;
		StringBuilder sb = new StringBuilder();
		sb.append("from Comment as model where 1=1 ");
		if(!StringUtils.isBlank(projectId)){
			sb.append(" and model.project.projectId=:projectId ");
			maps.put("projectId", projectId);
		}
		if(phaseId>0){
			sb.append(" and model.phase.phaseId=:phaseId ");
			maps.put("phaseId", phaseId);
		}
		
		if(StringUtils.isNotEmpty(params.getOrderName())){
			sb.append("order by model."+params.getOrderName().trim()+" ");
			if(StringUtils.isNotBlank(params.getOrderType())){
				sb.append(params.getOrderType());
			}
		}
		
		Query query = getSession().createQuery(sb.toString());
		for(Map.Entry<String, Object> entry : maps.entrySet()){
			query.setParameter(entry.getKey(), entry.getValue());
		}
		
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		
		return query.list();
	}

	@Override
	public int getCommentsCountByPhaseForProject(Params params, int phaseId,
			String projectId) {
		Map<String,Object> maps = new HashMap<String, Object>();

		StringBuilder sb = new StringBuilder();
		sb.append("select count(model.id) from Comment as model where 1=1 ");
		if(!StringUtils.isBlank(projectId)){
			sb.append(" and model.project.projectId=:projectId ");
			maps.put("projectId", projectId);
		}
		if(phaseId>0){
			sb.append(" and model.phase.phaseId=:phaseId ");
			maps.put("phaseId", phaseId);
		}
		
		Query query = getSession().createQuery(sb.toString());
		for(Map.Entry<String, Object> entry : maps.entrySet()){
			query.setParameter(entry.getKey(), entry.getValue());
		}

		return ((Long)query.uniqueResult()).intValue();
	}
	
	

}
