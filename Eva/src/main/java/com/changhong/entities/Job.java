package com.changhong.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Job entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "job", catalog = "performance")
public class Job implements java.io.Serializable {

	// Fields

	private Integer jobId;
	private String jobName;
	private Set<Employee> employees = new HashSet<Employee>(0);

	// Constructors

	/** default constructor */
	public Job() {
	}

	/** full constructor */
	public Job(String jobName, Set<Employee> employees) {
		this.jobName = jobName;
		this.employees = employees;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "jobId", unique = true, nullable = false)
	public Integer getJobId() {
		return this.jobId;
	}

	public void setJobId(Integer jobId) {
		this.jobId = jobId;
	}

	@Column(name = "jobName", length = 25)
	public String getJobName() {
		return this.jobName;
	}

	public void setJobName(String jobName) {
		this.jobName = jobName;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "job")
	public Set<Employee> getEmployees() {
		return this.employees;
	}

	public void setEmployees(Set<Employee> employees) {
		this.employees = employees;
	}

}