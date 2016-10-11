package com.changhong.action;

import java.util.Date;
import java.util.List;

import net.sf.json.JSONObject;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
import com.changhong.entities.Projectreview;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.PhaseService;
import com.changhong.service.ProjectReviewService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.changhong.util.RegUtil;
import com.opensymphony.xwork2.ActionContext;
import com.utility.date.DateUtils;

@ParentPackage("jsonPackage")
@Action("projectReviewAction")
@Scope("prototype")
@Results({
		@Result(name = "projectReviewInfos", location = "/adminEnter/project/pr_problemTemplate.jsp"),

		@Result(name = "projectReviewInfosForUser", location = "/userEnter/project/pr_problemTemplate.jsp"),

		@Result(name = "showProReviewItem", location = "/adminEnter/project/project_review_mistake_info.jsp"),
		@Result(name = "updateProReviewItem", location = "/adminEnter/project/project_review_mistake_update.jsp"),
		@Result(name = "addProReviewItem", location = "/adminEnter/project/project_review_mistake_add.jsp"),
		@Result(name = "saveNewItem", type = "json", params = {
				"excludeNullProperties", "true", "root", "jsonResult" }),
		@Result(name = "redirectProblem", type = "redirectAction", params = {
				"actionName", "problemAction!getReviewByPhaseId", "phaseId",
				"${phaseId}", "indexNo", "${phaseId *2}", "message",
				"${message}" }),
// redirect传值时message不能传递出去，只能使用redirectAction
// @Result(name="redirectProblem1",type="redirect",location="/problemAction!getReviewByPhaseId.action?phaseId=${phaseId}&amp;indexNo=${phaseId * 2}&amp;message=${message} "),
})
@InterceptorRef(value = "mydefault")
public class ProjectReviewAction {

	private static final Logger log = LoggerFactory
			.getLogger(ProjectAction.class);

	@Autowired
	private ProjectReviewService projectReviewServiceImpl;

	@Autowired
	private EmployeeProjectRService employeeProjectRServiceImpl;

	@Autowired
	private PhaseService phaseServiceImpl;

	/**
	 * 项目阶段Id
	 */
	private int phaseId;
	/**
	 * 页码
	 */
	private int pageNo;
	/**
	 * 页容量
	 */
	private int pageSize;
	/**
	 * 关键字
	 */
	private String keyword;
	/**
	 * 记录总数
	 */
	private int itemcount;
	/**
	 * 排序字段
	 */
	private String orderName;
	/**
	 * 排序方式
	 */
	private String orderType;

	/**
	 * 项目评审问题列表
	 */
	private List<Projectreview> projectReviews;

	/**
	 * 项目评审项Id
	 */
	private Integer proReviewId;
	/**
	 * 项目评审对象
	 */
	private Projectreview projectReview;

	/**
	 * 项目员工信息
	 */
	private List<Employee> employees;

	/**
	 * 项目阶段列表
	 */
	private List<Phase> phases;

	// start the add/update page form parameters
	private int projectReviewId;
	private String employeeId;

	private String prdate;
	// private int phaseId; 重复命名
	private int designReg;
	private int flowsheetReg;
	private int workplan;
	private int communication;
	private int workEnt;
	private String prexplain;

	// end the add/update page form parameters
	/**
	 * AJAX请求结果传递
	 */
	private JSONObject jsonResult;
	/**
	 * 回显结果信息时使用
	 */
	private String message;

	/**
	 * 项目评审项的分页处理
	 * 
	 * @return
	 */
	public String getPRItemsByPhaseId() {
		log.info("phaseId==" + phaseId);
		ActionContext context = ActionContext.getContext();
		Project project = (Project) context.getSession().get(
				FinalConstant.SESSION_CURRENT_PROJECT);
		Params params = new Params(0, pageNo, pageSize, keyword, orderName,
				orderType);
		if (phaseId < 1) {
			projectReviews = null;
			itemcount = 0;
		} else {
			projectReviews = projectReviewServiceImpl
					.getProjectreviewsByProjectIdForPage(params,
							project.getProjectId(), phaseId);
			itemcount = projectReviewServiceImpl.getAmountByProjectIdForPage(
					params, project.getProjectId(), phaseId);
		}
		return "projectReviewInfos";
	}

	/**
	 * 项目评审项信息展示请求处理
	 * 
	 * @return
	 */
	public String getReviewInfoById() {
		log.info(proReviewId + "---");
		setProjectReview(projectReviewServiceImpl.getByPRId(proReviewId));
		return "showProReviewItem";
	}

	/**
	 * 处理项目评审新增请求
	 * 
	 * @return
	 */
	public String addProblem() {
		Project p = (Project) ActionContext.getContext().getSession()
				.get(FinalConstant.SESSION_CURRENT_PROJECT);
		List<Phase> phaseLists = phaseServiceImpl.getAll();
		setEmployees(employeeProjectRServiceImpl.getEmployeeByProjectId(p
				.getProjectId()));
		setPhases(phaseLists);
		return "addProReviewItem";
	}

	/**
	 * 保存新的评审记录
	 * 
	 * @return
	 */
	public String saveNewProblem() {
		Project project = (Project) ActionContext.getContext().getSession()
				.get(FinalConstant.SESSION_CURRENT_PROJECT);
		JSONObject obj = new JSONObject();

		Date date = null;
		if (RegUtil.isTrueShortDate(prdate)) {
			date = DateUtils.parse(prdate, "yyyy-MM-dd");
		} else
			date = new Date();
		try {
			obj = projectReviewServiceImpl.save(phaseId, project, employeeId,
					designReg, flowsheetReg, workplan, communication, workEnt,
					prexplain, date);
			setJsonResult(obj);
			return "saveNewItem";
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("reuslt", "fail");
			obj.put("msg", "执行出错");
			setJsonResult(obj);
			return "saveNewItem";
		}

	}

	// 客户端信息展示，projectId,employeeId,phaseId,不需要传入reviewId
	public String getPRItemsByPhaseIdForUser() {
		ActionContext context = ActionContext.getContext();
		String employeeId = (String) context.getSession().get("employeeId");
		String pProjectId = (String) context.getSession().get("projectId");
		String phaseIduser = context.getSession().get("phaseId").toString();
		projectReviews = projectReviewServiceImpl
				.getProjectreviewsByProjectIdForPageForUser(pageNo, pageSize,
						pProjectId, Integer.parseInt(phaseIduser), employeeId);
		itemcount = projectReviewServiceImpl
				.getAmountByProjectIdForPageForUser(pProjectId,
						Integer.parseInt(phaseIduser), employeeId);
		return "projectReviewInfosForUser";
	}

	public String deleteById() {
		try {
			projectReviewServiceImpl.delete(proReviewId);
		} catch (Exception e) {
			e.printStackTrace();
			setMessage("删除失败！");
			return "redirectProblem";
		}
		setMessage("删除成功!");
		return "redirectProblem";
	}

	/**
	 * 处理项目评审信息更新请求
	 * 
	 * @return
	 */
	public String updatePRItem() {

		setProjectReview(projectReviewServiceImpl.getByPRId(proReviewId));
		List<Phase> phaseLists = phaseServiceImpl.getAll();
		Project p = projectReview.getProject();
		if (p == null) {
			p = projectReviewServiceImpl.getProjectById(projectReview
					.getProjectReviewId());
		}
		setEmployees(employeeProjectRServiceImpl.getEmployeeByProjectId(p
				.getProjectId()));
		setPhases(phaseLists);
		return "updateProReviewItem";

	}

	/**
	 * 保存项目评审修改的信息
	 * 
	 * @return
	 */
	public String saveChanges() {
		Project project = (Project) ActionContext.getContext().getSession()
				.get(FinalConstant.SESSION_CURRENT_PROJECT);
		JSONObject obj = new JSONObject();

		Date date = null;
		if (RegUtil.isTrueShortDate(prdate)) {
			date = DateUtils.parse(prdate, "yyyy-MM-dd");
		} else
			date = new Date();
		try {
			obj = projectReviewServiceImpl.update(projectReviewId, phaseId,
					project, employeeId, designReg, flowsheetReg, workplan,
					communication, workEnt, prexplain, date);
			setJsonResult(obj);
			return "saveNewItem";
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("reuslt", "fail");
			obj.put("msg", "执行出错");
			setJsonResult(obj);
			return "saveNewItem";
		}

	}

	public int getPhaseId() {
		return phaseId;
	}

	public void setPhaseId(int phaseId) {
		this.phaseId = phaseId;
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

	public List<Projectreview> getProjectReviews() {
		return projectReviews;
	}

	public void setProjectReviews(List<Projectreview> projectReviews) {
		this.projectReviews = projectReviews;
	}

	public Projectreview getProjectReview() {
		return projectReview;
	}

	public void setProjectReview(Projectreview projectReview) {
		this.projectReview = projectReview;
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

	public Integer getProReviewId() {
		return proReviewId;
	}

	public void setProReviewId(Integer proReviewId) {
		this.proReviewId = proReviewId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getPrdate() {
		return prdate;
	}

	public void setPrdate(String prdate) {
		this.prdate = prdate;
	}

	public int getDesignReg() {
		return designReg;
	}

	public void setDesignReg(int designReg) {
		this.designReg = designReg;
	}

	public int getFlowsheetReg() {
		return flowsheetReg;
	}

	public void setFlowsheetReg(int flowsheetReg) {
		this.flowsheetReg = flowsheetReg;
	}

	public int getWorkplan() {
		return workplan;
	}

	public void setWorkplan(int workplan) {
		this.workplan = workplan;
	}

	public int getCommunication() {
		return communication;
	}

	public void setCommunication(int communication) {
		this.communication = communication;
	}

	public int getWorkEnt() {
		return workEnt;
	}

	public void setWorkEnt(int workEnt) {
		this.workEnt = workEnt;
	}

	public String getPrexplain() {
		return prexplain;
	}

	public void setPrexplain(String prexplain) {
		this.prexplain = prexplain;
	}

	public int getProjectReviewId() {
		return projectReviewId;
	}

	public void setProjectReviewId(int projectReviewId) {
		this.projectReviewId = projectReviewId;
	}

	public JSONObject getJsonResult() {
		return jsonResult;
	}

	public void setJsonResult(JSONObject jsonResult) {
		this.jsonResult = jsonResult;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
}
