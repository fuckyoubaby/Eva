package com.changhong.util;

public class QuestionCount {
	
	private int commentCount;
	
	private int structureQuestionCount;
	
	private int projectReviewCount;
	
	public QuestionCount() {
		this.commentCount=0;
		this.structureQuestionCount=0;
		this.projectReviewCount =0;
	}

	public QuestionCount(int commentCount, int structureQuestionCount,
			int projectReviewCount) {
		super();
		this.commentCount = commentCount;
		this.structureQuestionCount = structureQuestionCount;
		this.projectReviewCount = projectReviewCount;
	}

	public int getCommentCount() {
		return commentCount;
	}

	public void setCommentCount(int commentCount) {
		this.commentCount = commentCount;
	}

	public int getStructureQuestionCount() {
		return structureQuestionCount;
	}

	public void setStructureQuestionCount(int structureQuestionCount) {
		this.structureQuestionCount = structureQuestionCount;
	}

	public int getProjectReviewCount() {
		return projectReviewCount;
	}

	public void setProjectReviewCount(int projectReviewCount) {
		this.projectReviewCount = projectReviewCount;
	}
	
}
