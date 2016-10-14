package com.changhong.dao.impl;

import java.math.BigInteger;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProblemDao;
import com.changhong.entities.Problem;
import com.changhong.util.Params;

@Repository("problemDao")
public class ProblemDaoImpl extends BaseDaoImpl<Problem> implements ProblemDao{

	private static final Logger log = LoggerFactory.getLogger(ProblemDaoImpl.class);
	@Autowired
	private SessionFactory sessionFactory;
	
	private Session getSession()
	{
		return sessionFactory.getCurrentSession();
	}

	@Override
	public List<Problem> getProblems(int offset, int length, String keyword) {
		String hql = "from Problem where phase.phaseId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(keyword));
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	@Override
	public List<Problem> getProblemsByReviewId(int offset, int length,
			int reviewId) {
		String hql = "from Problem where review.reviewId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, reviewId);
		query.setFirstResult(offset);
		query.setMaxResults(length);
		return query.list();
	}

	@Override
	public int getCountByPhase(String keyword) {
		String hql = "from Problem where phase.phaseId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, Integer.parseInt(keyword));
		
		return query.list().size();
	}

	@Override
	public int getCountByReview(int reviewId) {
		String hql = "from Problem where review.reviewId=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, reviewId);
		return query.list().size();
	}

	@Override
	public List<Problem> getProblemByEmployeeId(String employeeId) {
		String hql = "from Problem where employee.id=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		return query.list();
	}

	@Override
	public List<Problem> getProblemByEmployeeId(String employeeId,
			Date startTime, Date endTime) {
		String hql = "from Problem where employee.id=? and createTime>=? and createTime<=?";
		Query query = getSession().createQuery(hql);
		query.setParameter(0, employeeId);
		query.setParameter(1, startTime);
		query.setParameter(2, endTime);
		return query.list();
	}

	@Override
	public List<Problem> getProblemsByReviewIdForUser(int offset, int length,
			int reviewId, String employeeId) {
		if (reviewId>0) {
			String hql = "from Problem where review.reviewId=? and employee.id=?";
			Query query = getSession().createQuery(hql);
			query.setParameter(0, reviewId);
			query.setParameter(1, employeeId);
			query.setFirstResult(offset);
			query.setMaxResults(length);
			return query.list();
		}else {
			String hql = "from Problem where employee.id=?";
			Query query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			query.setFirstResult(offset);
			query.setMaxResults(length);
			return query.list();
		}
		
		
	}

	@Override
	public int getCountForUser(int reviewId, String employeeId) {
		if (reviewId>0) {
			String hql = "from Problem where review.reviewId=? and employee.id=?";
			Query query = getSession().createQuery(hql);
			query.setParameter(0, reviewId);
			query.setParameter(1, employeeId);
			return query.list().size();
		}else {
			String hql = "from Problem where employee.id=?";
			Query query = getSession().createQuery(hql);
			query.setParameter(0, employeeId);
			return query.list().size();
		}
	}

	@Override
	public List<Problem> getProblemsByReviewIdForProject(Params params,
			String projectId, int reviewId,int phaseId) {
		String hql = "";
		Query query = null;
		log.info("reviewId = "+reviewId+"  phaseId="+phaseId);
		/*if (reviewId<=0) {             //没有点击的情况下
			log.info("reviewid<0"+"projectID = "+projectId);
			hql = "from Problem where phase.phaseId=? and project.projectId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, phaseId);
			query.setParameter(1, projectId);
		}else{
			log.info("phaseId>00"+"projectID = "+projectId);
			hql = "from Problem where review.reviewId=? and project.projectId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, reviewId);
			query.setParameter(1, projectId);
		}*/
		if(reviewId<=0){            //没有点击情况下
			if(params.getOrderName()==null||params.getOrderName().equals("")){
				hql = "from Problem where phase.phaseId=? and project.projectId=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, phaseId);
				query.setParameter(1, projectId);
			}else {
				if(params.getOrderType().equals("asc")){
					hql = "from Problem where phase.phaseId = ? and project.projectId = ? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, phaseId);
					query.setParameter(1, projectId);
				}else {
					hql = "from Problem where phase.phaseId = ? and project.projectId = ? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, phaseId);
					query.setParameter(1, projectId);
				}
			}
		}else {
			if(params.getOrderName()==null||params.getOrderName().equals("")){			
				hql = "from Problem where phase.phaseId=? and project.projectId=?";
				query = getSession().createQuery(hql);
				query.setParameter(0, phaseId);
				query.setParameter(1, projectId);
			}else {
				if(params.getOrderType().equals("asc")){
					hql = "from Problem where phase.phaseId = ? and project.projectId = ? order by " +params.getOrderName() +" asc";
					query = getSession().createQuery(hql);
					query.setParameter(0, phaseId);
					query.setParameter(1, projectId);
				}else {
					hql = "from Problem where phase.phaseId = ? and project.projectId = ? order by " +params.getOrderName() +" desc";
					query = getSession().createQuery(hql);
					query.setParameter(0, phaseId);
					query.setParameter(1, projectId);
				}
			}
		}
		query.setFirstResult(params.getPageNo());
		query.setMaxResults(params.getPageSize());
		return query.list();
	}

	@Override
	public int getCountByReviewForProject(Params params, String projectId,
			int reviewId,int phaseId) {
		String hql = "";
		Query query = null;
		if (reviewId<=0) {
			hql = "from Problem where phase.phaseId=? and project.projectId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, phaseId);
			query.setParameter(1, projectId);
		}else{
			hql = "from Problem where review.reviewId=? and project.projectId=?";
			query = getSession().createQuery(hql);
			query.setParameter(0, reviewId);
			query.setParameter(1, projectId);
		}
		return query.list().size();
	}
	
	@Override
	public int getProblemAmountForProject(String projectId) {
		
		String hql = "select count(model.problemId) from Problem as model where model.project.projectId=:projectId";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		
		return ((Long)query.uniqueResult()).intValue();
	}

	@Override
	public int getProblemAmountByProAndEmp(String empId, String projectId) {
		String hql = "select count(model.problemId) from Problem as model where model.project.projectId=:projectId and model.employee.id=:empId";
		Query query = getSession().createQuery(hql);
		query.setParameter("projectId", projectId);
		query.setParameter("empId", empId);
		return ((Long)query.uniqueResult()).intValue();
	}
	
	//reviewId是keyword，employeeId和projectId是限制条件
		@Override
		public List<Problem> getProblemsByPageAndReviewForUser(int offset,
				int length, int reviewId, String employeeId, String projectId) {
			String hql = null;
			Query query = null;
			//System.out.println("reviewId="+reviewId+"employeeId="+employeeId+"projectId="+projectId);
			//System.out.println("offset="+offset+"length"+length);
			if(reviewId<=0){    //小于等于零的时候，就是没有keyword的时候
				hql = "from Problem where employee.id =:id and project.projectId = :projectId";
				query = getSession().createQuery(hql);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
			}else{
				hql = "from Problem where review.reviewId =:reviewId and employee.id =:id and project.projectId =:projectId";
				query = getSession().createQuery(hql);
				query.setParameter("reviewId", reviewId);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
			}
			query.setFirstResult(offset);
			query.setMaxResults(length);
			List<Problem> list = query.list();
			System.out.println("第二个元素"+list.get(1).getProblemName());
			return query.list();
		}

		@Override
		public int getCountForUser(int reviewId, String employeeId, String projectId) {
			// TODO Auto-generated method stub
			String hql = null;
			Query query = null;
			if(reviewId<=0){    //小于等于零的时候，就是没有keyword的时候
				hql = "from Problem where employee.id =:id and project.projectId = :projectId";
				query = getSession().createQuery(hql);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
			}else{
				hql = "from Problem where review.reviewId =:reviewId and employee.id =:id and project.projectId =:projectId";
				query = getSession().createQuery(hql);
				query.setParameter("reviewId", reviewId);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
			}
			return query.list().size();
		}
		
		@Override
		public List<Problem> getProblemsByPageAndReviewForUser(int offset,
				int length,int phaseId,int reviewId, String employeeId, String projectId) {
			String hql = null;
			Query query = null;
			if(reviewId<=0){    //小于等于零的时候，就是没有keyword的时候
				hql = "from Problem where employee.id =:id and project.projectId = :projectId and phase.phaseId=:phaseId";
				query = getSession().createQuery(hql);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
				query.setParameter("phaseId", phaseId);
			}else{
				hql = "from Problem where review.reviewId =:reviewId and employee.id =:id and project.projectId =:projectId and phase.phaseId=:phaseId";
				query = getSession().createQuery(hql);
				query.setParameter("reviewId", reviewId);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
				query.setParameter("phaseId", phaseId);
			}
			query.setFirstResult(offset);
			query.setMaxResults(length);
			List<Problem> list = query.list();
			return query.list();
		}

		@Override
		public int getCountForUser(int phaseId,int reviewId, String employeeId, String projectId) {
			String hql = null;
			Query query = null;
			if(reviewId<=0){    //小于等于零的时候，就是没有keyword的时候
				hql = "from Problem where employee.id =:id and project.projectId = :projectId and phase.phaseId=:phaseId";
				query = getSession().createQuery(hql);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
				query.setParameter("phaseId", phaseId);
			}else{
				hql = "from Problem where review.reviewId =:reviewId and employee.id =:id and project.projectId =:projectId and phase.phaseId=:phaseId";
				query = getSession().createQuery(hql);
				query.setParameter("reviewId", reviewId);
				query.setParameter("id", employeeId);
				query.setParameter("projectId", projectId);
				query.setParameter("phaseId", phaseId);
			}
			return query.list().size();
		}

		@Override
		public void deleteByCommentId(String commentId) {

			String hql ="delete from Problem as model where model.comment.id=:commentId ";
			Query query = getSession().createQuery(hql);
			query.setParameter("commentId", commentId);
			query.executeUpdate();
		}

		@Override
		public List<Problem> getProblemsByCommentId(Params params,
				String commentId) {
			StringBuilder sb = new StringBuilder();
			sb.append("from Problem as model where 1=1 and model.comment.id=:commentId ");
			if(StringUtils.isNotBlank(params.getOrderName())){
				sb.append(" order by model."+params.getOrderName());
				if(StringUtils.isNotBlank(params.getOrderType())){
					sb.append(" "+params.getOrderType());
				}
			}
			
			Query query = getSession().createQuery(sb.toString());
			query.setParameter("commentId", commentId);
			
			query.setFirstResult(params.getPageNo());
			query.setMaxResults(params.getPageSize());
			return query.list();
		}

		@Override
		public int getProblemsCountByCommentId(Params params, String commentId) {
			StringBuilder sb = new StringBuilder();
			sb.append("select count(model.problemId) from Problem as model where 1=1 and model.comment.id=:commentId ");
			
			Query query = getSession().createQuery(sb.toString());
			query.setParameter("commentId", commentId);
			return ((Long)query.uniqueResult()).intValue();
		}

		@Override
		public int getCommentAmountByTime( Date startTime,
				Date endTime) {
			String sql ="select count(commentId) from problem where commentId!='' and createTime>=? and createTime<=? and problemBelong=? group by commentId ";
			SQLQuery query = getSession().createSQLQuery(sql);
			query.setDate(0, startTime);
			query.setDate(1, endTime);
			Object result = query.uniqueResult();
			int value = result==null?0:((BigInteger)result).intValue();
			return value;
		}

		@Override
		public int getCommentAmountByEmployeeId(String employeeId,
				Date startTime, Date endTime) {
			String sql ="select count(commentId) from problem where commentId!='' and createTime>=? and createTime<=? and problemBelong=? group by commentId ";
			SQLQuery query = getSession().createSQLQuery(sql);
			query.setDate(0, startTime);
			query.setDate(1, endTime);
			query.setString(2, employeeId);
			Object result = query.uniqueResult();
			int value = result==null?0:((BigInteger)result).intValue();
			return value;
		}
}
