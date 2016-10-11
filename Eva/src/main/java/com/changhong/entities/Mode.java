package com.changhong.entities;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Mode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "mode", catalog = "performance")
public class Mode implements java.io.Serializable {

	// Fields

	private Integer modeId;
	private Comprehensive comprehensive;
	private Problemmode problemmode;
	private Employee employee;
	private String modeName;
	private Date createTime;
	private Set<Result> results = new HashSet<Result>(0);
	private Set<Employeemoder> employeemoders = new HashSet<Employeemoder>(0);
	private Set<Overallscore> overallscores = new HashSet<Overallscore>(0);

	// Constructors

	/** default constructor */
	public Mode() {
	}

	/** full constructor */
	public Mode(Comprehensive comprehensive, Problemmode problemmode,
			Employee employee, String modeName, Date createTime,
			Set<Result> results, Set<Employeemoder> employeemoders,Set<Overallscore> overallscores) {
		this.comprehensive = comprehensive;
		this.problemmode = problemmode;
		this.employee = employee;
		this.modeName = modeName;
		this.createTime = createTime;
		this.results = results;
		this.employeemoders = employeemoders;
		this.overallscores = overallscores;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "modeId", unique = true, nullable = false)
	public Integer getModeId() {
		return this.modeId;
	}

	public void setModeId(Integer modeId) {
		this.modeId = modeId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "comprehensive")
	public Comprehensive getComprehensive() {
		return this.comprehensive;
	}

	public void setComprehensive(Comprehensive comprehensive) {
		this.comprehensive = comprehensive;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemMode")
	public Problemmode getProblemmode() {
		return this.problemmode;
	}

	public void setProblemmode(Problemmode problemmode) {
		this.problemmode = problemmode;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "modeName", length = 25)
	public String getModeName() {
		return this.modeName;
	}

	public void setModeName(String modeName) {
		this.modeName = modeName;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createTime", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER, mappedBy = "mode")
	public Set<Result> getResults() {
		return this.results;
	}

	public void setResults(Set<Result> results) {
		this.results = results;
	}

	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER, mappedBy = "mode")
	public Set<Employeemoder> getEmployeemoders() {
		return this.employeemoders;
	}

	public void setEmployeemoders(Set<Employeemoder> employeemoders) {
		this.employeemoders = employeemoders;
	}
	
	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.EAGER, mappedBy = "mode")
	public Set<Overallscore> getOverallscores() {
		return this.overallscores;
	}

	public void setOverallscores(Set<Overallscore> overallscores) {
		this.overallscores = overallscores;
	}

}