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
 * Secondweight entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "secondweight", catalog = "performance")
public class Secondweight implements java.io.Serializable {

	// Fields

	private Integer secondWeightId;
	private Mode mode;
	private String oneLevel;
	private String secondLevel;
	private Integer a;
	private Integer b;
	private Integer c;
	private Double weightly;

	// Constructors

	/** default constructor */
	public Secondweight() {
	}

	/** full constructor */
	public Secondweight(Mode mode, String oneLevel, String secondLevel,
			Integer a, Integer b, Integer c, Double weightly) {
		this.mode = mode;
		this.oneLevel = oneLevel;
		this.secondLevel = secondLevel;
		this.a = a;
		this.b = b;
		this.c = c;
		this.weightly = weightly;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "secondWeightId", unique = true, nullable = false)
	public Integer getSecondWeightId() {
		return this.secondWeightId;
	}

	public void setSecondWeightId(Integer secondWeightId) {
		this.secondWeightId = secondWeightId;
	}

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "mode")
	public Mode getMode() {
		return this.mode;
	}

	public void setMode(Mode mode) {
		this.mode = mode;
	}

	@Column(name = "oneLevel")
	public String getOneLevel() {
		return this.oneLevel;
	}

	public void setOneLevel(String oneLevel) {
		this.oneLevel = oneLevel;
	}

	@Column(name = "secondLevel")
	public String getSecondLevel() {
		return this.secondLevel;
	}

	public void setSecondLevel(String secondLevel) {
		this.secondLevel = secondLevel;
	}

	@Column(name = "A")
	public Integer getA() {
		return this.a;
	}

	public void setA(Integer a) {
		this.a = a;
	}

	@Column(name = "B")
	public Integer getB() {
		return this.b;
	}

	public void setB(Integer b) {
		this.b = b;
	}

	@Column(name = "C")
	public Integer getC() {
		return this.c;
	}

	public void setC(Integer c) {
		this.c = c;
	}

	@Column(name = "weightly", precision = 22, scale = 0)
	public Double getWeightly() {
		return this.weightly;
	}

	public void setWeightly(Double weightly) {
		this.weightly = weightly;
	}

}