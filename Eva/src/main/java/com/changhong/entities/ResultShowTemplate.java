package com.changhong.entities;

import java.util.List;

public class ResultShowTemplate {

	private int scoreRank;
	private Result result;
	
	private List<Secondlevelscore> list;
	public int getScoreRank() {
		return scoreRank;
	}
	public void setScoreRank(int scoreRank) {
		this.scoreRank = scoreRank;
	}
	public Result getResult() {
		return result;
	}
	public void setResult(Result result) {
		this.result = result;
	}
	public List<Secondlevelscore> getList() {
		return list;
	}
	public void setList(List<Secondlevelscore> list) {
		this.list = list;
	}

	
	
}
