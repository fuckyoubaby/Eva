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
 * Problemmode entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "problemmode", catalog = "performance")
public class Problemmode implements java.io.Serializable {

	// Fields

	private Integer problemModeId;
	private Problemtype problemtype;
	private String problemTypeName;
	private Integer a;
	private Integer b;
	private Integer c;
	private Integer d;
	private Integer scale;
	private Integer total;
	private Set<Mode> modes = new HashSet<Mode>(0);

	// Constructors

	/** default constructor */
	public Problemmode() {
	}

	/** full constructor */
	public Problemmode(Problemtype problemtype, String problemTypeName,
			Integer a, Integer b, Integer c, Integer d, Integer scale,
			Integer total, Set<Mode> modes) {
		this.problemtype = problemtype;
		this.problemTypeName = problemTypeName;
		this.a = a;
		this.b = b;
		this.c = c;
		this.d = d;
		this.scale = scale;
		this.total = total;
		this.modes = modes;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "problemModeId", unique = true, nullable = false)
	public Integer getProblemModeId() {
		return this.problemModeId;
	}

	public void setProblemModeId(Integer problemModeId) {
		this.problemModeId = problemModeId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "problemType")
	public Problemtype getProblemtype() {
		return this.problemtype;
	}

	public void setProblemtype(Problemtype problemtype) {
		this.problemtype = problemtype;
	}

	@Column(name = "problemTypeName", length = 50)
	public String getProblemTypeName() {
		return this.problemTypeName;
	}

	public void setProblemTypeName(String problemTypeName) {
		this.problemTypeName = problemTypeName;
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

	@Column(name = "D")
	public Integer getD() {
		return this.d;
	}

	public void setD(Integer d) {
		this.d = d;
	}

	@Column(name = "scale")
	public Integer getScale() {
		return this.scale;
	}

	public void setScale(Integer scale) {
		this.scale = scale;
	}

	@Column(name = "total")
	public Integer getTotal() {
		return this.total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "problemmode")
	public Set<Mode> getModes() {
		return this.modes;
	}

	public void setModes(Set<Mode> modes) {
		this.modes = modes;
	}

}