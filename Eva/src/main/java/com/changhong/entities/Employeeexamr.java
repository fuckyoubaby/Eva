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
 * Employeeexamr entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employeeexamr", catalog = "performance")
public class Employeeexamr implements java.io.Serializable {

	// Fields

	private Integer employeeExamRid;
	private Employee employee;
	private Exam exam;
	private Integer score;

	// Constructors

	/** default constructor */
	public Employeeexamr() {
	}

	/** full constructor */
	public Employeeexamr(Employee employee, Exam exam, Integer score) {
		this.employee = employee;
		this.exam = exam;
		this.score = score;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "employeeExamRId", unique = true, nullable = false)
	public Integer getEmployeeExamRid() {
		return this.employeeExamRid;
	}

	public void setEmployeeExamRid(Integer employeeExamRid) {
		this.employeeExamRid = employeeExamRid;
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
	@JoinColumn(name = "exam")
	public Exam getExam() {
		return this.exam;
	}

	public void setExam(Exam exam) {
		this.exam = exam;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

}