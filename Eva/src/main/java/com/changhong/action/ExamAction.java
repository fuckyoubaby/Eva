package com.changhong.action;

import java.sql.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Employee;
import com.changhong.entities.Employeeexamr;
import com.changhong.entities.Exam;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.EmployeeService;
import com.changhong.service.ExamService;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("examAction")
@Results({
	@Result(name="examsPage",location="/adminEnter/examing/examTemplate.jsp"),
	@Result(name="exam",location="/adminEnter/examing/examing_info.jsp"),
	@Result(name="turntolist",location="/adminEnter/examing/examing_score_lists.jsp"),
	@Result(name="employeeList",location="/adminEnter/examing/examEmployeeTemplate.jsp"),
	@Result(name="add",location="/adminEnter/examing/examing_index.jsp",type="redirect"),
	@Result(name="update",location="/adminEnter/examing/examing_index.jsp",type="redirect"),
	@Result(name="examForUpdate",location="/adminEnter/examing/examing_update.jsp"),
	@Result(name="muldeletescorelist",location="/adminEnter/examing/examing_score_lists.jsp"),
	@Result(name="employeeListForImport",location="/adminEnter/examing/examing_score_import.jsp"),//addExamGrade
	@Result(name="addExamGrade",location="/adminEnter/examing/examing_score_lists.jsp"),
	@Result(name="examScoreForUpdate",location="/adminEnter/examing/examing_score_update.jsp"),
	
	
	@Result(name="employeeExamForEmployee",location="/userEnter/others/examTemplate.jsp"),
	@Result(name="examForEmployee",location="/userEnter/others/examing_info.jsp"),
})
public class ExamAction {

	private static final Logger log = LoggerFactory.getLogger(ExamAction.class);
	@Autowired
	private ExamService examService;
	@Autowired
	private EmployeeExamService employeeExamService;
	@Autowired
	private EmployeeService employeeService;
	
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	private List<Exam> exams;

	
	private int examId;
	private Exam exam;
	
	private int max;
	private int min;
	private double avg;
	private int score;
	private int examCount;
	
	private List<Employeeexamr> employeeexamrs;
	
	private Employeeexamr employeeexamr;
	
	private String examName;
	private String organizer;
	private String examLevel;
	private String examContent;
	private Date examData;
	private String examLocation;
	
	private String chkName;
	
	private List<Employee> employees;
	
	
	private String employeeId;
	private int grade;
	
	private int examEmployeeId;
	
	
	
	
	public int getExamCount() {
		return examCount;
	}

	public void setExamCount(int examCount) {
		this.examCount = examCount;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	public int getExamEmployeeId() {
		return examEmployeeId;
	}

	public void setExamEmployeeId(int examEmployeeId) {
		this.examEmployeeId = examEmployeeId;
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

	public Employeeexamr getEmployeeexamr() {
		return employeeexamr;
	}

	public void setEmployeeexamr(Employeeexamr employeeexamr) {
		this.employeeexamr = employeeexamr;
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

	public List<Exam> getExams() {
		return exams;
	}

	public void setExams(List<Exam> exams) {
		this.exams = exams;
	}
	
	
	public int getExamId() {
		return examId;
	}

	public void setExamId(int examId) {
		this.examId = examId;
	}

	public Exam getExam() {
		return exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}
	

	public int getMax() {
		return max;
	}

	public void setMax(int max) {
		this.max = max;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public double getAvg() {
		return avg;
	}

	public void setAvg(double avg) {
		this.avg = avg;
	}

	public List<Employeeexamr> getEmployeeexamrs() {
		return employeeexamrs;
	}

	public void setEmployeeexamrs(List<Employeeexamr> employeeexamrs) {
		this.employeeexamrs = employeeexamrs;
	}

	public ExamService getExamService() {
		return examService;
	}

	public void setExamService(ExamService examService) {
		this.examService = examService;
	}

	public String getExamName() {
		return examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	public String getOrganizer() {
		return organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	public String getExamLevel() {
		return examLevel;
	}

	public void setExamLevel(String examLevel) {
		this.examLevel = examLevel;
	}

	public String getExamContent() {
		return examContent;
	}

	public void setExamContent(String examContent) {
		this.examContent = examContent;
	}

	public Date getExamData() {
		return examData;
	}

	public void setExamData(Date examData) {
		this.examData = examData;
	}

	public String getExamLocation() {
		return examLocation;
	}

	public void setExamLocation(String examLocation) {
		this.examLocation = examLocation;
	}

	public String getChkName() {
		return chkName;
	}

	public void setChkName(String chkName) {
		this.chkName = chkName;
	}

	public List<Employee> getEmployees() {
		return employees;
	}

	public void setEmployees(List<Employee> employees) {
		this.employees = employees;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}

	public String getExamsByPage()
	{
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		/*exams = examService.getExamsByPage(pageNo, pageSize, keyword);
		itemcount = examService.getCount(keyword);*/
		exams = examService.getExamsByPage(params);
		itemcount = examService.getCount(params);
		return "examsPage";
	}
	
	public String getExamById()
	{
		exam = examService.getExam(examId);
		List<Employeeexamr> list = employeeExamService.getMin(examId);
		if (list.size()>0) {
			min = list.get(0).getScore();
		}
		List<Employeeexamr> list2 = employeeExamService.getMax(examId);
		if (list2.size()>0) {
			max = list2.get(0).getScore();
		}
		examCount = employeeExamService.getCount(null, examId);
		avg = employeeExamService.getAvg(examId);
		return "exam";
	}
	
	public String turntolist()
	{
		ActionContext context = ActionContext.getContext();
		context.getSession().put("examId", examId);
		Exam examExample = examService.getExam(examId);
		setExam(examExample);
		return "turntolist";
	}
	public String getEmployeeListByExamId()
	{
		ActionContext context = ActionContext.getContext();
		int examId = (Integer) context.getSession().get("examId");
		log.info("examid = "+examId);
		employeeexamrs=employeeExamService.getEmployeeexamrsByPages(pageNo, pageSize, keyword,examId);
		itemcount = employeeExamService.getCount(keyword,examId);
		log.info("itemCount = "+itemcount);
		return "employeeList";
	}
	public String add()
	{
		Exam exam = new Exam();
		exam.setExamContent(examContent);
		exam.setExamLevel(examLevel);
		exam.setExamLocation(examLocation);
		exam.setExamName(examName);
		exam.setExamTime(examData);
		exam.setOrganizer(organizer);
		examService.save(exam);
		return "add";
	}
	public String muldelete()
	{
		String[] strA = chkName.split(",");
		for (int i = 0; i < strA.length; i++) {
			String idStr = strA[i].trim();
			if(idStr.matches("\\d+")){
				int id = Integer.parseInt(idStr);
				Exam exam = examService.getExam(id);
				examService.delete(exam);
			}else continue;
		}
		return "add";
	}
	public String getExamByIdForUpdate()
	{
		ActionContext context = ActionContext.getContext();
		exam = examService.getExam(examId);
		context.getSession().put("exam", exam);
		return "examForUpdate";
	} 
	public String update()
	{
		ActionContext context = ActionContext.getContext();
		Exam exam = (Exam) context.getSession().get("exam");
		exam.setExamContent(examContent);
		exam.setExamLevel(examLevel);
		exam.setExamLocation(examLocation);
		exam.setExamName(examName);
		exam.setOrganizer(organizer);
		exam.setExamTime(examData);
		examService.update(exam);
		return "update";
	}
	public String muldeletescorelist()
	{
		String[] strA = chkName.split(",");
		for (int i = 0; i < strA.length; i++) {
			Employeeexamr employeeexamr = employeeExamService.getEmployeeexamrById(Integer.parseInt(strA[i].trim()));
			employeeExamService.delete(employeeexamr);
		}
		return "muldeletescorelist";
	}
	public String deleteScoreList()
	{
		Employeeexamr employeeexamr = employeeExamService.getEmployeeexamrById(examEmployeeId);
		employeeExamService.delete(employeeexamr);

		ActionContext context = ActionContext.getContext();
		int examId = (Integer) context.getSession().get("examId");
		log.info("examid = "+examId);
		employeeexamrs=employeeExamService.getEmployeeexamrsByPages(pageNo, pageSize, keyword,examId);
		itemcount = employeeExamService.getCount(keyword,examId);
		log.info("itemCount = "+itemcount);
		return "muldeletescorelist";
	}
	
	public String getExamScoreForUpdate()
	{
		log.info("employeeexamr = "+examEmployeeId);
		employeeexamr = employeeExamService.getEmployeeexamrById(examEmployeeId);
		ActionContext context = ActionContext.getContext();
		context.getSession().put("employeeexamr", employeeexamr);
		log.info("employeeexamr = "+employeeexamr.getExam().getExamName());
		return "examScoreForUpdate";
	}
	public String updateExamSocre()
	{
		ActionContext context = ActionContext.getContext();
		Employeeexamr ex = (Employeeexamr) context.getSession().get("employeeexamr");
		ex.setScore(score);
		employeeExamService.update(ex);
		return "muldeletescorelist";
	}
	
	public String getEmployeeList()
	{
		ActionContext context = ActionContext.getContext();
		int examId = (Integer) context.getSession().get("examId");
		exam = examService.getExam(examId);
		employees = employeeService.getAllEmployees();
		return "employeeListForImport";
	}
	public String addExamGrade()
	{
		ActionContext context = ActionContext.getContext();
		int examId = (Integer) context.getSession().get("examId");
		exam = examService.getExam(examId);
		Employee employee = employeeService.getEmployee(employeeId);
		Employeeexamr employeeexamr = new Employeeexamr();
		employeeexamr.setEmployee(employee);
		employeeexamr.setExam(exam);
		employeeexamr.setScore(grade);
		employeeExamService.save(employeeexamr);
		return "addExamGrade";
	}
	
	
	
	//用户端用到的方法
	public String getExamByPageAndEmployeeId()
	{
		String employeeId = (String) ActionContext.getContext().getSession().get("employeeId");
		/*employeeexamrs = employeeExamService.getEmployeeexamrsByPageAndEmployeeId(pageNo, pageSize, keyword, employeeId);
		itemcount = employeeExamService.getCountForEmployee(keyword, employeeId);*/
		
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		employeeexamrs = employeeExamService.getEmployeeexamrsByPageAndEmployeeId(params, employeeId);
		itemcount = employeeExamService.getCountForEmployee(params, employeeId);
		return "employeeExamForEmployee";
	}
	public String getExamByIdForEmployee()
	{
		exam = examService.getExam(examId);
		String employeeId = (String) ActionContext.getContext().getSession().get("employeeId");
		employeeexamr = employeeExamService.getEmployeeexamrByEmployeeIdAndExamId(examId, employeeId);
		List<Employeeexamr> list = employeeExamService.getMin(examId);
		if (list.size()>0) {
			min = list.get(0).getScore();
		}
		List<Employeeexamr> list2 = employeeExamService.getMax(examId);
		if (list2.size()>0) {
			max = list2.get(0).getScore();
		}
		avg = employeeExamService.getAvg(examId);
		examCount = employeeExamService.getCount(null, examId);
		return "examForEmployee";
	}
}
