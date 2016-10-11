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

/**
 * Projectreview entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "projectreview", catalog = "performance")
public class Projectreview implements java.io.Serializable {

	// Fields

	private Integer projectReviewId;
	private Phase phase;
	private Project project;
	private Employee employee;
	private Integer designReg;
	private Integer flowsheetReg;
	private Integer workplan;
	private Integer communication;
	private Integer workEnt;
	private String prexplain;
	private Date prdate;

	// Constructors

	/** default constructor */
	public Projectreview() {
	}

	/** full constructor */
	public Projectreview(Phase phase, Project project, Employee employee,
			Integer designReg, Integer flowsheetReg, Integer workplan,
			Integer communication, Integer workEnt, String prexplain,
			Date prdate) {
		this.phase = phase;
		this.project = project;
		this.employee = employee;
		this.designReg = designReg;
		this.flowsheetReg = flowsheetReg;
		this.workplan = workplan;
		this.communication = communication;
		this.workEnt = workEnt;
		this.prexplain = prexplain;
		this.prdate = prdate;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "projectReviewId", unique = true, nullable = false)
	public Integer getProjectReviewId() {
		return this.projectReviewId;
	}

	public void setProjectReviewId(Integer projectReviewId) {
		this.projectReviewId = projectReviewId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "phase")
	public Phase getPhase() {
		return this.phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
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

	@Column(name = "designReg")
	public Integer getDesignReg() {
		return this.designReg;
	}

	public void setDesignReg(Integer designReg) {
		this.designReg = designReg;
	}

	@Column(name = "flowsheetReg")
	public Integer getFlowsheetReg() {
		return this.flowsheetReg;
	}

	public void setFlowsheetReg(Integer flowsheetReg) {
		this.flowsheetReg = flowsheetReg;
	}

	@Column(name = "workplan")
	public Integer getWorkplan() {
		return this.workplan;
	}

	public void setWorkplan(Integer workplan) {
		this.workplan = workplan;
	}

	@Column(name = "communication")
	public Integer getCommunication() {
		return this.communication;
	}

	public void setCommunication(Integer communication) {
		this.communication = communication;
	}

	@Column(name = "workEnt")
	public Integer getWorkEnt() {
		return this.workEnt;
	}

	public void setWorkEnt(Integer workEnt) {
		this.workEnt = workEnt;
	}

	@Column(name = "PRExplain")
	public String getPrexplain() {
		return this.prexplain;
	}

	public void setPrexplain(String prexplain) {
		this.prexplain = prexplain;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "PRDate", length = 0)
	public Date getPrdate() {
		return this.prdate;
	}

	public void setPrdate(Date prdate) {
		this.prdate = prdate;
	}

}