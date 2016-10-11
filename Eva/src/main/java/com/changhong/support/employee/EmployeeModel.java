package com.changhong.support.employee;


public class EmployeeModel {
	/**
	 * 员工编号	
	 */
	private String id;
	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 岗位
	 */
	private String job;
	/**
	 * 手机
	 */
	private String phone;
	/**
	 * V网
	 */
	private String VPhone;
	/**
	 * 座机
	 */
	private String tel;
	/**
	 * 性别
	 */
	private String sex;
	/**
	 * 住址
	 */
	private String address;
	/**邮箱
	 * 
	 */
	private String email;
	/**
	 * 紧急联系人
	 */
	private String emergencyName;
	/**
	 * 紧急联系人电话
	 */
	private String emergencyTel;
	/**
	 * 部门
	 */
	private String department;
	
	
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getVPhone() {
		return VPhone;
	}
	public void setVPhone(String vPhone) {
		VPhone = vPhone;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEmergencyName() {
		return emergencyName;
	}
	public void setEmergencyName(String emergencyName) {
		this.emergencyName = emergencyName;
	}
	public String getEmergencyTel() {
		return emergencyTel;
	}
	public void setEmergencyTel(String emergencyTel) {
		this.emergencyTel = emergencyTel;
	}
	public String getDepartment() {
		return department;
	}
	public void setDepartment(String department) {
		this.department = department;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	@Override
	public String toString() {
		return "EmployeeModel [id=" + id + ", name=" + name + "]";
	}
	
}
