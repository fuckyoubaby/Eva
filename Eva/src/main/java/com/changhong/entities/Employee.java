package com.changhong.entities;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Employee entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name = "employee", catalog = "performance")
public class Employee implements java.io.Serializable {

	// Fields

	private String id;
	private Job job;
	private Department department;
	private String name;
	private String password;
	private String email;
	private String tel;
	private String sex;
	private String phone;
	private String VPhone;
	private String address;
	private Integer permission;
	private String emergencyName;//紧急联系人姓名
	private String emergencyTel;//紧急联系人电话
	private Set<Employeeprojectr> employeeprojectrs = new HashSet<Employeeprojectr>(
			0);
	private Set<Employeetrainr> employeetrainrs = new HashSet<Employeetrainr>(0);
	private Set<Employeeexamr> employeeexamrs = new HashSet<Employeeexamr>(0);
	private Set<Communication> communications = new HashSet<Communication>(0);
	private Set<Project> projects = new HashSet<Project>(0);
	private Set<Employeemoder> employeemoders = new HashSet<Employeemoder>(0);
	private Set<Problem> problems = new HashSet<Problem>(0);
	private Set<Experience> experiences = new HashSet<Experience>(0);
	// Constructors
	private boolean enabled = true;
	/** default constructor */
	public Employee() {
	}

	/** minimal constructor */
	public Employee(String id) {
		this.id = id;
	}

	/** full constructor */
	public Employee(String id, Job job, Department department, String name,
			String password, String email, String tel, String sex,
			String phone, String VPhone, String address, Integer permission,String emergencyName,String emergencyTel,
			Set<Employeeprojectr> employeeprojectrs,
			Set<Employeetrainr> employeetrainrs,
			Set<Employeeexamr> employeeexamrs,
			Set<Communication> communications, Set<Project> projects,
			Set<Employeemoder> employeemoders, Set<Problem> problems,
			Set<Experience> experience,boolean enabled) {
		this.id = id;
		this.job = job;
		this.department = department;
		this.name = name;
		this.password = password;
		this.email = email;
		this.tel = tel;
		this.sex = sex;
		this.phone = phone;
		this.VPhone = VPhone;
		this.address = address;
		this.permission = permission;
		this.emergencyName = emergencyName;
		this.emergencyTel = emergencyTel;
		this.employeeprojectrs = employeeprojectrs;
		this.employeetrainrs = employeetrainrs;
		this.employeeexamrs = employeeexamrs;
		this.communications = communications;
		this.projects = projects;
		this.employeemoders = employeemoders;
		this.problems = problems;
		this.experiences = experiences;
		this.enabled = enabled;
	}

	// Property accessors
	@Id
	@Column(name = "id", unique = true, nullable = false, length = 20)
	public String getId() {
		return this.id;
	}

	public void setId(String id) {
		this.id = id;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "job")
	public Job getJob() {
		return this.job;
	}

	public void setJob(Job job) {
		this.job = job;
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "department")
	public Department getDepartment() {
		return this.department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	@Column(name = "name", length = 30)
	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@Column(name = "password", length = 25)
	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Column(name = "email", length = 50)
	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	@Column(name = "tel", length = 20)
	public String getTel() {
		return this.tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	@Column(name = "sex", length = 10)
	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	@Column(name = "phone", length = 25)
	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Column(name = "v_phone", length = 25)
	public String getVPhone() {
		return this.VPhone;
	}

	public void setVPhone(String VPhone) {
		this.VPhone = VPhone;
	}

	@Column(name = "address", length = 100)
	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	@Column(name = "permission")
	public Integer getPermission() {
		return this.permission;
	}

	public void setPermission(Integer permission) {
		this.permission = permission;
	}
	
	@Column(name="EmergencyName")
	public String getEmergencyName()
	{
		return this.emergencyName; 
	}
	
	public void setEmergencyName(String emergencyName)
	{
		this.emergencyName = emergencyName;
	}
	
	@Column(name="EmergencyTel") 
	public String getEmergencyTel(){
		return this.emergencyTel;
	}
	
	public void setEmergencyTel(String emergencyTel)
	{
		this.emergencyTel = emergencyTel;
	}
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")//cascade = CascadeType.ALL, 
	public Set<Employeeprojectr> getEmployeeprojectrs() {
		return this.employeeprojectrs;
	}

	public void setEmployeeprojectrs(Set<Employeeprojectr> employeeprojectrs) {
		this.employeeprojectrs = employeeprojectrs;
	}

	@OneToMany( fetch = FetchType.EAGER, mappedBy = "employee")//cascade = CascadeType.ALL,
	public Set<Employeetrainr> getEmployeetrainrs() {
		return this.employeetrainrs;
	}

	public void setEmployeetrainrs(Set<Employeetrainr> employeetrainrs) {
		this.employeetrainrs = employeetrainrs;
	}

	@OneToMany( fetch = FetchType.EAGER, mappedBy = "employee")//cascade = CascadeType.ALL,
	public Set<Employeeexamr> getEmployeeexamrs() {
		return this.employeeexamrs;
	}

	public void setEmployeeexamrs(Set<Employeeexamr> employeeexamrs) {
		this.employeeexamrs = employeeexamrs;
	}

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "employee")//cascade = CascadeType.ALL, 
	public Set<Communication> getCommunications() {
		return this.communications;
	}

	public void setCommunications(Set<Communication> communications) {
		this.communications = communications;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "employee")
	public Set<Project> getProjects() {
		return this.projects;
	}

	public void setProjects(Set<Project> projects) {
		this.projects = projects;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "employee")
	public Set<Employeemoder> getEmployeemoders() {
		return this.employeemoders;
	}

	public void setEmployeemoders(Set<Employeemoder> employeemoders) {
		this.employeemoders = employeemoders;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "employee")
	public Set<Problem> getProblems() {
		return this.problems;
	}

	public void setProblems(Set<Problem> problems) {
		this.problems = problems;
	}

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER, mappedBy = "employee")
	public Set<Experience> getExperiences() {
		return this.experiences;
	}

	public void setExperiences(Set<Experience> experiences) {
		this.experiences = experiences;
	}
	
	@Column(name="enabled")
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	public boolean isEnabled() {
		return enabled;
	}

	

	@Override
	public boolean equals(Object obj) {
		if (obj instanceof Employee) {
			Employee employee = (Employee) obj;
			return (id.equals(employee.id));
		}
		return super.equals(obj);
	}
	
	@Override
	public int hashCode() {
		Employee employee = (Employee)this;
		return employee.id.hashCode();
	}
}