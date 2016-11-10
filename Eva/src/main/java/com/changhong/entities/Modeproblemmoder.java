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
 * Modeproblemmoder entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "modeproblemmoder", catalog = "performance")
public class Modeproblemmoder implements java.io.Serializable {

	// Fields

	private Integer modeProblemModeRid;
	private Mode mode;
	private Problemmode problemmode;

	// Constructors

	/** default constructor */
	public Modeproblemmoder() {
	}

	/** full constructor */
	public Modeproblemmoder(Mode mode, Problemmode problemmode) {
		this.mode = mode;
		this.problemmode = problemmode;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "modeProblemModeRId", unique = true, nullable = false)
	public Integer getModeProblemModeRid() {
		return this.modeProblemModeRid;
	}

	public void setModeProblemModeRid(Integer modeProblemModeRid) {
		this.modeProblemModeRid = modeProblemModeRid;
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
	@JoinColumn(name = "problemMode")
	public Problemmode getProblemmode() {
		return this.problemmode;
	}

	public void setProblemmode(Problemmode problemmode) {
		this.problemmode = problemmode;
	}

}