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
 * Trainorg entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "trainorg", catalog = "performance")
public class Trainorg implements java.io.Serializable {

	// Fields

	private Integer trainOrg;
	private Train train;
	private Employee employee;

	// Constructors

	/** default constructor */
	public Trainorg() {
	}

	/** full constructor */
	public Trainorg(Train train, Employee employee) {
		this.train = train;
		this.employee = employee;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "trainOrg", unique = true, nullable = false)
	public Integer getTrainOrg() {
		return this.trainOrg;
	}

	public void setTrainOrg(Integer trainOrg) {
		this.trainOrg = trainOrg;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "trainId")
	public Train getTrain() {
		return this.train;
	}

	public void setTrain(Train train) {
		this.train = train;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employeeId")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

}