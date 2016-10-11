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
 * Modecomprehensive entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "modecomprehensive", catalog = "performance")
public class Modecomprehensive implements java.io.Serializable {

	// Fields

	private Integer modeComprehensiveId;
	private Mode mode;
	private Comprehensive comprehensive;

	// Constructors

	/** default constructor */
	public Modecomprehensive() {
	}

	/** full constructor */
	public Modecomprehensive(Mode mode, Comprehensive comprehensive) {
		this.mode = mode;
		this.comprehensive = comprehensive;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "modeComprehensiveId", unique = true, nullable = false)
	public Integer getModeComprehensiveId() {
		return this.modeComprehensiveId;
	}

	public void setModeComprehensiveId(Integer modeComprehensiveId) {
		this.modeComprehensiveId = modeComprehensiveId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "mode")
	public Mode getMode() {
		return this.mode;
	}

	public void setMode(Mode mode) {
		this.mode = mode;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "comprehensive")
	public Comprehensive getComprehensive() {
		return this.comprehensive;
	}

	public void setComprehensive(Comprehensive comprehensive) {
		this.comprehensive = comprehensive;
	}

}