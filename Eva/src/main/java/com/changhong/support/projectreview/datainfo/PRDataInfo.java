package com.changhong.support.projectreview.datainfo;

public class PRDataInfo {

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
	
	public PRDataInfo(String phase, Integer designReg, Integer flowsheetReg,
			Integer workplan, Integer communication, Integer workEnt,
			String prexplain) {
		super();
		this.phase = phase;
		this.designReg = designReg;
		this.flowsheetReg = flowsheetReg;
		this.workplan = workplan;
		this.communication = communication;
		this.workEnt = workEnt;
		this.prexplain = prexplain;
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
	@Override
	public String toString() {
		return "PRDataInfo [phase=" + phase + ", designReg=" + designReg
				+ ", flowsheetReg=" + flowsheetReg + ", workplan=" + workplan
				+ ", communication=" + communication + ", workEnt=" + workEnt
				+ ", prexplain=" + prexplain + "]";
	}
	
}
