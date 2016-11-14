package com.changhong.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Structureproblem entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "structureproblem", catalog = "performance")
public class Structureproblem implements java.io.Serializable {

	// Fields

	private Integer id;
	private Project project;
	private Problemtype problemtype;
	private Phase phase;
	private Employee employee;
	private String name;
	private Integer score;
	private String strExplain;
	private Date createDate;

	// Constructors

	/** default constructor */
	public Structureproblem() {
	}

	/** full constructor */
	public Structureproblem(Project project, Problemtype problemtype,
			Phase phase, Employee employee, String name, Integer score,
			String strExplain, Date createDate) {
		this.project = project;
		this.problemtype = problemtype;
		this.phase = phase;
		this.employee = employee;
		this.name = name;
		this.score = score;
		this.strExplain = strExplain;
		this.createDate = createDate;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "id", unique = true, nullable = false)
	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "project")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "classify")
	public Problemtype getProblemtype() {
		return this.problemtype;
	}

	public void setProblemtype(Problemtype problemtype) {
		this.problemtype = problemtype;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "phaseId")
	public Phase getPhase() {
		return this.phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "name")
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "strExplain")
	public String getStrExplain() {
		return this.strExplain;
	}

	public void setStrExplain(String strExplain) {
		this.strExplain = strExplain;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createDate", length = 0)
	public Date getCreateDate() {
		return this.createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

}