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

import org.hibernate.annotations.Cache;
import org.hibernate.annotations.CacheConcurrencyStrategy;

/**
 * Assist entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "assist", catalog = "performance")
//@Cache(usage = CacheConcurrencyStrategy.READ_WRITE,region="javaClassName")
public class Assist implements java.io.Serializable {

	// Fields

	private Integer assistId;
	private Employee employee;
	private String assistName;
	private Integer score;
	private Date date;

	// Constructors

	/** default constructor */
	public Assist() {
	}

	/** full constructor */
	public Assist(Employee employee, String assistName, Integer score, Date date) {
		this.employee = employee;
		this.assistName = assistName;
		this.score = score;
		this.date = date;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "assistId", unique = true, nullable = false)
	public Integer getAssistId() {
		return this.assistId;
	}

	public void setAssistId(Integer assistId) {
		this.assistId = assistId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "assistName", length = 25)
	public String getAssistName() {
		return this.assistName;
	}

	public void setAssistName(String assistName) {
		this.assistName = assistName;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "date", length = 0)
	public Date getDate() {
		return this.date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

}