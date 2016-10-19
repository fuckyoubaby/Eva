package com.changhong.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Assist;
import com.changhong.entities.Employee;
import com.changhong.entities.Order;
import com.changhong.entities.Patent;
import com.changhong.service.AssistService;
import com.changhong.service.EmployeeService;
import com.changhong.service.OrderService;
import com.changhong.service.PatentService;
import com.changhong.util.Params;

@Action("assistAction")
@Results(
		{
			@Result(name="allEmployee",location="/adminEnter/assist/assist_add.jsp"),
			@Result(name="save",location="/success.jsp"),
			@Result(name="assists",location="/adminEnter/assist/assistTemplate.jsp"),
			@Result(name="patents",location="/adminEnter/assist/patentTemplate.jsp"),
			@Result(name="orders",location="/adminEnter/assist/orderTemplate.jsp"),
			@Result(name="deletePatent",location="/adminEnter/assist/assist_index.jsp")
		})
public class AssistAction {

	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private AssistService assistService;
	@Autowired
	private PatentService patentService;
	@Autowired
	private OrderService orderService;
	
	
	private List<Employee> employees;
	
	private int assistType;//1是专利，2是订单，3是其他加分项
	private String assistName;
	private String patentType;
	private int num;
	private String employeeId;
	private Date startTime;
	private String patentId;
	private String message;
	
	private List<Assist> assists;
	private List<Order> orders;
	private List<Patent> patents;
	
	private int pageNo;
	private int pageSize;
	private int itemcount;
	private String orderName;
	private String orderType;
	private int resultType;
	
	private int orderId;
	private int assistId;
	
	
	
	public int getOrderId() {
		return orderId;
	}
	public void setOrderId(int orderId) {
		this.orderId = orderId;
	}
	public int getAssistId() {
		return assistId;
	}
	public void setAssistId(int assistId) {
		this.assistId = assistId;
	}
	public int getResultType() {
		return resultType;
	}
	public void setResultType(int resultType) {
		this.resultType = resultType;
	}
	public List<Order> getOrders() {
		return orders;
	}
	public void setOrders(List<Order> orders) {
		this.orders = orders;
	}
	public List<Patent> getPatents() {
		return patents;
	}
	public void setPatents(List<Patent> patents) {
		this.patents = patents;
	}
	public List<Assist> getAssists() {
		return assists;
	}
	public void setAssists(List<Assist> assists) {
		this.assists = assists;
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
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getPatentId() {
		return patentId;
	}
	public void setPatentId(String patentId) {
		this.patentId = patentId;
	}
	public int getAssistType() {
		return assistType;
	}
	public void setAssistType(int assistType) {
		this.assistType = assistType;
	}
	public String getAssistName() {
		return assistName;
	}
	public void setAssistName(String assistName) {
		this.assistName = assistName;
	}
	public String getPatentType() {
		return patentType;
	}
	public void setPatentType(String patentType) {
		this.patentType = patentType;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getEmployeeId() {
		return employeeId;
	}
	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public List<Employee> getEmployees() {
		return employees;
	}
	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public String getAllEmployee()
	{
		employees = employeeService.getAllEmployees();
		return "allEmployee";
	}
	
	public String save()
	{
		if (employeeId!=null) {
			Employee employee = employeeService.getEmployee(employeeId);
			if (assistType==1) {
				Patent patent = new Patent();
				patent.setEmployee(employee);
				patent.setPatentName(assistName);
				patent.setPatentType(patentType);
				patent.setDate(startTime);
				patent.setPatentId(patentId);
				
				patentService.save(patent);
				message="专利添加成功";
			}else if (assistType==2) {
				Order order = new Order();
				order.setDate(startTime);
				order.setEmployee(employee);
				order.setNum(num);
				order.setOrderName(assistName);
				
				orderService.save(order);
				message="订单添加成功";
			}else {
				Assist assist = new Assist();
				assist.setAssistName(assistName);
				assist.setDate(startTime);
				assist.setEmployee(employee);
				assist.setScore(num);
				
				assistService.save(assist);
				message="其他加分添加成功";
			}
		}
		
		return "save";
	}
	public String isExit()
	{
		
		
		boolean flag = patentService.isExit(patentId);
		
		JSONObject jsonObject = new JSONObject();
		if (!flag) {
			jsonObject.put("valid", true);
		}else {
			jsonObject.put("valid", false);
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
         out.print(jsonObject.toString());
         out.flush();
         out.close();
         
         return "save";
	}
	
	public String getAssistByPage()
	{
		System.out.println("orderName="+orderName+" orderType = "+orderType);
		orderName = null;
		orderType = null;
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		assists = assistService.getAssistsByPage(params);
		itemcount = assistService.getCount(params);
		resultType = 2;
		return "assists";
	}
	
	public String getOrderByPage()
	{
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		orders = orderService.getOrdersByPage(params);
		itemcount = orderService.getCount(params);
		resultType = 1;
		return "orders";
	}
	
	public String getPatentByPage()
	{

		orderName = null;
		orderType = null;
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		patents = patentService.getPatentsByPage(params);
		itemcount = patentService.getCount(params);
		resultType = 0;
		return "patents";
	}
	
	public String deletePatent()
	{
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		patents = patentService.getPatentsByPage(params);
		itemcount = patentService.getCount(params);
		patentService.delete(patentService.get(patentId));
		resultType = 0;
		return "deletePatent";
	}
	public String deleteOrder()
	{
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		orders = orderService.getOrdersByPage(params);
		itemcount = orderService.getCount(params);
		orderService.delete(orderService.get(orderId));
		resultType = 1;
		return "deletePatent";
	}
	public String deleteOther()
	{
		Params params = new Params(0, pageNo, pageSize, null, orderName, orderType);
		assists = assistService.getAssistsByPage(params);
		itemcount = assistService.getCount(params);
		assistService.delete(assistService.get(assistId));
		resultType = 2;
		return "deletePatent";
	}
	//测试git是否可以成功
	private void testGit()
	{
		System.out.println("test git");
	}
}
