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
 * Problemtype entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "problemtype", catalog = "performance")
public class Problemtype implements java.io.Serializable {

	// Fields

	private Integer typeId;
	private String typeName;
	private String explaintion;
	private Set<Problem> problems = new HashSet<Problem>(0);

	// Constructors

	/** default constructor */
	public Problemtype() {
	}

	/** full constructor */
	public Problemtype(String typeName, String explaintion, Set<Problem> problems) {
		this.typeName = typeName;
		this.explaintion = explaintion;
		this.problems = problems;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "typeId", unique = true, nullable = false)
	public Integer getTypeId() {
		return this.typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	@Column(name = "typeName", length = 25)
	public String getTypeName() {
		return this.typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	@Column(name = "explaintion")
	public String getExplaintion() {
		return this.explaintion;
	}

	public void setExplaintion(String explaintion) {
		this.explaintion = explaintion;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "problemtype")
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

}