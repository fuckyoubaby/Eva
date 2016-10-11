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
 * Communication entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "communication", catalog = "performance")
public class Communication implements java.io.Serializable {

	// Fields

	private Integer communicationId;
	private Employee employee;
	private String workEnthusiasm;
	private String communication;
	private String workPlan;

	// Constructors

	/** default constructor */
	public Communication() {
	}

	/** full constructor */
	public Communication(Employee employee, String workEnthusiasm,
			String communication, String workPlan) {
		this.employee = employee;
		this.workEnthusiasm = workEnthusiasm;
		this.communication = communication;
		this.workPlan = workPlan;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "communicationId", unique = true, nullable = false)
	public Integer getCommunicationId() {
		return this.communicationId;
	}

	public void setCommunicationId(Integer communicationId) {
		this.communicationId = communicationId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "workEnthusiasm", length = 10)
	public String getWorkEnthusiasm() {
		return this.workEnthusiasm;
	}

	public void setWorkEnthusiasm(String workEnthusiasm) {
		this.workEnthusiasm = workEnthusiasm;
	}

	@Column(name = "communication", length = 10)
	public String getCommunication() {
		return this.communication;
	}

	public void setCommunication(String communication) {
		this.communication = communication;
	}

	@Column(name = "workPlan", length = 10)
	public String getWorkPlan() {
		return this.workPlan;
	}

	public void setWorkPlan(String workPlan) {
		this.workPlan = workPlan;
	}

}