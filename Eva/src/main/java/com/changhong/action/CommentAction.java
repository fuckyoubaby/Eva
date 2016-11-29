package com.changhong.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Comment;
import com.changhong.entities.CommentExt;
import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
import com.changhong.service.CommentService;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.PhaseService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.changhong.util.RegUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.inject.util.FinalizableSoftReference;


@Action("/commentAction")
@Results({
	@Result(name="commentTemplate", location ="/adminEnter/project/projectCommentTemplate.jsp"),
	@Result(name="commentInfo", location="/adminEnter/project/project_comment_info.jsp"),
	
	@Result(name="addComment", location="/adminEnter/project/project_comment_add.jsp"),
	@Result(name="commentIndex", type="redirectAction", params={
			"actionName","problemAction!getReviewByPhaseId",
			"phaseId","${phaseId}" }),
	@Result(name="commentUpdate",location="/adminEnter/project/project_comment_update.jsp"),
	@Result(name="toCommentInfo",type="redirectAction", params={
			"actionName","commentAction!getInfoById.action",
			"id","${id}" }),
			
	@Result(name="commentTemplateForUser",location="/userEnter/project/projectCommentTemplate.jsp"),
	@Result(name="commentInfoForUser", location="/userEnter/project/project_comment_info.jsp")
})
public class CommentAction {
	
	private static final Logger LOG = LoggerFactory.getLogger(CommentAction.class);
	
	@Autowired
	private CommentService commentService;
	
	@Autowired
	private PhaseService phaseService;
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private EmployeeProjectRService employeeProjectRService;
	
	
	private List<Employee> employees;
	
	private String commentEmployee;//评审责任人
	//请求参数区域
	/* getCommentsByProjectAndPhase() 参数区域 */
	private int pageNo;
	private int pageSize;
	private String orderName;
	private String orderType;
	
	/* getCommentsByProjectAndPhase() 请求参数*/
	private String id;
	
	/* saveComment() 请求参数 */
	private String commentName;
	private Date commentDate;
	
	
	//返回值区域
	/* getCommentsByProjectAndPhase() 返回值区域*/
	private List<Comment> commentLists;
	private int itemCount;
	
	/* getCommentsByProjectAndPhase() 返回值区域*/
	private Comment comment;
	/* addNewComment() 返回值区域 */
	private Phase phase;
	
	/* saveComment() 返回值 */
	private String phaseId;
	
	private List<CommentExt> commentExts;
	
	private Employee employee;

	
	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public List<CommentExt> getCommentExts() {
		return commentExts;
	}

	public void setCommentExts(List<CommentExt> commentExts) {
		this.commentExts = commentExts;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	
	public String getCommentEmployee() {
		return commentEmployee;
	}

	public void setCommentEmployee(String commentEmployee) {
		this.commentEmployee = commentEmployee;
	}

	public String getCommentsByProjectAndPhase(){
		ActionContext context = ActionContext.getContext();
		Project project = (Project) context.getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		String phaseId = (String) context.getSession().get("phaseId");
		int phaseIdInt = Integer.parseInt(phaseId);
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		List<Comment> comments = commentService.getCommentsByPhaseForProject(params, phaseIdInt, project.getProjectId());
		commentExts = new ArrayList<CommentExt>();
		for (int i = 0; i <comments.size(); i++) {
			CommentExt commentExt = new CommentExt();
			
			Employee employee = employeeService.getEmployee(comments.get(i).getEmployeeId());
			
			commentExt.setComment(comments.get(i));
			commentExt.setName(employee.getName());
			
			commentExts.add(commentExt);
		}
		//setCommentLists(commentService.getCommentsByPhaseForProject(params, phaseIdInt, project.getProjectId()));
		setItemCount(commentService.getCommentsCountByPhaseForProject(params, phaseIdInt, project.getProjectId()));
		return "commentTemplate";
	}
	
	public String getInfoById(){
		Comment c = commentService.getEntity(id);
		ActionContext.getContext().getSession().put("commentId", id);
		if(c!=null){
			setComment(c);
			if (c.getEmployeeId()!=null) {
				employee = employeeService.getEmployee(c.getEmployeeId());
			}
		}
		
		return "commentInfo";
	}
	
	public String addNewComment(){
		String phaseId = (String) ActionContext.getContext().getSession().get("phaseId");
		if(RegUtil.isNumber(phaseId)){
			int pId = Integer.parseInt(phaseId);
			setPhase(phaseService.getPhase(pId));
		}
		ActionContext context = ActionContext.getContext();
		Project p = (Project) context.getSession().get("project");
		employees = employeeProjectRService.getEmployeeByProjectId(p.getProjectId());
		//employees = employeeService.getAllEmployees();
		return "addComment";
	}
	
	public String saveComment(){
		ActionContext context = ActionContext.getContext();
		String phId = (String) context.getSession().get("phaseId");
		Project project = (Project) context.getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		Phase phaseExamp = null;
		if(RegUtil.isNumber(phId)){
			int pId = Integer.parseInt(phId);
			phaseExamp = phaseService.getPhase(pId); 
			if(phaseExamp!=null && project!=null && StringUtils.isNotBlank(commentName) && commentDate!=null){
				Comment c = new Comment(project, phaseExamp, commentName, commentDate,commentEmployee);
				commentService.saveEntity(c);
			}
		}
		setPhaseId(phId);
		
		return "commentIndex";
	}
	
	public String getInfoUpdate(){
		Comment c = commentService.getEntity(id);
		String phaseId = (String) ActionContext.getContext().getSession().get("phaseId");
		if(c!=null){
			setComment(c);
		}
		if(RegUtil.isNumber(phaseId)){
			int pId = Integer.parseInt(phaseId);
			setPhase(phaseService.getPhase(pId));
		}
		return "commentUpdate";
	}
	
	public String updateComment(){
		if(StringUtils.isNotBlank(id)){
		 Comment c = commentService.getEntity(id);
		 if(c!=null){
			 if(StringUtils.isNotBlank(commentName)){
				 int length = commentName.length();
				 if(length>=2 && length<=16){
					 c.setName(commentName);
				 }
			 }
			 if(commentDate!=null){
				 c.setDate(commentDate);
			 }
			 commentService.updateEntity(c);
		 }
		}
		return "toCommentInfo";
	}
	
	public String deleComment(){
		if(StringUtils.isNotBlank(id)){
			commentService.deleteEntity(id);
		}
		setPhaseId((String)ActionContext.getContext().getSession().get("phaseId"));
		return "commentIndex";
	}
	
	public String getCommentsByProjectAndPhaseForUser(){
		ActionContext context = ActionContext.getContext();
		Project project = (Project) context.getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		String phaseId = (String) context.getSession().get("phaseId");
		int phaseIdInt = Integer.parseInt(phaseId);
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		
		setCommentLists(commentService.getCommentsByPhaseForProject(params, phaseIdInt, project.getProjectId()));
		setItemCount(commentService.getCommentsCountByPhaseForProject(params, phaseIdInt, project.getProjectId()));
		return "commentTemplateForUser";
	}
	
	public String getInfoByIdForUser(){
		Comment c = commentService.getEntity(id);
		ActionContext.getContext().getSession().put("commentId", id);
		if(c!=null){
			setComment(c);
		}
		return "commentInfoForUser";
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

	public List<Comment> getCommentLists() {
		return commentLists;
	}

	public void setCommentLists(List<Comment> commentLists) {
		this.commentLists = commentLists;
	}

	public int getItemCount() {
		return itemCount;
	}

	public void setItemCount(int itemCount) {
		this.itemCount = itemCount;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	public Phase getPhase() {
		return phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	public String getCommentName() {
		return commentName;
	}

	public void setCommentName(String commentName) {
		this.commentName = commentName;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void setCommentDate(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getPhaseId() {
		return phaseId;
	}

	public void setPhaseId(String phaseId) {
		this.phaseId = phaseId;
	}

	
}
