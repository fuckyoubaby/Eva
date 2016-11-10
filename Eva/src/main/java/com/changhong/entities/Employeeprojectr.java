package com.changhong.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

/**
 * Employeeprojectr entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employeeprojectr", catalog = "performance")
public class Employeeprojectr implements java.io.Serializable {

	// Fields

	private Integer employeeProjectRid;
	private Project project;
	private Employee employee;

	// Constructors

	/** default constructor */
	public Employeeprojectr() {
	}

	/** full constructor */
	public Employeeprojectr(Project project, Employee employee) {
		this.project = project;
		this.employee = employee;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "employeeProjectRId", unique = true, nullable = false)
	public Integer getEmployeeProjectRid() {
		return this.employeeProjectRid;
	}

	public void setEmployeeProjectRid(Integer employeeProjectRid) {
		this.employeeProjectRid = employeeProjectRid;
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
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}