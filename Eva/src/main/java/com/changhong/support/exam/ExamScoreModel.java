package com.changhong.support.exam;


public class ExamScoreModel {
	//EXCEL模板标题： 
	//姓名	身份ID	手机号	测试得分
	

	/**
	 * 姓名
	 */
	private String name;
	/**
	 * 身份ID
	 */
	private String email;
	/**
	 * 手机号
	 */
	private String phone;
	/**
	 * 测试得分
	 */
	private Integer score;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public Integer getScore() {
		return score;
	}
	public void setScore(Integer score) {
		this.score = score;
	}
	@Override
	public String toString() {
		return "ExamScoreModel [name=" + name + ", email=" + email + ", phone="
				+ phone + ", score=" + score + "]";
	}
	
}
