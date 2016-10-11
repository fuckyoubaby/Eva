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
 * Employeemoder entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employeemoder", catalog = "performance")
public class Employeemoder implements java.io.Serializable {

	// Fields

	private Integer employeeModeId;
	private Mode mode;
	private Employee employee;
	private Integer score;

	// Constructors

	/** default constructor */
	public Employeemoder() {
	}

	/** full constructor */
	public Employeemoder(Mode mode, Employee employee, Integer score) {
		this.mode = mode;
		this.employee = employee;
		this.score = score;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "employeeModeId", unique = true, nullable = false)
	public Integer getEmployeeModeId() {
		return this.employeeModeId;
	}

	public void setEmployeeModeId(Integer employeeModeId) {
		this.employeeModeId = employeeModeId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mode")
	public Mode getMode() {
		return this.mode;
	}

	public void setMode(Mode mode) {
		this.mode = mode;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}