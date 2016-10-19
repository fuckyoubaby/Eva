package com.changhong.action;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.alibaba.fastjson.JSONWriter.Context;
import com.changhong.entities.Comment;
import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Problem;
import com.changhong.entities.Problemstate;
import com.changhong.entities.Problemtype;
import com.changhong.entities.Project;
import com.changhong.entities.Review;
import com.changhong.service.CommentService;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.PhaseService;
import com.changhong.service.ProblemService;
import com.changhong.service.ProblemStateService;
import com.changhong.service.ProblemTypeService;
import com.changhong.service.ProjectService;
import com.changhong.service.ReviewService;
import com.changhong.support.problem.ProblemEnum;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("problemAction")
@Results(
		{
//			@Result(name="reviews",location="/adminEnter/project/project_process_info.jsp"),
//			@Result(name="reviews1",location="/adminEnter/project/project_process_info.jsp"),
			@Result(name="reviews",location="/adminEnter/project/project_process_comments_index.jsp"),
			@Result(name="reviews1",location="/adminEnter/project/project_process_comments_index.jsp"),
			@Result(name="reviews2",location="/adminEnter/project/project_process_preview_info.jsp"),
			
			@Result(name="problemReview",location="/adminEnter/project/problemTemplate.jsp"),
			/*comment_info.jsp ajax 查询返回的页面*/
			@Result(name="problemsTemplate", location="/adminEnter/project/problemTemplate.jsp"),
			@Result(name="problem",location="/adminEnter/project/project_mistake_info.jsp"),
			
			@Result(name="redirectProblem",type="redirectAction",params={
					"actionName","/commentAction!getInfoById.action",
					"id","${id}" }),
			@Result(name="save",location="/adminEnter/project/project_index.jsp"),
			@Result(name="problemForUpdate",location="/adminEnter/project/project_mistake_update.jsp"),
			
			//@Result(name="reviewsForUser",location="/userEnter/project/project_process_info.jsp"),
			//@Result(name="problemReviewForUser",location="/userEnter/project/problemTemplate.jsp"),
			
			@Result(name="reviewsForUser",location="/userEnter/project/project_process_comments_index.jsp"),
			@Result(name="reviewsForUser1",location="/userEnter/project/project_process_comments_index.jsp"),
			@Result(name="reviewsForUser2",location="/userEnter/project/project_process_preview_info.jsp"),
			@Result(name="problemForUser",location="/userEnter/project/project_mistake_info.jsp"),
			@Result(name="problemsTemplateForUser",location="/userEnter/project/problemTemplate.jsp")

		}
		)
public class ProblemAction {

	private static final Logger log = LoggerFactory.getLogger(ProblemAction.class);
	@Autowired
	private ProblemService problemService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private PhaseService phaseService;
	@Autowired 
	private ProblemTypeService problemTypeService;
	@Autowired
	private ProblemStateService problemStateService;
	@Autowired
	private EmployeeProjectRService employeeProjectRService;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private CommentService commentService;
	
	
	private String phaseId;
	/**
	 * 展示的评审序列号
	 */
	private int indexNo;
	
	private List<Review> reviews;
	private List<Employee> employees;
	private List<Phase> phases;
	private List<Problemstate> problemstates;
	private List<Problemtype> problemtypes;
	
	
	private int reviewId;
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	
	private List<Problem> problems;
	private int problemId;
	private Problem problem;
	private Date prdate;

	
	private String problemContent;
	private String problemLevel;
	private String employeeId;
	private String problemName;
	private String reason;
	private int problemTypeId;
	private int problemStateId;

    private String orderType;
    private String orderName;
	
	private Phase phase;
	
	/**
	 * 用于传递更新或删除操作是否成功
	 */
	private String message;
	private String projectId;
	private Review reviewbyId;
	private Project project;
	
	private String id;
	
	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public Review getReviewbyId() {
		return reviewbyId;
	}

	public void setReviewbyId(Review reviewbyId) {
		this.reviewbyId = reviewbyId;
	}

	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public Date getPrdate() {
		return prdate;
	}

	public void setPrdate(Date prdate) {
		this.prdate = prdate;
	}

	public String getOrderType() {
		return orderType;
	}

	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}

	public String getOrderName() {
		return orderName;
	}

	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public List<Phase> getPhases() {
		return phases;
	}

	public void setPhases(List<Phase> phases) {
		this.phases = phases;
	}

	public List<Problemstate> getProblemstates() {
		return problemstates;
	}

	public void setProblemstates(List<Problemstate> problemstates) {
		this.problemstates = problemstates;
	}

	public List<Problemtype> getProblemtypes() {
		return problemtypes;
	}

	public void setProblemtypes(List<Problemtype> problemtypes) {
		this.problemtypes = problemtypes;
	}

	public int getProblemTypeId() {
		return problemTypeId;
	}

	public void setProblemTypeId(int problemTypeId) {
		this.problemTypeId = problemTypeId;
	}

	public int getProblemStateId() {
		return problemStateId;
	}

	public void setProblemStateId(int problemStateId) {
		this.problemStateId = problemStateId;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public String getProblemContent() {
		return problemContent;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public void setProblemContent(String problemContent) {
		this.problemContent = problemContent;
	}

	public String getProblemLevel() {
		return problemLevel;
	}

	public void setProblemLevel(String problemLevel) {
		this.problemLevel = problemLevel;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getProblemName() {
		return problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	public int getProblemId() {
		return problemId;
	}

	public void setProblemId(int problemId) {
		this.problemId = problemId;
	}

	public Problem getProblem() {
		return problem;
	}

	public void setProblem(Problem problem) {
		this.problem = problem;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public List<Problem> getProblems() {
		return problems;
	}

	public void setProblems(List<Problem> problems) {
		this.problems = problems;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public List<Review> getReviews() {
		return reviews;
	}

	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}

	public String getPhaseId() {
		return phaseId;
	}

	public void setPhaseId(String phaseId) {
		this.phaseId = phaseId;
	}
	
	//user project_info.jsp,跳转的jsp
	public String getReviewByPhaseId()
	{
		log.info("phaseId = "+phaseId);
		ActionContext context = ActionContext.getContext();
		reviews = reviewService.getReviewsByPhaseId(Integer.parseInt(phaseId));
		context.getSession().put("phaseId", phaseId);         //取得阶段
		phase = phaseService.getPhase(Integer.parseInt(phaseId));
		//log.info("reviews size = "+reviews.size());
		//log.info("indexNo=="+indexNo);
		String result = "reviews";
		log.info("索引号admin projectInfo indexNo="+indexNo);
		if(indexNo!=0){                //完全没用
			int endIndex = indexNo%2==0?2:1;
			result+=endIndex;
		}
		return result;
	}
	
	public String getProblemByPhase()
	{
		return "problems";
	}
	
	public String getProblemsByReview()
	{
		log.info("reviewId = "+reviewId);
		ActionContext context = ActionContext.getContext();
		String phaseId =  (String) context.getSession().get("phaseId");
		Project project = (Project) context.getSession().get("project");
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		problems = problemService.getProblemsByReviewIdForProject(params, project.getProjectId(), reviewId, Integer.parseInt(phaseId));
		itemcount = problemService.getCountByReviewForProject(params, project.getProjectId(), reviewId, Integer.parseInt(phaseId));
		log.info("itemcount = "+itemcount+"problems.size = "+problems.size());
		return "problemReview";
	}
	public String getProblemsByComment()
	{
		ActionContext context = ActionContext.getContext();
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		String commentId = (String) context.getSession().get("commentId");
		
		problems = problemService.getProblemsByCommentId(params, commentId);
		itemcount = problemService.getProblemsCountByCommentId(params, commentId);
		
		return "problemsTemplate";
	}
	
	public String getProblemById(){
		ActionContext context = ActionContext.getContext();
		problem = problemService.getProblemById(problemId);
		context.getSession().put("problem", problem);
		return "problem";
	}
	public String update()
	{
		ActionContext context = ActionContext.getContext();
		problem = (Problem) context.getSession().get("problem");
		
		Employee employee = employeeService.getEmployee(employeeId);
		Problemtype problemtype = problemTypeService.getProblemtype(problemTypeId);
		Problemstate problemstate = problemStateService.getProblemstateById(problemStateId);
		
		if(employee!=null){
			problem.setEmployee(employee);
		}

		if(StringUtils.isNotBlank(problemContent)){
			problem.setProblemContent(problemContent);
		}
		if(StringUtils.isNotBlank(problemName)){
			problem.setProblemName(problemName);
		}
		if(StringUtils.isNotBlank(reason)){
			problem.setExplaintion(reason);
		}
		if(StringUtils.isNotBlank(problemLevel) && ProblemEnum.isContainer(problemLevel)){
			problem.setProblemLevel(problemLevel);
		}
		if(problemstate!=null){
			problem.setProblemstate(problemstate);
		}
		if(problemtype!=null){
			problem.setProblemtype(problemtype);
		}
		problemService.update(problem);
		context.getSession().put("problem",problem);
		setId(problem.getComment().getId());
		
		return "update";
	}
	public String delete()
	{
		ActionContext context = ActionContext.getContext();
		problem = (Problem) context.getSession().get("problem");
		String commentId  = (String)context.getSession().get("commentId");
		setId(commentId);
		problemService.delete(problem);
		return "redirectProblem";
	}
	public String save()
	{
		Project project = (Project) ActionContext.getContext().getSession().get("project");
		String commenId = (String) ActionContext.getContext().getSession().get("commentId");
		Problem problem = new Problem();
		if(StringUtils.isBlank(employeeId) || StringUtils.isBlank(problemName) || StringUtils.isBlank(problemLevel)
				|| StringUtils.isBlank(commenId)){
			return "save";
		}
		setId(commenId);
		Employee employee = employeeService.getEmployee(employeeId);
		if(employee==null){
			return "redirectProblem";
		}
		
		Problemtype problemtype = problemTypeService.getProblemtype(problemTypeId);
		Problemstate problemstate = problemStateService.getProblemstateById(problemStateId);
		if(problemtype==null || problemstate == null){
			return "redirectProblem";
		}
		
		//Date date = new Date();
		
		Comment c = commentService.getEntity(commenId);
		Phase p = c.getPhase();
		problem.setCreateTime(prdate);
		problem.setProblemContent(problemContent);
		problem.setProblemName(problemName);
		problem.setExplaintion(reason);
		problem.setProblemLevel(problemLevel);
		problem.setProblemstate(problemstate);
		problem.setProblemtype(problemtype);
		
		problem.setEmployee(employee);
		problem.setProject(project);
		
		problem.setPhase(p);
		problem.setReview(null);
		problem.setComment(c);
		
		problemService.add(problem);
		setPhaseId(c.getPhase().getPhaseId()+"");
		return "redirectProblem";
	}
	
	public String getProblemByIdForUser(){
		ActionContext context = ActionContext.getContext();
		problem = problemService.getProblemById(problemId);
		context.getSession().put("problem", problem);
		return "problemForUser";
	}
	
	public String getProblemByIdForUpdate(){
		ActionContext context = ActionContext.getContext();
		problem = problemService.getProblemById(problemId);
		context.getSession().put("problem", problem);
		Project project = (Project) ActionContext.getContext().getSession().get("project");
		employees = employeeProjectRService.getEmployeeByProjectId(project.getProjectId());
		//employees = employeeService.getAllEmployees();
		phases = phaseService.getAll();
		reviews = reviewService.getAllReview();
		problemstates = problemStateService.getList();
		problemtypes = problemTypeService.getProblemtypes();
		return "problemForUpdate";
	}
	
	//用户端用到的方法
	public String getReviewByPhaseIdForUser()
	{
		ActionContext context = ActionContext.getContext();
		reviews = reviewService.getReviewsByPhaseId(Integer.parseInt(phaseId));  //通过阶段编号得到评审 ,这里得到阶段编号
		context.getSession().put("projectId", projectId);
		context.getSession().put("phaseId", phaseId);
		phase = phaseService.getPhase(Integer.parseInt(phaseId));
		String reviewsForUser = "reviewsForUser";
		if(indexNo!=0){                
			int endIndex = indexNo%2==0?2:1;
			reviewsForUser+=endIndex;     //首先进入reviewsForUser,
		}
		return reviewsForUser;
	}
	

	/*public String getProblemsByReviewForUser(){      //现在值传入了employeeId，还要传入项目编号和评审编号，确定的问题的范围
		ActionContext context = ActionContext.getContext();
		String employeeId = (String) context.getSession().get("employeeId");
		String pProjectId =(String)context.getSession().get("projectId");
		String phaseIduser = context.getSession().get("phaseId").toString();     
		log.info("employeeId="+employeeId);
		log.info("pProjectId="+pProjectId);
		log.info("phaseIduser="+phaseIduser);
		log.info("reviewId="+reviewId);
		problems = problemService.getProblemsByPageAndReviewForUser(pageNo, pageSize,Integer.parseInt(phaseIduser), reviewId, employeeId, pProjectId);
		itemcount = problemService.getCountForUser(Integer.parseInt(phaseIduser),reviewId, employeeId, pProjectId);     //差阶段Id
		log.info("itemcount="+itemcount);
		return "problemReviewForUser";
	}*/
	
	public String getProblemsByCommentForUser()
	{
		ActionContext context = ActionContext.getContext();
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		String commentId = (String) context.getSession().get("commentId");
		String employeeId = (String)context.getSession().get("employeeId");
		problems = problemService.getProblemsByCommentIdForUser(params, employeeId, commentId);
		itemcount = problemService.getProblemsCountByCommentIdForUser(params, employeeId, commentId);
		return "problemsTemplateForUser";
	}

	public int getIndexNo() {
		return indexNo;
	}

	public void setIndexNo(int indexNo) {
		this.indexNo = indexNo;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
