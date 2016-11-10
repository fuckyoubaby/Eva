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
 * Employeetrainr entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employeetrainr", catalog = "performance")
public class Employeetrainr implements java.io.Serializable {

	// Fields

	private Integer employeeTrainRid;
	private Employee employee;
	private Train train;

	// Constructors

	/** default constructor */
	public Employeetrainr() {
	}

	/** full constructor */
	public Employeetrainr(Employee employee, Train train) {
		this.employee = employee;
		this.train = train;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "employeeTrainRId", unique = true, nullable = false)
	public Integer getEmployeeTrainRid() {
		return this.employeeTrainRid;
	}

	public void setEmployeeTrainRid(Integer employeeTrainRid) {
		this.employeeTrainRid = employeeTrainRid;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "train")
	public Train getTrain() {
		return this.train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

}