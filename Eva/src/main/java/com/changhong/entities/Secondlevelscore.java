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
 * Secondlevelscore entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "secondlevelscore", catalog = "performance")
public class Secondlevelscore implements java.io.Serializable {

	// Fields

	private Integer secondLevelScoreId;
	private Mode mode;
	private Overallscore overallscore;
	private Employee employee;
	private String oneLevel;
	private String secondLevel;
	private Double score;

	// Constructors

	/** default constructor */
	public Secondlevelscore() {
	}

	/** full constructor */
	public Secondlevelscore(Mode mode, Overallscore overallscore,
			Employee employee, String oneLevel, String secondLevel, Double score) {
		this.mode = mode;
		this.overallscore = overallscore;
		this.employee = employee;
		this.oneLevel = oneLevel;
		this.secondLevel = secondLevel;
		this.score = score;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "secondLevelScoreId", unique = true, nullable = false)
	public Integer getSecondLevelScoreId() {
		return this.secondLevelScoreId;
	}

	public void setSecondLevelScoreId(Integer secondLevelScoreId) {
		this.secondLevelScoreId = secondLevelScoreId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mode")
	public Mode getMode() {
		return this.mode;
	}

	public void setMode(Mode mode) {
		this.mode = mode;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "overallscore")
	public Overallscore getOverallscore() {
		return this.overallscore;
	}

	public void setOverallscore(Overallscore overallscore) {
		this.overallscore = overallscore;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@Column(name = "oneLevel", length = 25)
	public String getOneLevel() {
		return this.oneLevel;
	}

	public void setOneLevel(String oneLevel) {
		this.oneLevel = oneLevel;
	}

	@Column(name = "secondLevel", length = 25)
	public String getSecondLevel() {
		return this.secondLevel;
	}

	public void setSecondLevel(String secondLevel) {
		this.secondLevel = secondLevel;
	}

	@Column(name = "score", precision = 22, scale = 0)
	public Double getScore() {
		return this.score;
	}

	public void setScore(Double score) {
		this.score = score;
	}

}