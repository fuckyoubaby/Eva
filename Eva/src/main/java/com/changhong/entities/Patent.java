package com.changhong.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Patent entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "patent", catalog = "performance")
public class Patent implements java.io.Serializable {

	// Fields

	private String patentId;
	private Employee employee;
	private String patentName;
	private String patentType;
	private Date date;
	private String patentExplain;

	// Constructors

	/** default constructor */
	public Patent() {
	}

	/** minimal constructor */
	public Patent(String patentId) {
		this.patentId = patentId;
	}

	/** full constructor */
	public Patent(String patentId, Employee employee, String patentName,
			String patentType, Date date,String patentExplain) {
		this.patentId = patentId;
		this.employee = employee;
		this.patentName = patentName;
		this.patentType = patentType;
		this.date = date;
		this.patentExplain = patentExplain;
	}

	// Property accessors
	@Id
	@Column(name = "patentId", unique = true, nullable = false, length = 25)
	public String getPatentId() {
		return this.patentId;
	}

	public void setPatentId(String patentId) {
		this.patentId = patentId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "patentName")
	public String getPatentName() {
		return this.patentName;
	}

	public void setPatentName(String patentName) {
		this.patentName = patentName;
	}

	@Column(name = "patentType", length = 25)
	public String getPatentType() {
		return this.patentType;
	}

	public void setPatentType(String patentType) {
		this.patentType = patentType;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date", length = 0)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public String getPatentExplain() {
		return patentExplain;
	}

	@Column(name="patentExplain")
	public void setPatentExplain(String patentExplain) {
		this.patentExplain = patentExplain;
	}

	
}