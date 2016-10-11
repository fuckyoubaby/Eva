package com.changhong.support.problem;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

/**
 * 设计评审Excel数据录入输出模型
 *
 */
public class ProblemModel {

	/**
	 * 
	//原理图评审或这是PCB评审---设计评审
	private String reviewName;
	**/
	
//	private String problemContent;
	/**
	 * 问题列表/名称
	 */
	private String problemName;
	/**
	 * 问题级别
	 */
	private String problemLevel;
	/**
	 * 问题状态
	 */
	private String problemstate;
	/**
	 * 回复/原因说明
	 */
	private String explaintion;	
	/**
	 * 问题类别
	 * 一般设计缺陷
	 */
	private String problemtype;
	/**
	 * 创建时间
	 */
	private Date createTime;
	
	public String getProblemName() {
		return problemName;
	}
	public void setProblemName(String problemName) {
		this.problemName = problemName;
	}
	public String getProblemLevel() {
		return problemLevel;
	}
	public void setProblemLevel(String problemLevel) {
		this.problemLevel = problemLevel;
	}
	public String getProblemstate() {
		return problemstate;
	}
	public void setProblemstate(String problemstate) {
		this.problemstate = problemstate;
	}
	public String getExplaintion() {
		return explaintion;
	}
	public void setExplaintion(String explaintion) {
		this.explaintion = explaintion;
	}
	public String getProblemtype() {
		return problemtype;
	}
	public void setProblemtype(String problemtype) {
		this.problemtype = problemtype;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	@Override
	public String toString() {
		return "ProblemModel [problemName=" + problemName + ", problemLevel="
				+ problemLevel + ", problemstate=" + problemstate
				+ ", explaintion=" + explaintion + ", problemtype="
				+ problemtype + ", createTime="+createTime+", isUseful() =="+isUseful()+"]";
	}
	
	
	public boolean isUseful(){
		if(StringUtils.isBlank(this.problemLevel)||StringUtils.isBlank(this.problemtype)||StringUtils.isBlank(this.problemName)){
			return false;
		}else{
			if(ProblemEnum.isContainer(this.problemLevel)){
				return true;
			}
			return false;
		}
	}
}
