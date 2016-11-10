package com.changhong.support.projectreview;

import java.util.Date;

import org.apache.commons.lang3.StringUtils;

import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
/**
 * 项目评审Excel读取转换模型，与Projectreview实体类互转换
 * @see com.changhong.entities.Projectreview Projectreview
 *
 */
public class ProjectReviewInfoModel {

	/**
	 * 项目名称，对应实体类 Project # Projectreview.project
	 */
	private String project;
	/**
	 * 阶段名称，对应实体类 Phase # Projectreview.phase
	 */
	private String phase;
	
	/**
	 * 设计规定
	 */
	private Integer designReg;
	/**
	 * 流程规定
	 */
	private Integer flowsheetReg;
	/**
	 * 工作计划性差
	 */
	private Integer workplan;
	/**
	 * 沟通低效
	 */
	private Integer communication;
	/**
	 * 工作积极性
	 */
	private Integer workEnt;
	/**
	 * 扣分说明
	 */
	private String prexplain;
	

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public String getPhase() {
		return phase;
	}

	public void setPhase(String phase) {
		this.phase = phase;
	}


	public Integer getDesignReg() {
		return designReg;
	}

	public void setDesignReg(Integer designReg) {
		this.designReg = designReg;
	}

	public Integer getFlowsheetReg() {
		return flowsheetReg;
	}

	public void setFlowsheetReg(Integer flowsheetReg) {
		this.flowsheetReg = flowsheetReg;
	}

	public Integer getWorkplan() {
		return workplan;
	}

	public void setWorkplan(Integer workplan) {
		this.workplan = workplan;
	}

	public Integer getCommunication() {
		return communication;
	}

	public void setCommunication(Integer communication) {
		this.communication = communication;
	}

	public Integer getWorkEnt() {
		return workEnt;
	}

	public void setWorkEnt(Integer workEnt) {
		this.workEnt = workEnt;
	}

	public String getPrexplain() {
		return prexplain;
	}

	public void setPrexplain(String prexplain) {
		this.prexplain = prexplain;
	}

	public boolean isUseful(){
		if(StringUtils.isNotBlank(project)&&StringUtils.isNotBlank(prexplain)){
			if (prexplain.trim().equals("无此阶段")) {
				return false;
			}
			return true;
		}
		return false;
	}
	
	public boolean canRemove(){
		if(StringUtils.isNotBlank(project) || StringUtils.isNotBlank(prexplain)){
			return false;
		}
		return true;
	}
	
	@Override
	public String toString() {
		return "ProjectReviewInfoModel [project=" + project + ", phase="
				+ phase + ", designReg=" + designReg
				+ ", flowsheetReg=" + flowsheetReg + ", workplan=" + workplan
				+ ", communication=" + communication + ", workEnt=" + workEnt
				+ ", prexplain=" + prexplain + ", isUseful()--"+isUseful()+"]";
	}
	
	
	
}
