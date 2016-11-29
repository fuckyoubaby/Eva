package com.changhong.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Problemtype;
import com.changhong.entities.Project;
import com.changhong.entities.Structureproblem;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.PhaseService;
import com.changhong.service.ProblemTypeService;
import com.changhong.service.StructureProblemService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("/structureProblemAction")
@Results({
	@Result(name="listProblem",location="/adminEnter/project/structureProblemTemplate.jsp"),
	@Result(name="addNew", location="/adminEnter/project/project_structure_problem_add.jsp"),
	@Result(name="redirectPhaseIndex", type="redirectAction",  params={
			"actionName","problemAction!getReviewByPhaseId",
			"phaseId","${phaseId}"}),
	@Result(name="structureProblemInfo",location="/adminEnter/project/project_structure_problem_info.jsp"),
	@Result(name="updateStructureProblem",location="/adminEnter/project/project_structure_problem_update.jsp"),
	@Result(name="probelmRedirect",type="redirectAction", params={
			"actionName","structureProblemAction!showInfo",
			"structureProblemId","${structureProblemId}"
	})
	
})
public class StructureProblemAction {

	private static final Logger LOG = Logger.getLogger(StructureProblemAction.class);
	
	@Autowired
	private StructureProblemService structureProblemService;
	
	@Autowired
	private PhaseService phaseService;
	@Autowired
	private EmployeeProjectRService employeeProjectRService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ProblemTypeService problemTypeService;
	
	
	/*-- 列表显示传入参数 --*/
	private int pageNo;
	private int pageSize;
	private String orderName;
	private String orderType;
	
	
	
	/*--saveNew() 传入参数 --*/
	private String questionName;
	private String questionBelong;
	private int questionType;
	private double questionScore;
	private String questionDesc;
	private Date createDate;
	
	/*-- showInfo() 传入参数 ---*/
	private int structureProblemId;
	
	/*-- 列表显示返回的值 --*/
	private List<Structureproblem> struProblems;
	private int itemcount;
	
	
	/*addNew() 返回值*/
	private Phase phase;
	private List<Employee> employees;
	
	/* saveNew() 返回值*/
	private String phaseId;
	
	/* showInfo() 返回值 */
	private Structureproblem structureProblem;
	
	/**
	 * 分页显示
	 * @return
	 */
	public String getByPage(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		Project project = (Project)session.get(FinalConstant.SESSION_CURRENT_PROJECT);
		String phaseIdStr = (String)session.get("phaseId");
		int phaseId = Integer.parseInt(phaseIdStr);
		
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		String projectId = project.getProjectId();
		
		if(StringUtils.isNotBlank(projectId)&& phaseId>0){
			struProblems = structureProblemService.getByPage(params, projectId, phaseId);
			itemcount = structureProblemService.getAmountByParams(params, projectId, phaseId);
		}else{
			struProblems = null;
			itemcount = 0;
		}
		return "listProblem";
	}
	
	
	public String addNewOne(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		Project p = (Project)session.get(FinalConstant.SESSION_CURRENT_PROJECT);
		String phaseIdStr = (String)session.get("phaseId");
		int phaseId = Integer.parseInt(phaseIdStr);
		phase = phaseService.getPhase(phaseId);
		employees = employeeProjectRService.getEmployeeByProjectId(p.getProjectId());
		
		return "addNew";
	}
	
	
	public String saveNew(){
		
		Map<String,Object> session = ActionContext.getContext().getSession();
		Project p = (Project)session.get(FinalConstant.SESSION_CURRENT_PROJECT);
		String phaseIdStr = (String)session.get("phaseId");
		int phaId = Integer.parseInt(phaseIdStr);
		Phase phase = phaseService.getPhase(phaId);
		Employee employee = employeeService.getEmployee(questionBelong);
		Problemtype problemtype = problemTypeService.getProblemtype(questionType);
		
		if(phase!=null && employee!=null && problemtype!=null){
			questionScore = questionScore<0? Math.abs(questionScore):questionScore;
			Structureproblem sp = new Structureproblem(p, problemtype, phase, employee, questionName, questionScore, questionDesc, createDate);
			structureProblemService.saveProblem(sp);
		}
		
		phaseId = phaseIdStr;
		return "redirectPhaseIndex";
	}

	public String showInfo(){
		
		structureProblem = structureProblemService.getProblem(structureProblemId);
		
		return "structureProblemInfo";
	}
	
	
	public String deleteProblem(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		String phaseIdStr = (String)session.get("phaseId");
		
		structureProblemService.deleteProblem(structureProblemId);
		phaseId = phaseIdStr;
		return "redirectPhaseIndex";
	}
	
	public String updateProblem(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		Project p = (Project)session.get(FinalConstant.SESSION_CURRENT_PROJECT);
		session.put("structureProblemId", structureProblemId);
		structureProblem = structureProblemService.getProblem(structureProblemId);
		employees = employeeProjectRService.getEmployeeByProjectId(p.getProjectId());
		
		return "updateStructureProblem";
	}
	
	public String saveChange(){
		Map<String,Object> session = ActionContext.getContext().getSession();
		Project p = (Project)session.get(FinalConstant.SESSION_CURRENT_PROJECT);
		int strProblemId = (Integer) session.get("structureProblemId");
		Structureproblem sp = structureProblemService.getProblem(strProblemId);
		Employee e = employeeService.getEmployee(questionBelong);
		Problemtype pt = problemTypeService.getProblemtype(questionType);
		
		questionScore = questionScore<0? Math.abs(questionScore):questionScore;
		LOG.info("questionScore="+questionScore);
		sp.setEmployee(e);
		sp.setName(questionName);
		sp.setProblemtype(pt);
		sp.setScore(questionScore);
		sp.setStrExplain(questionDesc);
		sp.setCreateDate(createDate);
		
		structureProblemService.updateProblem(sp);
		
		setStructureProblemId(strProblemId);
		
		return "probelmRedirect";
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

	public List<Structureproblem> getStruProblems() {
		return struProblems;
	}

	public void setStruProblems(List<Structureproblem> struProblems) {
		this.struProblems = struProblems;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
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


	public String getQuestionName() {
		return questionName;
	}


	public void setQuestionName(String questionName) {
		this.questionName = questionName;
	}


	public String getQuestionBelong() {
		return questionBelong;
	}


	public void setQuestionBelong(String questionBelong) {
		this.questionBelong = questionBelong;
	}


	public int getQuestionType() {
		return questionType;
	}


	public void setQuestionType(int questionType) {
		this.questionType = questionType;
	}


	public double getQuestionScore() {
		return questionScore;
	}


	public void setQuestionScore(double questionScore) {
		this.questionScore = questionScore;
	}


	public String getQuestionDesc() {
		return questionDesc;
	}


	public void setQuestionDesc(String questionDesc) {
		this.questionDesc = questionDesc;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public String getPhaseId() {
		return phaseId;
	}


	public void setPhaseId(String phaseId) {
		this.phaseId = phaseId;
	}


	public int getStructureProblemId() {
		return structureProblemId;
	}


	public void setStructureProblemId(int structureProblemId) {
		this.structureProblemId = structureProblemId;
	}


	public Structureproblem getStructureProblem() {
		return structureProblem;
	}


	public void setStructureProblem(Structureproblem structureProblem) {
		this.structureProblem = structureProblem;
	}

}
