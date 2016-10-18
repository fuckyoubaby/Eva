package com.changhong.service.impl;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.CommentDao;
import com.changhong.dao.EmployeeDao;
import com.changhong.dao.PhaseDao;
import com.changhong.dao.ProblemDao;
import com.changhong.dao.ProblemStateDao;
import com.changhong.dao.ProblemTypeDao;
import com.changhong.dao.ProjectDao;
import com.changhong.dao.ReviewDao;
import com.changhong.dao.impl.ProblemStateDaoImpl;
import com.changhong.entities.Comment;
import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Problem;
import com.changhong.entities.Problemstate;
import com.changhong.entities.Problemtype;
import com.changhong.entities.Project;
import com.changhong.entities.Review;
import com.changhong.service.ProblemService;
import com.changhong.support.problem.ProblemModel;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;
import com.utility.reflect.ReflectUtil;

@Service("problemService")
public class ProblemServiceImpl implements ProblemService{

	@Autowired
	private ProblemDao problemDao;
	@Autowired
	private PhaseDao phaseDao;
	@Autowired
	private ReviewDao reviewDao;
	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private ProblemStateDao problemStateDao;
	@Autowired
	private ProblemTypeDao problemTypeDao;
	@Autowired
	private CommentDao commentDao;
	
	@Override
	public List<Problem> getProblems(int offset, int length, String keyword) {
		// TODO Auto-generated method stub
		return problemDao.getProblems(offset, length, keyword);
	}

	@Override
	public void add(Problem problem) {
		problemDao.save(problem);
	}

	@Override
	public void delete(Problem problem) {
		problemDao.delete(problem);
	}

	@Override
	public void update(Problem problem) {
		problemDao.update(problem);
	}

	@Override
	public List<Problem> getProblemsByReviewId(int offset, int length,
			int reviewId) {
		// TODO Auto-generated method stub
		return problemDao.getProblemsByReviewId(offset, length, reviewId);
	}

	@Override
	public int getCountByPhase(String keyword) {
		// TODO Auto-generated method stub
		return problemDao.getCountByPhase(keyword);
	}

	@Override
	public int getCountByReview(int reviewId) {
		// TODO Auto-generated method stub
		return problemDao.getCountByReview(reviewId);
	}

	@Override
	public Problem getProblemById(int problemId) {
		// TODO Auto-generated method stub
		return problemDao.get(Problem.class, problemId);
	}

	@Override
	public List<Problem> getProblemsByEmployeeId(String employeeId) {
		// TODO Auto-generated method stub
		return problemDao.getProblemByEmployeeId(employeeId);
	}

	@Override
	public List<Problem> getProblemsByEmployeeId(String employeeId,
			Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return problemDao.getProblemByEmployeeId(employeeId, startTime, endTime);
	}

	@Override
	public List<Problem> getProblemsByPageAndReviewForUser(int offset,
			int length, int reviewId, String employeeId) {
		// TODO Auto-generated method stub
		return problemDao.getProblemsByReviewIdForUser(offset, length, reviewId, employeeId);
	}

	@Override
	public int getCountForUser(int reviewId, String employeeId) {
		// TODO Auto-generated method stub
		return problemDao.getCountForUser(reviewId, employeeId);
	}

	@Override
	public List<Problem> getProblemsByReviewIdForProject(Params params,
			String projectId, int reviewId, int phaseId) {
		//System.out.println("projectid = "+projectId);
		return problemDao.getProblemsByReviewIdForProject(params, projectId, reviewId, phaseId);
	}

	@Override
	public int getCountByReviewForProject(Params params, String projectId,
			int reviewId, int phaseId) {
		// TODO Auto-generated method stub
		return problemDao.getCountByReviewForProject(params, projectId, reviewId, phaseId);
	}

	@Override
	public BatchResultTemplate saveTemplates(List<Problem> problems) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(problems == null | problems.size()<1){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		
		brt.setTotalRecodes(problems.size());
		int repeatount = 0;
		brt.setRepeatRecodes(repeatount);
		brt.setImportRecodes(problemDao.save(problems));
		return brt;
	}

	@Override
	public BatchResultTemplate saveTemplates(List<ProblemModel> lists,
			Date createDate, int phaseId, String commentId,String employeeId,String projectId) {
		Phase phase = phaseDao.get(Phase.class, phaseId);
		Review review = null;
		Comment comment = commentDao.get(Comment.class, commentId);
		Employee employee = employeeDao.get(Employee.class, employeeId);
		Project project = projectDao.get(Project.class, projectId);
		for(int i=lists.size()-1;i>=0;i--){
			ProblemModel pm = lists.get(i);
			if(!pm.isUseful()) lists.remove(i);
			pm.setCreateTime(createDate);
		}
		Map<String,Problemstate> states = initStates(problemStateDao);
		Map<String,Problemtype> types = initTypes(problemTypeDao);
		List<Problem> problems = null;
		try{
			problems = models2Problems(lists, employee, phase, review,comment, project, states,types);
		}catch(Exception e){
			e.printStackTrace();
			problems = null;
			return saveTemplates(problems);
		}
		
		return saveTemplates(problems);
	}
	@Override
	public BatchResultTemplate saveTemplates(List<ProblemModel> lists,
			Date createDate, int phaseId, String commentId, String employeeId,
			Project project) {
		Phase phase = phaseDao.get(Phase.class, phaseId);
		Review review = null;
		Comment comment = commentDao.get(Comment.class, commentId);
		Employee employee = employeeDao.get(Employee.class, employeeId);
		Map<String,Problemstate> states = initStates(problemStateDao);
		Map<String,Problemtype> types = initTypes(problemTypeDao);
		for(int i=lists.size()-1;i>=0;i--){
			ProblemModel pm = lists.get(i);
			if(!pm.isUseful()){
				lists.remove(i);
				continue;
			}
			//继续移除
			if(!StringUtils.isBlank(pm.getProblemstate())){
				if(!states.containsKey(pm.getProblemstate())){
					lists.remove(i);
					continue;
				}
			}
			if(!StringUtils.isBlank(pm.getProblemtype())){
				if(!types.containsKey(pm.getProblemtype())){
					lists.remove(i);
					continue;
				}
			}
			pm.setCreateTime(createDate);
		}
		
		List<Problem> problems = null;
		try{
			problems = models2Problems(lists, employee, phase, review,comment, project, states,types);
		}catch(Exception e){
			e.printStackTrace();
			return saveTemplates(problems);
		}
		
		return saveTemplates(problems);
	}
	
	
	private Map<String, Problemstate> initStates(ProblemStateDao psDao){
		List<Problemstate> states = psDao.findAll(Problemstate.class);
		Map<String, Problemstate> maps = new HashMap<String, Problemstate>();
		for(int i=0;i<states.size();i++){
			Problemstate ps = states.get(i);
			maps.put(ps.getProblemStateName(), ps);
		}
		return maps;
	}
	
	private Map<String, Problemtype> initTypes(ProblemTypeDao ptDao){
		List<Problemtype> states = ptDao.findAll(Problemtype.class);
		Map<String, Problemtype> maps = new HashMap<String, Problemtype>();
		for(int i=0;i<states.size();i++){
			Problemtype ps = states.get(i);
			maps.put(ps.getTypeName(), ps);
		}
		return maps;
	}
	
	
	private List<Problem> models2Problems(List<ProblemModel> lists, Employee employee,Phase phase, Review review,Comment comment, Project project, Map<String,Problemstate> states,Map<String,Problemtype> types) throws NoSuchFieldException,
	SecurityException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		List<Problem> problems = new ArrayList<Problem>();
		Problem problem = null;
		for(int i=0;i<lists.size();i++){
			problem = model2Problem(lists.get(i),employee,phase,review,comment, project,states,types);
			problems.add(problem);
		}
		return problems;
	}
	
	private Problem model2Problem(ProblemModel pm, Employee employee, Phase phase, Review review,Comment comment,Project project,Map<String,Problemstate> states,Map<String,Problemtype> types)
			throws NoSuchFieldException, SecurityException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		Field[] fields = pm.getClass().getDeclaredFields();
		Problem problem = new Problem();
		for(int i=0;i<fields.length;i++){
			String fieldName = fields[i].getName();
			if(fieldName.equals("problemstate")){
				Object value = ReflectUtil.invokeGetter(pm, fieldName);
				ReflectUtil.invokeSetter(problem, fieldName, states.get(value));
				continue;
			}
			if(fieldName.equals("problemtype")){
				Object value = ReflectUtil.invokeGetter(pm, fieldName);
				ReflectUtil.invokeSetter(problem, fieldName, types.get(value));
				continue;
			}
			ReflectUtil.invokeSetter(problem, fieldName, ReflectUtil.invokeGetter(pm, fieldName));
		}
		problem.setEmployee(employee);
		problem.setPhase(phase);
		problem.setReview(review);
		problem.setComment(comment);
		problem.setProject(project);
		return problem;
	}

	@Override
	public List<Problem> getProblemsByPageAndReviewForUser(int offset,int length, int reviewId, String employeeId, String projectId) {
		return problemDao.getProblemsByPageAndReviewForUser(offset, length, reviewId, employeeId, projectId);
	}

	@Override
	public int getCountForUser(int reviewId, String employeeId, String projectId) {
		return problemDao.getCountForUser(reviewId, employeeId, projectId);
	}
	@Override
	public List<Problem> getProblemsByPageAndReviewForUser(int offset,int length,int phaseId,int reviewId, String employeeId, String projectId) {
		return problemDao.getProblemsByPageAndReviewForUser(offset, length, phaseId,reviewId, employeeId, projectId);
	}

	@Override
	public int getCountForUser(int phaseId,int reviewId, String employeeId, String projectId) {
		return problemDao.getCountForUser(phaseId,reviewId, employeeId, projectId);
	}

	@Override
	public List<Problem> getProblemsByCommentId(Params params, String commentId) {
		
		return problemDao.getProblemsByCommentId(params, commentId);
	}

	@Override
	public int getProblemsCountByCommentId(Params params, String commentId) {
		// TODO Auto-generated method stub
		return problemDao.getProblemsCountByCommentId(params, commentId);
	}

	@Override
	public int getCountByCommentIdAndEmployeeIdAndDate(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return problemDao.getCommentAmountByEmployeeId(employeeId, startDate, endDate);
	}

	
}
