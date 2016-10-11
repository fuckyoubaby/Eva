package com.changhong.entities;

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

/**
 * Problemstate entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "problemstate", catalog = "performance")
public class Problemstate implements java.io.Serializable {

	// Fields

	private Integer stateId;
	private String problemStateName;
	private String explaintion;
	private Set<Problem> problems = new HashSet<Problem>(0);

	// Constructors

	/** default constructor */
	public Problemstate() {
	}

	/** full constructor */
	public Problemstate(String problemStateName, String explaintion,
			Set<Problem> problems) {
		this.problemStateName = problemStateName;
		this.explaintion = explaintion;
		this.problems = problems;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "stateId", unique = true, nullable = false)
	public Integer getStateId() {
		return this.stateId;
	}

	public void setStateId(Integer stateId) {
		this.stateId = stateId;
	}

	@Column(name = "problemStateName", length = 25)
	public String getProblemStateName() {
		return this.problemStateName;
	}

	public void setProblemStateName(String problemStateName) {
		this.problemStateName = problemStateName;
	}

	@Column(name = "explaintion")
	public String getExplaintion() {
		return this.explaintion;
	}

	public void setExplaintion(String explaintion) {
		this.explaintion = explaintion;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "problemstate")
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

}