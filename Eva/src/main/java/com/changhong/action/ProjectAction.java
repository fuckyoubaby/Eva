package com.changhong.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Comment;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.entities.Exam;
import com.changhong.entities.Job;
import com.changhong.entities.Phase;
import com.changhong.entities.Problemstate;
import com.changhong.entities.Problemtype;
import com.changhong.entities.Project;
import com.changhong.entities.Review;
import com.changhong.service.CommentService;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.JobService;
import com.changhong.service.PhaseService;
import com.changhong.service.ProblemStateService;
import com.changhong.service.ProblemTypeService;
import com.changhong.service.ProjectService;
import com.changhong.service.ReviewService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.changhong.util.QuestionCount;
import com.opensymphony.xwork2.ActionContext;

@Action("projectAction")

@Results(
		{
			@Result(name="projectByPage",location="/adminEnter/project/projectTemplate.jsp"),
			@Result(name="project",location="/adminEnter/project/project_info.jsp"),
			@Result(name="update",location="/adminEnter/project/project_index.jsp"),
			@Result(name="delete",location="/adminEnter/project/project_index.jsp"),
			@Result(name="save",location="/adminEnter/project/project_index.jsp"),
			@Result(name="employeeForAddProblem",location="/adminEnter/project/project_mistake_add.jsp"),
			@Result(name="all",location="/adminEnter/project/project_add.jsp"),
			@Result(name="forUpdateProject",location="/adminEnter/project/project_info_update.jsp"),
			
			//成员修改主页面
			@Result(name="updateMembers",location="/adminEnter/project/project_members_update.jsp"),
			
			
			@Result(name="projectPageForUser",location="/userEnter/common/projectTemplate.jsp"),
			@Result(name="projectForUser",location="/userEnter/project/project_info.jsp"),
			@Result(name="projectForUserStructor",location="/userEnter/project/project_info_structur.jsp")
		}
		)
	
public class ProjectAction {

	private static final Logger log = LoggerFactory.getLogger(ProjectAction.class);
	@Autowired
	private ProjectService projectService;
	@Autowired
	private PhaseService phaseService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmployeeProjectRService employeeProjectRService;
	@Autowired
	private ReviewService reviewService;
	@Autowired
	private ProblemStateService problemStateService;
	@Autowired
	private ProblemTypeService problemTypeService;
	@Autowired
	private JobService jobService;
	@Autowired
	private CommentService commentService;
	
	private String pageNo;
	private String pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	private List<Project> projects;
	private List<Phase> phases;
	
	private List<Employee> employees;
	
	private List<Review> reviews;
	
	private Project project ;
	private String projectId;
	
	private String projectName;
	private String projectDescribe;
	private Date startTime;
	private Date endTime;
	private String employeeList;
	private String projectManager;
	
	
	
	private Comment comment;
	
	
	private List<Employeeprojectr> employeeprojectrs;
	
	private List<Problemstate> problemstates;
	private List<Problemtype> problemtypes;
	
	private int phaseId;
	private int reviewId;
	
	private List<List<Employee>> employeeLists;
	private List<Job> jobs;
	
	private List<Map<String, Object>> mapList;
	
	private String multiple;
	
	
	private Map<String, List<Employee>> employeeMap;
	
	
	private Map<Integer, QuestionCount> qcMaps;
	
	
	public Map<Integer, QuestionCount> getQcMaps() {
		return qcMaps;
	}
	public void setQcMaps(Map<Integer, QuestionCount> qcMaps) {
		this.qcMaps = qcMaps;
	}
	public Map<String, List<Employee>> getEmployeeMap() {
		return employeeMap;
	}
	public void setEmployeeMap(Map<String, List<Employee>> employeeMap) {
		this.employeeMap = employeeMap;
	}
	public String getMultiple() {
		return multiple;
	}
	public void setMultiple(String multiple) {
		this.multiple = multiple;
	}
	public List<Map<String, Object>> getMapList() {
		return mapList;
	}
	public void setMapList(List<Map<String, Object>> mapList) {
		this.mapList = mapList;
	}
	public List<List<Employee>> getEmployeeLists() {
		return employeeLists;
	}
	public void setEmployeeLists(List<List<Employee>> employeeLists) {
		this.employeeLists = employeeLists;
	}
	public List<Job> getJobs() {
		return jobs;
	}
	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}
	public int getPhaseId() {
		return phaseId;
	}
	public void setPhaseId(int phaseId) {
		this.phaseId = phaseId;
	}
	public int getReviewId() {
		return reviewId;
	}
	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
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
	public List<Review> getReviews() {
		return reviews;
	}
	public void setReviews(List<Review> reviews) {
		this.reviews = reviews;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}
	public List<Employeeprojectr> getEmployeeprojectrs() {
		return employeeprojectrs;
	}
	public void setEmployeeprojectrs(List<Employeeprojectr> employeeprojectrs) {
		this.employeeprojectrs = employeeprojectrs;
	}
	public String getProjectManager() {
		return projectManager;
	}
	public void setProjectManager(String projectManager) {
		this.projectManager = projectManager;
	}
	public String getEmployeeList() {
		return employeeList;
	}
	public void setEmployeeList(String employeeList) {
		this.employeeList = employeeList;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	public String getProjectDescribe() {
		return projectDescribe;
	}
	public void setProjectDescribe(String projectDescribe) {
		this.projectDescribe = projectDescribe;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	public String getPageSize() {
		return pageSize;
	}
	public void setPageSize(String pageSize) {
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
	public List<Project> getProjects() {
		return projects;
	}
	public void setProjects(List<Project> projects) {
		this.projects = projects;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}
	public String getProjectId() {
		return projectId;
	}
	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}
	
	public List<Phase> getPhases() {
		return phases;
	}
	public void setPhases(List<Phase> phases) {
		this.phases = phases;
	}
	
	public String getAllEmployee()
	{
		employeeMap = new HashMap<String, List<Employee>>();
		
		List<Job> jobs = jobService.getJobs();
		for (int i = 0; i < jobs.size(); i++) {
			employees = employeeService.getEmployeesByJobId(jobs.get(i).getJobId());
			employeeMap.put(jobs.get(i).getJobName(), employees);
		}
		
		employees = employeeService.getAllEmployees();
		phases = phaseService.getAll();
		return "all";
	}
	public String getAllForUpdateProject()
	{
		employees = employeeService.getAllEmployees();
		phases = phaseService.getAll();
		project = projectService.getProjectById(projectId);
		employeeprojectrs = employeeProjectRService.getEmployeeprojectrsByProjectId(projectId);
		
		employeeMap = new HashMap<String, List<Employee>>();
		
		List<Job> jobs = jobService.getJobs();
		for (int i = 0; i < jobs.size(); i++) {
			employees = employeeService.getEmployeesByJobId(jobs.get(i).getJobId());
			employeeMap.put(jobs.get(i).getJobName(), employees);
		}
		return "forUpdateProject";
	}
	public String getReviewByPhaseId(){
		log.info("phaseId = "+phaseId);
		reviews = reviewService.getReviewsByPhaseId(phaseId);
		log.info("reviews.size = "+reviews.size());
		JSONArray jsonArray = new JSONArray();
		
		for (int i = 0; i < reviews.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("reviewId", reviews.get(i).getReviewId());
			jsonObject.put("reviewName", reviews.get(i).getReviewName());
			jsonArray.add(jsonObject);
		}
		 HttpServletResponse response = ServletActionContext.getResponse();
		 response.setContentType("application/json");  
         response.setCharacterEncoding("UTF-8");
         PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("jsonArray = "+jsonArray.toString());
         out.print(jsonArray.toString());
         out.flush();
         out.close();
		return "all";
	}
	
	public String getProjectsByPage()
	{
		Integer pno = StringUtils.isEmpty(pageNo)?0:Integer.parseInt(pageNo);
		Integer pSize = StringUtils.isEmpty(pageSize)?5:Integer.parseInt(pageSize);
		Params params = new Params(0, pno, pSize, keyword, orderName, orderType);
		//projects = projectService.getProjectByPage(pno, pSize, keyword);
		//itemcount = projectService.getCount(keyword);
		projects = projectService.getProjectByPage(params);
		itemcount = projectService.getCount(params);
		return "projectByPage";
	}
	public String getProjectById()
	{
		ActionContext context = ActionContext.getContext();
		project = projectService.getProjectById(projectId);
		employeeprojectrs = employeeProjectRService.getEmployeeprojectrsByProjectId(projectId);
		context.getSession().put("project", project);
		phases = phaseService.getAll();
		qcMaps = projectService.getProjectProblemsCount(projectId);
		
		return "project";
	}
	public String save()
	{
		Project project = new Project();
		log.info("projectid = "+projectId);
		if(StringUtils.isBlank(projectId) || StringUtils.isBlank(projectName) || StringUtils.isBlank(projectManager)
				|| StringUtils.isBlank(employeeList)){
			return "save";
		}
		Employee employee = employeeService.getEmployee(projectManager);
		
		if(employee!=null){
			project.setEmployee(employee);
		}else return "save";

		project.setProjectId(projectId);
		project.setProjectName(projectName);
		
		if(startTime!=null){
			project.setStartTime(startTime);
		}
		if(StringUtils.isNotBlank(projectDescribe)){
			project.setIntroduction(projectDescribe);
		}
		
		projectService.save(project);
		
		log.info("employeeList = "+employeeList);
		String[] strA=employeeList.split(",");
		for (int i = 0; i < strA.length; i++) {
			String temp = strA[i].trim();
			if(temp.equals(projectManager)){
				continue;
			}
			Employee employee2 = employeeService.getEmployee(temp);
			if(employee2==null){
				continue;
			}
			Employeeprojectr employeeprojectr = new Employeeprojectr();
			employeeprojectr.setEmployee(employee2);
			employeeprojectr.setProject(project);
			employeeProjectRService.save(employeeprojectr);
		}
		Employeeprojectr employeeprojectr2 = new Employeeprojectr();
		employeeprojectr2.setEmployee(employee);
		employeeprojectr2.setProject(project);
		employeeProjectRService.save(employeeprojectr2);
		
		return "save";
	}
	public String delete()
	{
		Project project = projectService.getProjectById(projectId);
		try{
			if(project!=null){
				projectService.delete(project);
			}
		}catch(Exception e){
			log.debug(e.toString());
			log.debug("删除失败！！");
		}
		return "delete";
	}
	/*public String update()
	{
		ActionContext context = ActionContext.getContext();
		Project project = (Project) context.getSession().get("project");
		if (projectName!=null) {
			project.setProjectName(projectName);
		}
		if (projectDescribe!=null) {
			project.setIntroduction(projectDescribe);
		}
		if (startTime!=null) {
			project.setStartTime(startTime);
		}
		Review review = reviewService.getReview(reviewId);
		project.setReview(review);
		project.setEndTime(endTime);
		projectService.update(project);
		
		
		if (multiple!=null&&!multiple.equals("")) {
			
			List<Employeeprojectr> eps = employeeProjectRService.getEmployeeprojectrsByProjectId(project.getProjectId());
			for (int i = 0; i < eps.size(); i++) {
				employeeProjectRService.delete(eps.get(i));
			}
			
			String[] strA = multiple.split(",");
			for (int i = 0; i < strA.length; i++) {
				Employee employee = employeeService.getEmployee(strA[i].trim());
				Employeeprojectr employeeprojectr = new Employeeprojectr();
				employeeprojectr.setEmployee(employee);
				employeeprojectr.setProject(project);
				employeeProjectRService.save(employeeprojectr);
			}
		}
		if (multiple!=null&&!multiple.equals("")) {
			log.info(multiple);
			List<Employeeprojectr> eps = employeeProjectRService.getEmployeeprojectrsByProjectId(project.getProjectId());
			
			
			String[] strA = multiple.split(",");
			//瀵逛簬鍘熸潵鐨勫弬涓庝汉鍛橈紝濡傛灉鏂板姞鍏ョ殑鍚嶅崟涓病鏈夛紝鍒欒繘琛屽垹闄ゆ搷浣溿�
			if (eps.size()>0) {
				if (eps.get(0)!=null) {
					for (int i = 0; i < eps.size(); i++) {
						if (eps.get(i).getEmployee()!=null) {
							boolean flag = false;
							for (int j = 0; j < strA.length; j++) {
								if (eps.get(i).getEmployee().getId().equals(strA[j].trim())) {
									flag = true;
								}
							}
							if (!flag) {
								employeeProjectRService.delete(eps.get(i));
							}
							log.info("flag = "+flag);
						}
					}
					
				}
			}
			
			
			for (int i = 0; i < strA.length; i++) {
				//瀵规墍鏈夌殑id杩涜鍒ゆ柇锛屽鏋滃凡缁忓瓨鍦ㄥ湪employeeProjectr琛ㄤ腑锛屽垯涓嶅啀娣诲姞锛屽惁鍒欐坊鍔犲埌琛ㄤ腑锛�
				List<Employeeprojectr> eprs = employeeProjectRService.getEmployeeprojectrsByemployeeId(project.getProjectId(), strA[i].trim());
				if (eprs.size()>0) {
					if (eprs.get(0)!=null) {
						log.info("宸茬粡瀛樺湪"+eprs.get(0));
					}else {
						
						Employee employee = employeeService.getEmployee(strA[i].trim());
						Employeeprojectr employeeprojectr = new Employeeprojectr();
						employeeprojectr.setEmployee(employee);
						employeeprojectr.setProject(project);
						
						log.info("eprs.size>0 but eprs(0)=null"+employee.getName());
						
						employeeProjectRService.save(employeeprojectr);
					}
				}else {
					Employee employee = employeeService.getEmployee(strA[i].trim());
					Employeeprojectr employeeprojectr = new Employeeprojectr();
					employeeprojectr.setEmployee(employee);
					employeeprojectr.setProject(project);
					
					log.info("eprs.size=0 "+employee.getName());
					
					employeeProjectRService.save(employeeprojectr);
				}
				
				
			}
			
			//鍦ㄤ笂闈㈢殑鍒犻櫎鎿嶄綔涓細鎶婇」鐩粡鐞嗗悓鏃跺垹闄わ紝瑕佹妸椤圭洰缁忕悊閲嶆柊娣诲姞杩涘幓    鍏堝垽鏂槸鍚﹀凡缁忔坊鍔犺繘鍘讳簡锛�
			List<Employeeprojectr> eprs = employeeProjectRService.getEmployeeprojectrsByemployeeId(project.getProjectId(), project.getEmployee().getId());
			if (eprs.size()>0) {
				if (eprs.get(0)!=null) {
					
				}else {
					Employeeprojectr epr = new Employeeprojectr();
					epr.setEmployee(project.getEmployee());
					epr.setProject(project);
					employeeProjectRService.save(epr);
				}
			}else {
				Employeeprojectr epr = new Employeeprojectr();
				epr.setEmployee(project.getEmployee());
				epr.setProject(project);
				employeeProjectRService.save(epr);
			}
			
			
		}
		
		
		
		
		return "update";
	}*/
	
	public String update()
	{
		ActionContext context = ActionContext.getContext();
		Project project = (Project) context.getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		if (projectName!=null) {
			project.setProjectName(projectName);
		}
		if (projectDescribe!=null) {
			project.setIntroduction(projectDescribe);
		}
		if (startTime!=null) {
			project.setStartTime(startTime);
		}
		
		Review review = reviewService.getReview(reviewId);
		if(review!=null){
			project.setReview(review);
		}
		if(endTime!=null){
			project.setEndTime(endTime);
		}
		Employee e = employeeService.getEmployee(projectManager);
		if(e!=null){
			project.setEmployee(e);
		}
		projectService.update(project);
		context.getSession().put(FinalConstant.SESSION_CURRENT_PROJECT,project);
		return "update";
	}

	/**
	 * 进入
	 * @return
	 */
	public String updateMembers(){
		Project p = (Project) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		if(p==null){
			return "update";
		}
		List<Employee> empLists = employeeProjectRService.getEmployeeByProjectId(p.getProjectId());
		setEmployees(empLists);
		return "updateMembers";
	}
	
	public String getEmployeeForAddProblem()
	{
		ActionContext context = ActionContext.getContext();
		Project p = (Project) context.getSession().get("project");
		employees = employeeProjectRService.getEmployeeByProjectId(p.getProjectId());

		/*
		 * 加入设计评审（电路评审）后
		phases = phaseService.getAll();
		reviews = reviewService.getAllReview();
		*/
		String commentId = (String) context.getSession().get("commentId");
		comment = commentService.getEntity(commentId);
		problemstates = problemStateService.getList();
		problemtypes = problemTypeService.getProblemtypes();
		return "employeeForAddProblem";
	}
	
	
	
	public String getPorjectByEmployeeId(){
		
		log.info("getprojectbYemployeeid");
		
		
		
		Integer pno = StringUtils.isEmpty(pageNo)?0:Integer.parseInt(pageNo);
		Integer pSize = StringUtils.isEmpty(pageSize)?5:Integer.parseInt(pageSize);
		ActionContext context = ActionContext.getContext();
		String employeeId = (String) context.getSession().get("employeeId");
		//projects = projectService.getProjectByPageForUser(pno, pSize, keyword, employeeId);
		//itemcount = projectService.getCountForUser(keyword, employeeId);
		/*employeeprojectrs = employeeProjectRService.getEmployeeprojectrsByPageFouUser(pno, pSize, keyword, employeeId);
		itemcount = employeeProjectRService.getCountForUser(keyword, employeeId);*/
		log.info("pageNo ="+pno+"    pagesize = "+pSize+" employeeId = "+employeeId+" keyword = "+keyword);
		Params params = new Params(0, pno, pSize, keyword, orderName, orderType);
		employeeprojectrs = employeeProjectRService.getEmployeeprojectrsByPageFouUser(params, employeeId);
		itemcount = employeeProjectRService.getCountForUser(params, employeeId);
		log.info("itemcount = "+itemcount);
		return "projectPageForUser";
	}
	
	public String getProjectByIdForUser()
	{
		ActionContext context = ActionContext.getContext();
		project = projectService.getProjectById(projectId);
		context.getSession().put("project", project);
		employeeprojectrs = employeeProjectRService.getEmployeeprojectrsByProjectId(projectId);
		phases = phaseService.getAll();
		qcMaps = projectService.getEmpProjectProblemsCount(projectId, context.getSession().get("employeeId").toString());
		String employeeId = (String) context.getSession().get("employeeId");
		Employee em = employeeService.getEmployee(employeeId);
		if (em!=null) {
			if (em.getJob()!=null) {
				if (em.getJob().getJobName().indexOf("结构")!=-1) {
					return "projectForUserStructor";
				}
				else {
					return "projectForUser";
				}
			}else {
				return "projectForUser";
			}
		}else {
			return "projectForUser";
		}
	}
	public Comment getComment() {
		return comment;
	}
	public void setComment(Comment comment) {
		this.comment = comment;
	}
}
