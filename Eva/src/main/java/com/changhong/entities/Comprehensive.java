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
 * Comprehensive entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "comprehensive", catalog = "performance")
public class Comprehensive implements java.io.Serializable {

	// Fields

	private Integer comprehensiveId;
	private String name;
	private Integer lowPoint;
	private Integer oneStep;
	private Integer score;
	private String type;
	private Set<Mode> modes = new HashSet<Mode>(0);

	// Constructors

	/** default constructor */
	public Comprehensive() {
	}

	/** full constructor */
	public Comprehensive(String name, Integer lowPoint, Integer oneStep,
			Integer score, String type, Set<Mode> modes) {
		this.name = name;
		this.lowPoint = lowPoint;
		this.oneStep = oneStep;
		this.score = score;
		this.type = type;
		this.modes = modes;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "comprehensiveId", unique = true, nullable = false)
	public Integer getComprehensiveId() {
		return this.comprehensiveId;
	}

	public void setComprehensiveId(Integer comprehensiveId) {
		this.comprehensiveId = comprehensiveId;
	}

	@Column(name = "name", length = 25)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "lowPoint")
	public Integer getLowPoint() {
		return this.lowPoint;
	}

	public void setLowPoint(Integer lowPoint) {
		this.lowPoint = lowPoint;
	}

	@Column(name = "oneStep")
	public Integer getOneStep() {
		return this.oneStep;
	}

	public void setOneStep(Integer oneStep) {
		this.oneStep = oneStep;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	@Column(name = "type", length = 25)
	public String getType() {
		return this.type;
	}

	public void setType(String type) {
		this.type = type;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "comprehensive")
	public Set<Mode> getModes() {
		return this.modes;
	}

	public void setModes(Set<Mode> modes) {
		this.modes = modes;
	}

}