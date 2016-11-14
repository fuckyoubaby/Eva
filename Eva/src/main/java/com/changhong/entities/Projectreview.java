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
	private String designExplain;
	private Integer flowsheetReg;
	private String flowExplain;
	private Integer workplan;
	private String workPlanExplain;
	private Integer communication;
	private String communicationExplain;
	private Integer workEnt;
	private String workEntExplain;
	private String prexplain;
	private Date prdate;

	// Constructors

	/** default constructor */
	public Projectreview() {
	}

	/** full constructor */
	public Projectreview(Phase phase, Project project, Employee employee,
			Integer designReg, String designExplain, Integer flowsheetReg,
			String flowExplain, Integer workplan, String workPlanExplain,
			Integer communication, String communicationExplain,
			Integer workEnt, String workEntExplain, String prexplain,
			Date prdate) {
		this.phase = phase;
		this.project = project;
		this.employee = employee;
		this.designReg = designReg;
		this.designExplain = designExplain;
		this.flowsheetReg = flowsheetReg;
		this.flowExplain = flowExplain;
		this.workplan = workplan;
		this.workPlanExplain = workPlanExplain;
		this.communication = communication;
		this.communicationExplain = communicationExplain;
		this.workEnt = workEnt;
		this.workEntExplain = workEntExplain;
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

	@Column(name = "designExplain")
	public String getDesignExplain() {
		return this.designExplain;
	}

	public void setDesignExplain(String designExplain) {
		this.designExplain = designExplain;
	}

	@Column(name = "flowsheetReg")
	public Integer getFlowsheetReg() {
		return this.flowsheetReg;
	}

	public void setFlowsheetReg(Integer flowsheetReg) {
		this.flowsheetReg = flowsheetReg;
	}

	@Column(name = "flowExplain")
	public String getFlowExplain() {
		return this.flowExplain;
	}

	public void setFlowExplain(String flowExplain) {
		this.flowExplain = flowExplain;
	}

	@Column(name = "workplan")
	public Integer getWorkplan() {
		return this.workplan;
	}

	public void setWorkplan(Integer workplan) {
		this.workplan = workplan;
	}

	@Column(name = "workPlanExplain")
	public String getWorkPlanExplain() {
		return this.workPlanExplain;
	}

	public void setWorkPlanExplain(String workPlanExplain) {
		this.workPlanExplain = workPlanExplain;
	}

	@Column(name = "communication")
	public Integer getCommunication() {
		return this.communication;
	}

	public void setCommunication(Integer communication) {
		this.communication = communication;
	}

	@Column(name = "communicationExplain")
	public String getCommunicationExplain() {
		return this.communicationExplain;
	}

	public void setCommunicationExplain(String communicationExplain) {
		this.communicationExplain = communicationExplain;
	}

	@Column(name = "workEnt")
	public Integer getWorkEnt() {
		return this.workEnt;
	}

	public void setWorkEnt(Integer workEnt) {
		this.workEnt = workEnt;
	}

	@Column(name = "workEntExplain")
	public String getWorkEntExplain() {
		return this.workEntExplain;
	}

	public void setWorkEntExplain(String workEntExplain) {
		this.workEntExplain = workEntExplain;
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