package com.changhong.entities;

import java.util.Date;
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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

/**
 * Train entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "train", catalog = "performance")
public class Train implements java.io.Serializable {

	// Fields

	private Integer trainId;
	private String trainName;
	private String trainContent;
	private String trainLocation;
	private String trainLevel;
	private String information;
	private Date trainTime;
	private String teacher;
	private Integer joinNum;
	private Employee employee;
	private Set<Employeetrainr> employeetrainrs = new HashSet<Employeetrainr>(0);
	private Set<Trainorg> trainorgs = new HashSet<Trainorg>(0);

	// Constructors

	/** default constructor */
	public Train() {
	}

	/** full constructor */
	public Train(String trainName, String trainContent, String trainLocation,
			String trainLevel, String information, Date trainTime,
			String teacher, Integer joinNum,Employee employee, Set<Employeetrainr> employeetrainrs,Set<Trainorg> trainorgs) {
		this.trainName = trainName;
		this.trainContent = trainContent;
		this.trainLocation = trainLocation;
		this.trainLevel = trainLevel;
		this.information = information;
		this.trainTime = trainTime;
		this.teacher = teacher;
		this.joinNum = joinNum;
		this.employee = employee;
		this.employeetrainrs = employeetrainrs;
		this.trainorgs = trainorgs;
	}

	// Property accessors
	@Id
	@GeneratedValue
	@Column(name = "trainId", unique = true, nullable = false)
	public Integer getTrainId() {
		return this.trainId;
	}

	public void setTrainId(Integer trainId) {
		this.trainId = trainId;
	}

	@Column(name = "trainName", length = 50)
	public String getTrainName() {
		return this.trainName;
	}

	public void setTrainName(String trainName) {
		this.trainName = trainName;
	}

	@Column(name = "trainContent")
	public String getTrainContent() {
		return this.trainContent;
	}

	public void setTrainContent(String trainContent) {
		this.trainContent = trainContent;
	}

	@Column(name = "trainLocation", length = 50)
	public String getTrainLocation() {
		return this.trainLocation;
	}

	public void setTrainLocation(String trainLocation) {
		this.trainLocation = trainLocation;
	}

	@Column(name = "trainLevel", length = 10)
	public String getTrainLevel() {
		return this.trainLevel;
	}

	public void setTrainLevel(String trainLevel) {
		this.trainLevel = trainLevel;
	}

	@Column(name = "information")
	public String getInformation() {
		return this.information;
	}

	public void setInformation(String information) {
		this.information = information;
	}

	@Temporal(TemporalType.DATE)
	@Column(name = "trainTime", length = 0)
	public Date getTrainTime() {
		return this.trainTime;
	}

	public void setTrainTime(Date trainTime) {
		this.trainTime = trainTime;
	}

	@Column(name = "teacher", length = 30)
	public String getTeacher() {
		return this.teacher;
	}

	public void setTeacher(String teacher) {
		this.teacher = teacher;
	}

	@Column(name = "joinNum")
	public Integer getJoinNum() {
		return this.joinNum;
	}

	public void setJoinNum(Integer joinNum) {
		this.joinNum = joinNum;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "employee")
	public Employee getEmployee(){
		return this.employee;
	}
	public void setEmployee(Employee employee){
		this.employee = employee;
	}
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.REMOVE, mappedBy = "train")//cascade = CascadeType.ALL, 
	public Set<Employeetrainr> getEmployeetrainrs() {
		return this.employeetrainrs;
	}

	public void setEmployeetrainrs(Set<Employeetrainr> employeetrainrs) {
		this.employeetrainrs = employeetrainrs;
	}
	
	@OneToMany(fetch = FetchType.LAZY,cascade = CascadeType.REMOVE,mappedBy = "train")
	public Set<Trainorg> getTrainorgs(){
		return this.trainorgs;
	}
	
	public void setTrainorgs(Set<Trainorg> trainorgs){
		this.trainorgs = trainorgs;
	}

}