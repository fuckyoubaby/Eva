package com.changhong.support.projectreview;

public class ProjectPosition {
	/**
	 * 当前的项目名称值
	 */
	private String project;
	/**
	 * 当前的Index
	 */
	private int position;
	
	public ProjectPosition(String project, int position) {
		super();
		this.project = project;
		this.position = position;
	}
	
	public String getProject() {
		return project;
	}
	public void setProject(String project) {
		this.project = project;
	}
	public int getPosition() {
		return position;
	}
	public void setPosition(int position) {
		this.position = position;
	}

	@Override
	public String toString() {
		return "ProjectPosition [project=" + project + ", position=" + position
				+ "]";
	}
	
	
}
