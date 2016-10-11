package com.changhong.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Employee;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Job;
import com.changhong.entities.Train;
import com.changhong.entities.Trainorg;
import com.changhong.service.EmployeeService;
import com.changhong.service.EmployeeTrainService;
import com.changhong.service.JobService;
import com.changhong.service.TrainOrgService;
import com.changhong.service.TrainService;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("trainAction")
@Results({
	@Result(name="trainsPage",location="/adminEnter/training/trainingTemplate.jsp"),
	@Result(name="train",location="/adminEnter/training/training_info.jsp"),
	@Result(name="save",location="/adminEnter/training/training_index.jsp"),
	@Result(name="trainForUpdate",location="/adminEnter/training/training_update.jsp"),
	@Result(name="update",location="/adminEnter/training/training_index.jsp"),
	@Result(name="muldelete",location="/adminEnter/training/training_index.jsp"),
	@Result(name="allForTrain",location="/adminEnter/training/training_add.jsp"),
	
	
	@Result(name="trainsForEmployee",location="/userEnter/others/trainingTemplate.jsp"),
	@Result(name="trainForEmployee",location="/userEnter/others/training_info.jsp")
})
public class TrainAction {

	private static final Logger log = LoggerFactory.getLogger(TrainAction.class);
	@Autowired
	private TrainService trainService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private EmployeeTrainService employeeTrainService;
	@Autowired
	private JobService jobService;
	@Autowired
	private TrainOrgService trainOrgService;
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	private List<Train> trains;
	private Train train;
	private int trainId;

	
	private String trainName;
	private String teacher;
	private String trainContent;
	private String information;
	private Date trainData;
	private String trainArea;
	private String trainLeval;
	private String employeeList;
	
	private String chkName;
	
	private List<Employee> employeesChecked;
	private List<Employee> employeesUnChecked;
	
	private List<Employeetrainr> employeetrainrs;
	private List<Employee> employees;
	
	private Map<String, List<Employee>> employeeMap;
	
	private int teacherType;
	private String employeeId;
	private String oriList;
	
	private List<Trainorg> trainorgs;
	
	private List<Employeetrainr> list;
	
	
	
	public List<Employeetrainr> getList() {
		return list;
	}

	public void setList(List<Employeetrainr> list) {
		this.list = list;
	}

	public List<Trainorg> getTrainorgs() {
		return trainorgs;
	}

	public void setTrainorgs(List<Trainorg> trainorgs) {
		this.trainorgs = trainorgs;
	}

	public int getTeacherType() {
		return teacherType;
	}

	public void setTeacherType(int teacherType) {
		this.teacherType = teacherType;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getOriList() {
		return oriList;
	}

	public void setOriList(String oriList) {
		this.oriList = oriList;
	}

	public Map<String, List<Employee>> getEmployeeMap() {
		return employeeMap;
	}

	public void setEmployeeMap(Map<String, List<Employee>> employeeMap) {
		this.employeeMap = employeeMap;
	}
	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
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

	public List<Train> getTrains() {
		return trains;
	}

	public void setTrains(List<Train> trains) {
		this.trains = trains;
	}
	
	public Train getTrain() {
		return train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	public int getTrainId() {
		return trainId;
	}

	public void setTrainId(int trainId) {
		this.trainId = trainId;
	}

	public String getTrainName() {
		return trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	public String getTeacher() {
		return teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	public String getTrainContent() {
		return trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

	public String getInformation() {
		return information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	public Date getTrainData() {
		return trainData;
	}

	public void setTrainData(Date trainData) {
		this.trainData = trainData;
	}

	public String getTrainArea() {
		return trainArea;
	}

	public void setTrainArea(String trainArea) {
		this.trainArea = trainArea;
	}

	public String getTrainLeval() {
		return trainLeval;
	}

	public void setTrainLeval(String trainLeval) {
		this.trainLeval = trainLeval;
	}

	public String getEmployeeList() {
		return employeeList;
	}

	public void setEmployeeList(String employeeList) {
		this.employeeList = employeeList;
	}
	public List<Employee> getEmployeesChecked() {
		return employeesChecked;
	}

	public void setEmployeesChecked(List<Employee> employeesChecked) {
		this.employeesChecked = employeesChecked;
	}

	public List<Employee> getEmployeesUnChecked() {
		return employeesUnChecked;
	}

	public void setEmployeesUnChecked(List<Employee> employeesUnChecked) {
		this.employeesUnChecked = employeesUnChecked;
	}

	public String getTrainByPage()
	{
		log.info("getTrainByPage");
		/*trains = trainService.getTrainsByPage(pageNo, pageSize, keyword);
		itemcount = trainService.getCount(keyword);*/
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		log.info("pageno = "+pageNo+" pageSize = "+pageSize+" ordername="+orderName+" orderType="+orderType);
		trains = trainService.getTrainsByPage(params);
		itemcount = trainService.getCount(params);
		return "trainsPage";
	}
	public String getTrainById()
	{
		train = trainService.getTrain(trainId);
		return "train";
	}
	public String getChkName() {
		return chkName;
	}

	public void setChkName(String chkName) {
		this.chkName = chkName;
	}
	

	public List<Employeetrainr> getEmployeetrainrs() {
		return employeetrainrs;
	}

	public void setEmployeetrainrs(List<Employeetrainr> employeetrainrs) {
		this.employeetrainrs = employeetrainrs;
	}

	public String getTrainForUpdate()
	{
		ActionContext context = ActionContext.getContext();
		train = trainService.getTrain(trainId);
		context.getSession().put("train", train);
		list = employeeTrainService.getEmployeetrainrsByTrainId(trainId);
		if (list.size()>0) {
			employeesChecked = new ArrayList<Employee>();
			for (int i = 0; i < list.size(); i++) {
				employeesChecked.add(list.get(i).getEmployee());
			}
			
		}
		employeesUnChecked = employeeService.getAllEmployees();
		if (list.size()>0) {
			employeesUnChecked.removeAll(employeesChecked);
		}
		
		
		employeeMap = new HashMap<String, List<Employee>>();
		List<Job> jobs = jobService.getJobs();
		for (int i = 0; i < jobs.size(); i++) {
			employees = employeeService.getEmployeesByJobId(jobs.get(i).getJobId());
			employeeMap.put(jobs.get(i).getJobName(), employees);
		}
		log.info("trainId="+trainId);
		trainorgs = trainOrgService.getTrainorgs(trainId);
		employees = employeeService.getAllEmployees();
		log.info("trainorgs size = "+trainorgs.size());
		return "trainForUpdate";
	}
	public String save()
	{
		if (employeeList!=null&&!employeeList.equals("")) {//有参与员工的情况下
			String[] strA=employeeList.split(",");
			Train train = new Train();
			train.setInformation(information);
			Employee e = new Employee();
			if (teacherType==0) {
				e = employeeService.getEmployee(employeeId);
				train.setEmployee(e);
			}else {
				train.setTeacher(teacher);
			}
			train.setTrainContent(trainContent);
			train.setJoinNum(strA.length);
			train.setTrainLevel(trainLeval);
			train.setTrainLocation(trainArea);
			train.setTrainName(trainName);
			train.setTrainTime(trainData);
			
			Train train2 = trainService.saveAndGet(train);
			Employeetrainr employeetrainr = new Employeetrainr();
			for (int i = 0; i < strA.length; i++) {
				if (strA[i].trim()!=null&&!strA[i].equals("")) {
					Employee employee = employeeService.getEmployee(strA[i].trim());
					employeetrainr.setEmployee(employee);
					employeetrainr.setTrain(train2);
					employeeTrainService.save(employeetrainr);
				}
				
			}
			log.info("oriList="+oriList);
			if (oriList!=null&&!oriList.equals("")) {
				String[] strB=oriList.split(",");
				Trainorg trainorg = new Trainorg();
				for (int i = 0; i < strB.length; i++) {
					log.info("------"+strB[i]+"-----");
					if (strB[i].trim()!=null&&!strB[i].equals("")) {
						Employee employee = employeeService.getEmployee(strB[i].trim());
						log.info("employee = "+employee.getName());
						trainorg.setTrain(train2);
						trainorg.setEmployee(employee);
						trainOrgService.save(trainorg);
					}
				}
			}
		}else {
			//String[] strA=employeeList.split(",");
			Train train = new Train();
			train.setInformation(information);
			Employee e = new Employee();
			if (teacherType==0) {
				e = employeeService.getEmployee(employeeId);
				train.setEmployee(e);
			}else {
				train.setTeacher(teacher);
			}
			train.setTrainContent(trainContent);
			train.setJoinNum(0);
			train.setTrainLevel(trainLeval);
			train.setTrainLocation(trainArea);
			train.setTrainName(trainName);
			train.setTrainTime(trainData);
			
			Train train2 = trainService.saveAndGet(train);
			Employeetrainr employeetrainr = new Employeetrainr();
			//for (int i = 0; i < strA.length; i++) {
				//Employee employee = employeeService.getEmployee(strA[i].trim());
				//employeetrainr.setEmployee(employee);
				employeetrainr.setTrain(train2);
				employeeTrainService.save(employeetrainr);
			//}
				if (oriList!=null&&!oriList.equals("")) {
					String[] strB=oriList.split(",");
					Trainorg trainorg = new Trainorg();
					for (int i = 0; i < strB.length; i++) {
						if (strB[i].trim()!=null&&!strB[i].equals("")) {
							Employee employee = employeeService.getEmployee(strB[i].trim());
							log.info("employee = "+employee.getName());
							trainorg.setTrain(train2);
							trainorg.setEmployee(employee);
							trainOrgService.save(trainorg);
						}
					}
				}
		}
		
		return "save";
	}
	public String update()
	{
		if (employeeList!=null&&!employeeList.equals("")) {
			String[] strA=employeeList.split(",");
			ActionContext context = ActionContext.getContext();
			Train train = (Train) context.getSession().get("train");
			train.setInformation(information);
			Employee e = new Employee();
			if (teacherType==0) {
				e = employeeService.getEmployee(employeeId);
				train.setEmployee(e);
			}else {
				train.setTeacher(teacher);
			}
			train.setTrainContent(trainContent);
			train.setTrainLevel(trainLeval);
			train.setTrainLocation(trainArea);
			train.setTrainName(trainName);
			train.setTrainTime(trainData);
			train.setJoinNum(strA.length);
			trainService.update(train);
			
			List<Employeetrainr> list = employeeTrainService.getEmployeetrainrsByTrainId(train.getTrainId());
			for (int i = 0; i < list.size(); i++) {
				list.get(i).setEmployee(null);
				list.get(i).setTrain(null);
				employeeTrainService.delete(list.get(i));
			}
			
			Employeetrainr employeetrainr = new Employeetrainr();
			for (int i = 0; i < strA.length; i++) {
				Employee employee = employeeService.getEmployee(strA[i].trim());
				employeetrainr.setEmployee(employee);
				employeetrainr.setTrain(train);
				employeeTrainService.save(employeetrainr);
			}
			
			
			
			if (oriList!=null&&!oriList.equals("")) {
				
				List<Trainorg> trainorgs = trainOrgService.getTrainorgs(train.getTrainId());
				for (int i = 0; i < trainorgs.size(); i++) {
					trainOrgService.delete(trainorgs.get(i));
				}
				String[] strB=oriList.split(",");
				Trainorg trainorg = new Trainorg();
				for (int i = 0; i < strB.length; i++) {
					if (strB[i].trim()!=null&&!strB[i].equals("")) {
						Employee employee = employeeService.getEmployee(strB[i].trim());
						log.info("employee = "+employee.getName());
						trainorg.setTrain(train);
						trainorg.setEmployee(employee);
						trainOrgService.save(trainorg);
					}
				}
			}
		}else {
			//String[] strA=employeeList.split(",");
			ActionContext context = ActionContext.getContext();
			Train train = (Train) context.getSession().get("train");
			train.setInformation(information);
			Employee e = new Employee();
			if (teacherType==0) {
				e = employeeService.getEmployee(employeeId);
				train.setEmployee(e);
			}else {
				train.setTeacher(teacher);
			}
			train.setTrainContent(trainContent);
			train.setTrainLevel(trainLeval);
			train.setTrainLocation(trainArea);
			train.setTrainName(trainName);
			train.setTrainTime(trainData);
			train.setJoinNum(0);
			trainService.update(train);
			
			List<Employeetrainr> list = employeeTrainService.getEmployeetrainrsByTrainId(train.getTrainId());
			for (int i = 0; i < list.size(); i++) {
				employeeTrainService.delete(list.get(i));
			}
			
			Employeetrainr employeetrainr = new Employeetrainr();
			
			employeetrainr.setTrain(train);
			employeeTrainService.save(employeetrainr);
			
				
			if (oriList!=null&&!oriList.equals("")) {
					
				List<Trainorg> trainorgs = trainOrgService.getTrainorgs(train.getTrainId());
				for (int i = 0; i < trainorgs.size(); i++) {
					trainOrgService.delete(trainorgs.get(i));
				}
				String[] strB=oriList.split(",");
				Trainorg trainorg = new Trainorg();
				for (int i = 0; i < strB.length; i++) {
					if (strB[i].trim()!=null&&!strB[i].equals("")) {
						Employee employee = employeeService.getEmployee(strB[i].trim());
						log.info("employee = "+employee.getName());
						trainorg.setTrain(train);
						trainorg.setEmployee(employee);
						trainOrgService.save(trainorg);
					}
				}
			}
		}
		
		
		return "update";
	}
	public String muldelete()
	{
		String[] strA=chkName.split(",");
		Train train = new Train();
		for (int i = 0; i < strA.length; i++) {
			train = trainService.getTrain(Integer.parseInt(strA[i].trim()));
			trainService.delete(train);
		}
		return "muldelete";
	}
	
	public String getAllForTrain()
	{
		employeeMap = new HashMap<String, List<Employee>>();
		List<Job> jobs = jobService.getJobs();
		for (int i = 0; i < jobs.size(); i++) {
			employees = employeeService.getEmployeesByJobId(jobs.get(i).getJobId());
			employeeMap.put(jobs.get(i).getJobName(), employees);
		}
		
		employees = employeeService.getAllEmployees();
		/*for (int i = 0; i < employeeMaps.size(); i++) {
			Iterator iterator = employeeMaps.get(i).entrySet().iterator();
			while (iterator.hasNext()) {
				Entry entry = (Entry) iterator.next();
				log.info(entry.getKey()+"  =--- "+entry.getValue());
			}
		}*/
		return "allForTrain";
	}
	
	
	
	
	
	//用户端用到的方法
	public String getTrainByEmployeeId()
	{
		String employeeId = (String) ActionContext.getContext().getSession().get("employeeId");
		/*employeetrainrs = trainService.getTrainsByPageAndEmployeeId(pageNo, pageSize, keyword, employeeId);
		itemcount = trainService.getCount(keyword, employeeId);*/
		
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		employeetrainrs = trainService.getTrainsByPageAndEmployeeId(params, employeeId);
		itemcount = trainService.getCount(params, employeeId);
		log.info("employeetrainrs size = "+itemcount);
		return "trainsForEmployee";
	}
	public String getTrainByIdForEmployee()
	{
		train = trainService.getTrain(trainId);
		return "trainForEmployee";
	}
}
