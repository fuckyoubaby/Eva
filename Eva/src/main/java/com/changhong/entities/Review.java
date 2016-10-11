package com.changhong.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Review entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "review", catalog = "performance")
public class Review implements java.io.Serializable {

	// Fields

	private Integer reviewId;
	private Phase phase;
	private String reviewName;
	private Integer priority;
	private Set<Problem> problems = new HashSet<Problem>(0);

	// Constructors

	/** default constructor */
	public Review() {
	}

	/** full constructor */
	public Review(Phase phase, String reviewName,Integer priority, Set<Problem> problems) {
		this.phase = phase;
		this.reviewName = reviewName;
		this.priority = priority;
		this.problems = problems;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "reviewId", unique = true, nullable = false)
	public Integer getReviewId() {
		return this.reviewId;
	}

	public void setReviewId(Integer reviewId) {
		this.reviewId = reviewId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "phase")
	public Phase getPhase() {
		return this.phase;
	}

	public void setPhase(Phase phase) {
		this.phase = phase;
	}

	@Column(name = "reviewName", length = 25)
	public String getReviewName() {
		return this.reviewName;
	}

	public void setReviewName(String reviewName) {
		this.reviewName = reviewName;
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

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "review")
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

}