package com.changhong.support.projectreview.datainfo;

import java.util.List;

public class PRProjectDataInfo {
	
	private String project;
	
	private List<PRDataInfo> datas;
	
	
	
	public PRProjectDataInfo() {
		super();
	}

	public PRProjectDataInfo(String project, List<PRDataInfo> datas) {
		super();
		this.project = project;
		this.datas = datas;
	}

	public String getProject() {
		return project;
	}

	public void setProject(String project) {
		this.project = project;
	}

	public List<PRDataInfo> getDatas() {
		return datas;
	}

	public void setDatas(List<PRDataInfo> datas) {
		this.datas = datas;
	}

	@Override
	public String toString() {
		return "PRProjectDataInfo [project=" + project + ", datas=" + datas
				+ "]";
	}
	
	
}
