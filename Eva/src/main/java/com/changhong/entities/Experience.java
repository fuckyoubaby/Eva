package com.changhong.entities;

import java.util.Date;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Experience entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "experience", catalog = "performance")
public class Experience implements java.io.Serializable {

	// Fields

	private Integer experienceId;
	private Employee employee;
	private Classify classify;
	private String experienceName;
	private String county;
	private String area;
	private String abstract_;
	private String mainChip;
	private String keyword;
	private Integer accNum;
	private String exUrl;
	private Date exTime;
	private String exState;
	private String title;
	private Integer score;
	private DataDirt dataDirt;

	// Constructors

	/** default constructor */
	public Experience() {
	}

	/** full constructor */
	public Experience(Employee employee, Classify classify,
			String experienceName, String county, String area,
			String abstract_, String mainChip, String keyword, Integer accNum,
			String exUrl, Date exTime, String exState, String title,
			Integer score,DataDirt dataDirt) {
		this.employee = employee;
		this.classify = classify;
		this.experienceName = experienceName;
		this.county = county;
		this.area = area;
		this.abstract_ = abstract_;
		this.mainChip = mainChip;
		this.keyword = keyword;
		this.accNum = accNum;
		this.exUrl = exUrl;
		this.exTime = exTime;
		this.exState = exState;
		this.title = title;
		this.score = score;
		this.dataDirt = dataDirt;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "experienceId", unique = true, nullable = false)
	public Integer getExperienceId() {
		return this.experienceId;
	}

	public void setExperienceId(Integer experienceId) {
		this.experienceId = experienceId;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee")
	public Employee getEmployee() {
		return this.employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "classify")
	public Classify getClassify() {
		return this.classify;
	}

	public void setClassify(Classify classify) {
		this.classify = classify;
	}

	@Column(name = "experienceName", length = 50)
	public String getExperienceName() {
		return this.experienceName;
	}

	public void setExperienceName(String experienceName) {
		this.experienceName = experienceName;
	}

	@Column(name = "county", length = 25)
	public String getCounty() {
		return this.county;
	}

	public void setCounty(String county) {
		this.county = county;
	}

	@Column(name = "area", length = 50)
	public String getArea() {
		return this.area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	@Column(name = "abstract")
	public String getAbstract_() {
		return this.abstract_;
	}

	public void setAbstract_(String abstract_) {
		this.abstract_ = abstract_;
	}

	@Column(name = "mainChip", length = 25)
	public String getMainChip() {
		return this.mainChip;
	}

	public void setMainChip(String mainChip) {
		this.mainChip = mainChip;
	}

	@Column(name = "keyword")
	public String getKeyword() {
		return this.keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	@Column(name = "accNum")
	public Integer getAccNum() {
		return this.accNum;
	}

	public void setAccNum(Integer accNum) {
		this.accNum = accNum;
	}

	@Column(name = "exUrl")
	public String getExUrl() {
		return this.exUrl;
	}

	public void setExUrl(String exUrl) {
		this.exUrl = exUrl;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "exTime", length = 0)
	public Date getExTime() {
		return this.exTime;
	}

	public void setExTime(Date exTime) {
		this.exTime = exTime;
	}

	@Column(name = "exState", length = 25)
	public String getExState() {
		return this.exState;
	}

	public void setExState(String exState) {
		this.exState = exState;
	}

	@Column(name = "Title", length = 50)
	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "score")
	public Integer getScore() {
		return this.score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}
	
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name="dataDirt")
	public DataDirt getDataDirt()
	{
		return this.dataDirt;
	}
	
	public void setDataDirt(DataDirt dataDirt)
	{
		this.dataDirt = dataDirt;
	}
	

}