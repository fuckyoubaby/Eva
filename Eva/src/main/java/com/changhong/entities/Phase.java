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
 * Phase entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "phase", catalog = "performance")
public class Phase implements java.io.Serializable {

	// Fields

	private Integer phaseId;
	private String phaseName;
	private Integer priority;
	private Set<Problem> problems = new HashSet<Problem>(0);

	// Constructors

	/** default constructor */
	public Phase() {
	}

	/** full constructor */
	public Phase(String phaseName, Integer priority, Set<Problem> problems) {
		this.phaseName = phaseName;
		this.priority = priority;
		this.problems = problems;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "phaseId", unique = true, nullable = false)
	public Integer getPhaseId() {
		return this.phaseId;
	}

	public void setPhaseId(Integer phaseId) {
		this.phaseId = phaseId;
	}

	@Column(name = "phaseName", length = 25)
	public String getPhaseName() {
		return this.phaseName;
	}

	public void setPhaseName(String phaseName) {
		this.phaseName = phaseName;
	}
	
	@Column(name="priority")
	public Integer getPriority()
	{
		return this.priority;
	}
	public void setPriority(Integer priority)
	{
		this.priority = priority;
	}
	
	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "phase")
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

}