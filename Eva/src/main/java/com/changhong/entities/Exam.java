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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Exam entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "exam", catalog = "performance")
public class Exam implements java.io.Serializable {

	// Fields

	private Integer examId;
	private String examName;
	private String examLevel;
	private String examLocation;
	private String organizer;
	private String examContent;
	private Date examTime;
	private Integer joinNum;
	private String other;
	private Set<Employeeexamr> employeeexamrs = new HashSet<Employeeexamr>(0);

	// Constructors

	/** default constructor */
	public Exam() {
	}

	/** full constructor */
	public Exam(String examName, String examLevel, String examLocation,
			String organizer, String examContent, Date examTime,
			Integer joinNum, String other, Set<Employeeexamr> employeeexamrs) {
		this.examName = examName;
		this.examLevel = examLevel;
		this.examLocation = examLocation;
		this.organizer = organizer;
		this.examContent = examContent;
		this.examTime = examTime;
		this.joinNum = joinNum;
		this.other = other;
		this.employeeexamrs = employeeexamrs;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "examId", unique = true, nullable = false)
	public Integer getExamId() {
		return this.examId;
	}

	public void setExamId(Integer examId) {
		this.examId = examId;
	}

	@Column(name = "examName", length = 50)
	public String getExamName() {
		return this.examName;
	}

	public void setExamName(String examName) {
		this.examName = examName;
	}

	@Column(name = "examLevel", length = 10)
	public String getExamLevel() {
		return this.examLevel;
	}

	public void setExamLevel(String examLevel) {
		this.examLevel = examLevel;
	}

	@Column(name = "examLocation", length = 50)
	public String getExamLocation() {
		return this.examLocation;
	}

	public void setExamLocation(String examLocation) {
		this.examLocation = examLocation;
	}

	@Column(name = "organizer", length = 30)
	public String getOrganizer() {
		return this.organizer;
	}

	public void setOrganizer(String organizer) {
		this.organizer = organizer;
	}

	@Column(name = "examContent")
	public String getExamContent() {
		return this.examContent;
	}

	public void setExamContent(String examContent) {
		this.examContent = examContent;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "examTime", length = 0)
	public Date getExamTime() {
		return this.examTime;
	}

	public void setExamTime(Date examTime) {
		this.examTime = examTime;
	}

	@Column(name = "joinNum")
	public Integer getJoinNum() {
		return this.joinNum;
	}

	public void setJoinNum(Integer joinNum) {
		this.joinNum = joinNum;
	}

	@Column(name = "other", length = 50)
	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	@OneToMany( fetch = FetchType.LAZY, cascade = CascadeType.REMOVE,mappedBy = "exam")//cascade = CascadeType.ALL,
	public Set<Employeeexamr> getEmployeeexamrs() {
		return this.employeeexamrs;
	}

	public void setEmployeeexamrs(Set<Employeeexamr> employeeexamrs) {
		this.employeeexamrs = employeeexamrs;
	}

}