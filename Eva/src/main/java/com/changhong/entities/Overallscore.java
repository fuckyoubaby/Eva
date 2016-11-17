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
 * Overallscore entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "overallscore", catalog = "performance")
public class Overallscore implements java.io.Serializable {

	// Fields

	private Integer id;
	private Mode mode;
	private Employee employee;
	private Date startTime;
	private Date endTime;
	private String name;
	private Date createTime;
	private Integer employeeNum;
	private Set<Result> results = new HashSet<Result>(0);
	private Set<Secondlevelscore> secondlevelscores = new HashSet<Secondlevelscore>(0);

	// Constructors

	/** default constructor */
	public Overallscore() {
	}

	/** full constructor */
	public Overallscore(Mode mode,  Date startTime,
			Date endTime, String name, Date createTime, Integer employeeNum,
			Set<Result> results,Set<Secondlevelscore> secondlevelscores) {
		this.mode = mode;
		this.startTime = startTime;
		this.endTime = endTime;
		this.name = name;
		this.createTime = createTime;
		this.employeeNum = employeeNum;
		this.results = results;
		this.secondlevelscores = secondlevelscores;
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

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mode")
	public Mode getMode() {
		return this.mode;
	}

	public void setMode(Mode mode) {
		this.mode = mode;
	}

	/*@ManyToOne(fetch = FetchType.EAGER)//not-found="ignore"
	@JoinColumn(name = "Employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}
*/
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

	@Column(name = "name", length = 50)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createTime", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	
	@Column(name = "employeeNum")
	public Integer getEmployeeNum() {
		return this.employeeNum;
	}

	public void setEmployeeNum(Integer employeeNum) {
		this.employeeNum = employeeNum;
	}

	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY, mappedBy = "overallscore")
	public Set<Result> getResults() {
		return this.results;
	}

	public void setResults(Set<Result> results) {
		this.results = results;
	}
	
	@OneToMany(cascade = CascadeType.REMOVE, fetch = FetchType.LAZY, mappedBy = "overallscore")
	public Set<Secondlevelscore> getSecondlevelscores() {
		return this.secondlevelscores;
	}

	public void setSecondlevelscores(Set<Secondlevelscore> secondlevelscores) {
		this.secondlevelscores = secondlevelscores;
	}

}