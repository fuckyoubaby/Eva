package com.changhong.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Department;
import com.changhong.entities.Employee;
import com.changhong.entities.Job;
import com.changhong.service.DepartmentService;
import com.changhong.service.EmployeeService;
import com.changhong.service.JobService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.changhong.util.RegUtil;
import com.opensymphony.xwork2.ActionContext;

@Action("employeeAction")
@Results(
		{
			@Result(name="success",location="/success.jsp"),
			@Result(name="fail",location="/login.jsp"),
			@Result(name="admin",location="/adminEnter/main.jsp"),
			@Result(name="employeelogin",location="/userEnter/main.jsp"),
			
			@Result(name="allForTrain",location="/adminEnter/training/training_add.jsp"),
			@Result(name="employeesPage",location="/adminEnter/employee/employeeTemplate.jsp"),
			@Result(name="employeesMembersPage",location="/adminEnter/project/projectEmployeeTemplate.jsp"),
			@Result(name="employee",location="/adminEnter/employee/employee_info.jsp"),
			@Result(name="employeeForUser",location="/userEnter/common/employee_info.jsp"),
			@Result(name="employeeForUpdate",location="/adminEnter/employee/employee_update.jsp"),
			@Result(name="save",location="/adminEnter/employee/employees_index.jsp"),
			@Result(name="update",location="/adminEnter/employee/employees_index.jsp"),
			@Result(name="subupdate",location="/adminEnter/employee/employee_update.jsp"),
			@Result(name="jobList",location="/adminEnter/employee/employee_add.jsp"),
			@Result(name="logout",location="/login.jsp"),
			@Result(name="updatePassword",location="/success.jsp")
		}
		)
public class EmployeeAction {

	private static final Logger log = LoggerFactory.getLogger(EmployeeAction.class);
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private JobService jobService;
	@Autowired
	private DepartmentService departmentService;
	
	private String userName;
	private String password;
	private String type;
	private String message;
	private List<Employee> employees;
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	private String employeeId;
	private Employee employee;
	
	
	private String employeeName;
	private String sex;
	private String jobPosition;
	private String employeeLocation;
	private String phoneNum;
	private String shortPhone;
	private String email;
	
	private List<Job> jobs;
	
	private String chkName;
	
	private String oldPassword;
	private String newPassword;
	
	private String emergencyName;
	private String emergencyTel;
	
	private List<Department> departments;
	private int departmentId;
	
	private int permission;
	
	
	
	public int getPermission() {
		return permission;
	}

	public void setPermission(int permission) {
		this.permission = permission;
	}

	public List<Department> getDepartments() {
		return departments;
	}

	public void setDepartments(List<Department> departments) {
		this.departments = departments;
	}

	public int getDepartmentId() {
		return departmentId;
	}

	public void setDepartmentId(int departmentId) {
		this.departmentId = departmentId;
	}

	public String getEmergencyName() {
		return emergencyName;
	}

	public void setEmergencyName(String emergencyName) {
		this.emergencyName = emergencyName;
	}

	public String getEmergencyTel() {
		return emergencyTel;
	}

	public void setEmergencyTel(String emergencyTel) {
		this.emergencyTel = emergencyTel;
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

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String test()
	{
		return "success";
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

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getJobPosition() {
		return jobPosition;
	}

	public void setJobPosition(String jobPosition) {
		this.jobPosition = jobPosition;
	}

	public String getEmployeeLocation() {
		return employeeLocation;
	}

	public void setEmployeeLocation(String employeeLocation) {
		this.employeeLocation = employeeLocation;
	}

	public String getPhoneNum() {
		return phoneNum;
	}

	public void setPhoneNum(String phoneNum) {
		this.phoneNum = phoneNum;
	}

	
	public String getShortPhone() {
		return shortPhone;
	}

	public void setShortPhone(String shortPhone) {
		this.shortPhone = shortPhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<Job> getJobs() {
		return jobs;
	}

	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
	}
	

	public String getChkName() {
		return chkName;
	}

	public void setChkName(String chkName) {
		this.chkName = chkName;
	}

	public String login()
	{
		ActionContext context = ActionContext.getContext();
		log.info("userName "+userName);
		if(!employeeService.isExist(userName))
		{
			message="用户名不存在";
			return "fail";
		}else
		{
			Employee employee = employeeService.login(userName, password);
			context.getSession().put("loginer", employee);
			if (employee!=null) {
				if (employee.getPermission()==null) {
					return "fail";
				}else {
					if (employee.getPermission()==FinalConstant.SYSTEM_ADMIN||employee.getPermission()==FinalConstant.SUPER_ADMIN) {
						List<Integer> list = employeeService.getAllNum(FinalConstant.SYSTEM_ADMIN, null);
						context.getSession().put("list", list);
						context.getSession().put("employee", employee);
						if(list!=null&list.size()>1){
							log.info("list = "+list.get(0)+" "+list.get(1)+" ");
						}
						return "admin";
					}else if(employee.getPermission()==FinalConstant.SYSTEM_USER)
					{
						List<Integer> list = employeeService.getAllNum(FinalConstant.SYSTEM_USER, userName);
						context.getSession().put("list", list);
						context.getSession().put("employee", employee);
						context.getSession().put("employeeId", employee.getId());
						return "employeelogin";
					}else {
						return "fail";
					}
				}
				
			}else {
				message="密码错误";
				return "fail";
			}
			
		}
	}
	
	public String getAllForTrain()
	{
		employees = employeeService.getAllEmployees();
		return "allForTrain";
	}
	
	public String getEmployeesByPage()
	{
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		employees = employeeService.getEmployeesByPage(params);
		itemcount = employeeService.getCount(params);
		return "employeesPage";
	}
	public String getMembersByPage()
	{
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		employees = employeeService.getEmployeesByPage(params);
		itemcount = employeeService.getCount(params);
		return "employeesMembersPage";
	}
	
	public String getEmployeeById()
	{
		employee = employeeService.getEmployee(employeeId);
		return "employee";
	}
	public String getEmployeeByIdForUpdate()
	{
		employee = employeeService.getEmployee(employeeId);
		ActionContext context = ActionContext.getContext();
		context.getSession().put("employee", employee);
		jobs = jobService.getJobs();
		departments = departmentService.getAllList();
		log.info("jobs size = "+jobs.size());
		return "employeeForUpdate";
	}
	public String update()
	{
		ActionContext context = ActionContext.getContext();
		Employee employee = (Employee) context.getSession().get("employee");
		
		employee.setAddress(employeeLocation);
		
		
		return "update";
	}
	
	public String save()
	{
		Job job = jobService.getJob(Integer.parseInt(jobPosition));
		if(StringUtils.isBlank(employeeId) || StringUtils.isBlank(employeeName)){
			return "save";
		}
		Employee employee = new Employee();
		employee.setAddress(employeeLocation);
		employee.setEmail(email);
		employee.setJob(job);
		employee.setName(employeeName);
		employee.setId(employeeId);
		employee.setPhone(phoneNum);
		employee.setVPhone(shortPhone);
		employee.setPassword(employeeId.substring(employeeId.length()-4,employeeId.length()));
		employee.setPermission(1);
		employeeService.save(employee);
		return "save";
	}
	public String updateEmployeeSexAndArea()
	{
		ActionContext context = ActionContext.getContext();
		employee = (Employee) context.getSession().get("employee");
		int nullNum = 0;
		int equalNum = 0;
		
		if(StringUtils.isNotBlank(sex)){
			/*if(employee.getSex().equalsIgnoreCase(sex)){
				equalNum++;
			}else*/ employee.setSex(sex);
		}else nullNum++;
		
		if(StringUtils.isNotBlank(employeeLocation)){
			/*if(employee.getAddress().equals(employeeLocation)){
				equalNum++;
			}else*/ employee.setAddress(employeeLocation);
		}else nullNum++;
		
		jobs = jobService.getJobs();
		departments = departmentService.getAllList();
		
		if (StringUtils.isNotBlank(password)) {
			if(employee.getPassword().equals(password)){
				equalNum++;
			}else employee.setPassword(password); 
		}else nullNum++;
		
		/*if(equalNum==3 || nullNum==3){
			return "subupdate"; 
		}*/
		employeeService.update(employee);
		return "subupdate"; 
	}
	
	public String updateEmployeeTelAndMail()
	{
		ActionContext context = ActionContext.getContext();
		employee = (Employee) context.getSession().get("employee");
		if(StringUtils.isNotBlank(phoneNum)){
			/*if(!employee.getPhone().equals(phoneNum)){
				if(RegUtil.checkRegexp(phoneNum, RegUtil.REG_TELPHONE)){*/
					employee.setPhone(phoneNum);
				/*}
			}*/
		}
		if(StringUtils.isNotBlank(shortPhone)){
			if(RegUtil.checkRegexp(shortPhone, RegUtil.REG_SHORT_NUMBER)){
				employee.setVPhone(shortPhone);
			}
		}
		if(StringUtils.isNotBlank(email)&& RegUtil.checkRegexp(email, RegUtil.REG_EMAIL)){
			employee.setEmail(email);
		}
		if(StringUtils.isNotBlank(emergencyName)&&StringUtils.isNotBlank(emergencyTel)){
			employee.setEmergencyName(emergencyName);
			if(RegUtil.checkRegexp(emergencyTel, RegUtil.REG_TELPHONE)){
				employee.setEmergencyTel(emergencyTel);
			}
		}
		jobs = jobService.getJobs();
		departments = departmentService.getAllList();
		employeeService.update(employee);
		return "subupdate"; 
	}
	public String updateEmployeeJob()
	{
		ActionContext context = ActionContext.getContext();
		employee = (Employee) context.getSession().get("employee");
		Job job = jobService.getJob(Integer.parseInt(jobPosition));
		if(job!=null){
			employee.setJob(job);
		}
		Department department = departmentService.getDepartment(departmentId);
		if(department!=null){
			employee.setDepartment(department);
		}
		int oldPermission = employee.getPermission();
		if(oldPermission != permission ){
			employee.setPermission(permission);
		}
		jobs = jobService.getJobs();
		departments = departmentService.getAllList();
		employeeService.update(employee);
		return "subupdate"; 
	}
	public String getJobList()
	{
		jobs = jobService.getJobs();
		return "jobList";
	}
	public String muldelete()
	{
		String[] strA = chkName.split(",");
		for (int i = 0; i < strA.length; i++) {
			Employee employee = employeeService.getEmployee(strA[i].trim());
			employeeService.delete(employee);
		}
		return "update";
	}
	
	public String checkOldPassword()
	{
		ActionContext context = ActionContext.getContext();
		Employee employee = (Employee) context.getSession().get("loginer");
		String re = "";
		if (oldPassword.equals(employee.getPassword())) {
			re = "ok";
		}else {
			re="原密码输入错误！";
		}
		JSONObject object= new JSONObject();
		object.put("index", re);
		
		message = object.toString();
		
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
		log.info("message = "+message);
         out.print(message);
         out.flush();
         out.close();
         return "update";
		
	}
	public String updatePassword()
	{
		ActionContext context = ActionContext.getContext();
		Employee employee = (Employee) context.getSession().get("loginer");
		employee.setPassword(newPassword);
		employeeService.update(employee);
		message="修改成功";
		return "updatePassword";
	}
	/**
	 * 登出
	 * @return
	 */
	public String logout(){
		ActionContext context = ActionContext.getContext();
		context.getSession().remove(FinalConstant.SESSION_LOGINER);
		
		return "logout";
	}
	
	
	//user端用到的方法
	public String showEmployeeInfo() {
		ActionContext context = ActionContext.getContext();
		employee = (Employee) context.getSession().get("employee");
		context.getSession().put("employee", employee);
		return "employeeForUser";
	}
}
