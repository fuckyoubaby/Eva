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
 * Result entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "result", catalog = "performance")
public class Result implements java.io.Serializable {

	// Fields

	private Integer resultId;
	private Overallscore overallscore;
	private Mode mode;
	private Employee employee;
	private Double compliance;
	private Double learningAbility;
	private Double designAbility;
	private Double work;
	private Double communication;
	private Integer score;
	private String other;
	private Date startTime;
	private Date endTime;

	// Constructors

	/** default constructor */
	public Result() {
	}

	/** full constructor */
	public Result(Overallscore overallscore, Mode mode, Employee employee,
			Double compliance, Double learningAbility, Double designAbility,
			Double work, Double communication, Integer score, String other,
			Date startTime, Date endTime) {
		this.overallscore = overallscore;
		this.mode = mode;
		this.employee = employee;
		this.compliance = compliance;
		this.learningAbility = learningAbility;
		this.designAbility = designAbility;
		this.work = work;
		this.communication = communication;
		this.score = score;
		this.other = other;
		this.startTime = startTime;
		this.endTime = endTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "resultId", unique = true, nullable = false)
	public Integer getResultId() {
		return this.resultId;
	}

	public void setResultId(Integer resultId) {
		this.resultId = resultId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "overall")
	public Overallscore getOverallscore() {
		return this.overallscore;
	}

	public void setOverallscore(Overallscore overallscore) {
		this.overallscore = overallscore;
	}

	@ManyToOne(fetch = FetchType.EAGER)
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

	@Column(name = "compliance", precision = 11, scale = 0)
	public Double getCompliance() {
		return this.compliance;
	}

	public void setCompliance(Double compliance) {
		this.compliance = compliance;
	}

	@Column(name = "learningAbility", precision = 11, scale = 0)
	public Double getLearningAbility() {
		return this.learningAbility;
	}

	public void setLearningAbility(Double learningAbility) {
		this.learningAbility = learningAbility;
	}

	@Column(name = "designAbility", precision = 11, scale = 0)
	public Double getDesignAbility() {
		return this.designAbility;
	}

	public void setDesignAbility(Double designAbility) {
		this.designAbility = designAbility;
	}

	@Column(name = "work", precision = 11, scale = 0)
	public Double getWork() {
		return this.work;
	}

	public void setWork(Double work) {
		this.work = work;
	}

	@Column(name = "communication", precision = 11, scale = 0)
	public Double getCommunication() {
		return this.communication;
	}

	public void setCommunication(Double communication) {
		this.communication = communication;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "other", length = 25)
	public String getOther() {
		return this.other;
	}

	public void setOther(String other) {
		this.other = other;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "startTime", length = 0)
	public Date getStartTime() {
		return this.startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "endTime", length = 0)
	public Date getEndTime() {
		return this.endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

}