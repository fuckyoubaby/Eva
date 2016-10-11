package com.changhong.action;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.changhong.entities.Employee;
import com.changhong.entities.Employeeprojectr;
import com.changhong.entities.Project;
import com.changhong.service.EmployeeProjectRService;
import com.changhong.service.EmployeeService;
import com.changhong.service.ProjectService;
import com.changhong.support.FinalConstant;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

@ParentPackage("jsonPackage")
@Action("ajaxRequestAction")
@Scope("prototype")
@Results({
	@Result(name="success",type="json",params={"excludeNullProperties","true","root","result"})
})
@InterceptorRef("mydefault")
public class AjaxRequestAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private static final Logger log = Logger.getLogger(FileProcessAction.class);
	
	
	@Autowired
	private EmployeeProjectRService employeeProjectServiceImpl;
	@Autowired
	private EmployeeService employeeServiceImpl;
	@Autowired
	private ProjectService projectServiceImpl;
	
	private String projectId;
	
	private String employeeId;
	
	private String projectName;
	
	private JSONObject result;
	
	
	
	public String listEmployees(){
		//log.info(projectId);
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(projectId)){
			obj.put("result", "fail");
			obj.put("msg", "参数为空");
			setResult(obj);
			return SUCCESS;
		}
		List<Employeeprojectr> lists = employeeProjectServiceImpl.getEmployeeprojectrsByProjectId(projectId);
		if(lists==null | lists.size()<1){
			obj.put("result", "fail");
			obj.put("msg", "员工列表为空");
			setResult(obj);
			return SUCCESS;
		}
		JSONArray employeeArray = new JSONArray();
		for(int i=0;i<lists.size();i++){
			Employeeprojectr epr = lists.get(i);
			JSONObject emp = new JSONObject();
			emp.put("employeeId", epr.getEmployee().getId());
			emp.put("employeeName",epr.getEmployee().getName());
			employeeArray.add(emp);
		}
		
		obj.put("result", "success");
		obj.put("employees", employeeArray);
		//log.info(obj.toString());
		setResult(obj);
		
		return SUCCESS;
	}
	
	public String checkEmpId(){
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(employeeId)){
			obj.put("valid", false);
			setResult(obj);
			return SUCCESS;
		}
		Employee e = employeeServiceImpl.getEmployee(employeeId);
		if(e==null){
			obj.put("valid", true);
		}else{
			obj.put("valid", false);
		}
		setResult(obj);
		return SUCCESS;
	}
	
	public String checkProjectId(){
		log.info("projectId=="+projectId);
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(projectId)){
			obj.put("valid", false);
			setResult(obj);
			return SUCCESS;
		}
		Project p = projectServiceImpl.getProjectById(projectId);
		if(p==null){
			obj.put("valid", true);
		}else{
			obj.put("valid", false);
		}
		setResult(obj);
		return SUCCESS;
	}
	
	public String checkProjectName(){
		log.info("projectName=="+projectName);
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(projectName)){
			obj.put("valid", false);
			setResult(obj);
			return SUCCESS;
		}
		int amount = projectServiceImpl.getCountForProjectName(projectName);
		if(amount<1){
			obj.put("valid", true);
		}else{
			obj.put("valid", false);
		}
		setResult(obj);
		return SUCCESS;
	}
	
	/**
	 * 更新项目名称时，检测名称是否可用
	 * @return
	 */
	public String checkNewProjectName(){
		log.info("projectName=="+projectName);
		JSONObject obj = new JSONObject();
		Project p = (Project) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		if(StringUtils.isBlank(projectName)){
			obj.put("valid", false);
			setResult(obj);
			return SUCCESS;
		}
		if(projectName.trim().equals(p.getProjectName())){
			obj.put("valid", true);
			setResult(obj);
			return SUCCESS;
		}
		
		int amount = projectServiceImpl.getCountForProjectName(projectName);
		if(amount<1){
			obj.put("valid", true);
		}else{
			obj.put("valid", false);
		}
		setResult(obj);
		return SUCCESS;
	}
	
	/**
	 * 添加新的项目成员
	 * @return
	 */
	public String addMembers(){
		//更新参与的项目成员
		Employee e = employeeServiceImpl.getEmployee(employeeId);
		Project p = (Project) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		JSONObject obj = new JSONObject();
		int size = employeeProjectServiceImpl.getEmployeeprojectrsByemployeeId(p.getProjectId(), employeeId).size();
		if(size==0){
			Employeeprojectr epr = new Employeeprojectr(p, e); 
			employeeProjectServiceImpl.save(epr);
		}
		obj.put("result", "success");
		setResult(obj);
		return SUCCESS;
	}
	/**
	 * 移除项目成员
	 * @return
	 */
	public String removeMember(){
		//更新参与的项目成员
		Project p = (Project) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		JSONObject obj = new JSONObject();
		if(StringUtils.isNotBlank(employeeId)){
			setEmployeeId(employeeId.trim());
		}
		boolean b = employeeProjectServiceImpl.delete(employeeId, p.getProjectId());
		if(b){
			if(employeeId.equals(p.getEmployee().getId())){
				p.setEmployee(null);
				projectServiceImpl.update(p);
			}
		}
		String resultStr = b?"success":"fail";
		obj.put("result", resultStr);
		if(!b){
			obj.put("msg","失败！请清空员工评审项后再删除");
		}
		setResult(obj);
		return "success";
	}
	
	
	
	public String getProjectId() {
		return projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	
	
	public static void main(String[] args) {
		//System.out.println(StringUtils.isNotBlank("11004346"));
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
}
