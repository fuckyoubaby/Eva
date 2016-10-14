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
 * Problem entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "problem", catalog = "performance")
public class Problem implements java.io.Serializable {

	// Fields

	private Integer problemId;
	private Employee employee;
	private Review review;
	private Project project;
	private Problemstate problemstate;
	private Phase phase;
	private Comment comment;
	private Problemtype problemtype;
	private String problemName;
	private String problemContent;
	private String problemLevel;
	private String problemLoction;
	private String explaintion;
	private String imageurl;
	private Date createTime;

	// Constructors

	/** default constructor */
	public Problem() {
	}

	/** full constructor */
	public Problem(Employee employee, Review review, Project project,
			Problemstate problemstate, Phase phase, Comment comment, Problemtype problemtype,
			String problemName, String problemContent, String problemLevel,
			String problemLoction, String explaintion, String imageurl,
			Date createTime) {
		this.employee = employee;
		this.review = review;
		this.project = project;
		this.problemstate = problemstate;
		this.phase = phase;
		this.comment = comment;
		this.problemtype = problemtype;
		this.problemName = problemName;
		this.problemContent = problemContent;
		this.problemLevel = problemLevel;
		this.problemLoction = problemLoction;
		this.explaintion = explaintion;
		this.imageurl = imageurl;
		this.createTime = createTime;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "problemId", unique = true, nullable = false)
	public Integer getProblemId() {
		return this.problemId;
	}

	public void setProblemId(Integer problemId) {
		this.problemId = problemId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemBelong")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "review")
	public Review getReview() {
		return this.review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemBelongProject")
	public Project getProject() {
		return this.project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemState")
	public Problemstate getProblemstate() {
		return this.problemstate;
	}

	public void setProblemstate(Problemstate problemstate) {
		this.problemstate = problemstate;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "phase")
	public Phase getPhase() {
		return this.phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "commentId")
	public Comment getComment() {
		return comment;
	}

	public void setComment(Comment comment) {
		this.comment = comment;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemType")
	public Problemtype getProblemtype() {
		return this.problemtype;
	}

	public void setProblemtype(Problemtype problemtype) {
		this.problemtype = problemtype;
	}

	@Column(name = "problemName", length = 50)
	public String getProblemName() {
		return this.problemName;
	}

	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}

	@Column(name = "problemContent")
	public String getProblemContent() {
		return this.problemContent;
	}

	public void setProblemContent(String problemContent) {
		this.problemContent = problemContent;
	}

	@Column(name = "problemLevel", length = 25)
	public String getProblemLevel() {
		return this.problemLevel;
	}

	public void setProblemLevel(String problemLevel) {
		this.problemLevel = problemLevel;
	}

	@Column(name = "problemLoction", length = 25)
	public String getProblemLoction() {
		return this.problemLoction;
	}

	public void setProblemLoction(String problemLoction) {
		this.problemLoction = problemLoction;
	}

	@Column(name = "explaintion")
	public String getExplaintion() {
		return this.explaintion;
	}

	public void setExplaintion(String explaintion) {
		this.explaintion = explaintion;
	}

	@Column(name = "imageurl", length = 100)
	public String getImageurl() {
		return this.imageurl;
	}

	public void setImageurl(String imageurl) {
		this.imageurl = imageurl;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "createTime", length = 0)
	public Date getCreateTime() {
		return this.createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

}