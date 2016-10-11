package com.changhong.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;


/**
 * Project entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "project", catalog = "performance")
public class Project implements java.io.Serializable {

	// Fields

	private String projectId;
	private Employee employee;
	private Review review;
	private String projectName;
	private Date createTime;
	private Date startTime;
	private Date endTime;
	private String introduction;
	private String area;
	private String projectClassify;
	private String projectState;
	
	private Set<Employeeprojectr> employeeprojectrs = new HashSet<Employeeprojectr>(
			0);
	private Set<Problem> problems = new HashSet<Problem>(0);

	// Constructors

	/** default constructor */
	public Project() {
	}

	/** minimal constructor */
	public Project(String projectId) {
		this.projectId = projectId;
	}

	/** full constructor */
	public Project(String projectId, Employee employee,Review review, String projectName,
			Date createTime, Date startTime, Date endTime, String introduction, String area,
			String projectClassify, String projectState,
			Set<Employeeprojectr> employeeprojectrs, Set<Problem> problems) {
		this.projectId = projectId;
		this.employee = employee;
		this.review = review;
		this.projectName = projectName;
		this.createTime = createTime;
		this.startTime = startTime;
		this.endTime = endTime;
		this.introduction = introduction;
		this.area = area;
		this.projectClassify = projectClassify;
		this.projectState = projectState;
		this.employeeprojectrs = employeeprojectrs;
		this.problems = problems;
	}

	// Property accessors
	@Id
	@Column(name = "projectId", unique = true, nullable = false, length = 30)
	public String getProjectId() {
		return this.projectId;
	}

	public void setProjectId(String projectId) {
		this.projectId = projectId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "projectManager")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(fetch=FetchType.EAGER)
	@JoinColumn(name="reviewId")
	public Review getReview(){
		return this.review;
	}
	
	public void setReview(Review review)
	{
		this.review = review;
	}
	
	@Column(name = "projectName", length = 50)
	public String getProjectName() {
		return this.projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createTime", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "startTime", length = 0)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	
	@Temporal(TemporalType.DATE)
	@Column(name = "endTime", length = 0)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	@Column(name = "introduction")
	public String getIntroduction() {
		return this.introduction;
	}

	public void setIntroduction(String introduction) {
		this.introduction = introduction;
	}

	@Column(name = "area", length = 50)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "projectClassify", length = 20)
	public String getProjectClassify() {
		return this.projectClassify;
	}

	public void setProjectClassify(String projectClassify) {
		this.projectClassify = projectClassify;
	}

	@Column(name = "projectState", length = 25)
	public String getProjectState() {
		return this.projectState;
	}

	public void setProjectState(String projectState) {
		this.projectState = projectState;
	}

	@OneToMany( fetch = FetchType.EAGER,cascade = CascadeType.REMOVE, mappedBy = "project")//cascade = CascadeType.ALL,
	public Set<Employeeprojectr> getEmployeeprojectrs() {
		return this.employeeprojectrs;
	}

	public void setEmployeeprojectrs(Set<Employeeprojectr> employeeprojectrs) {
		this.employeeprojectrs = employeeprojectrs;
	}

	@OneToMany(fetch = FetchType.EAGER,cascade = CascadeType.REMOVE, mappedBy = "project")//cascade = CascadeType.ALL, 
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

}