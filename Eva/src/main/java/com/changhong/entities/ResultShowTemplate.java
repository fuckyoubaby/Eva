package com.changhong.entities;

import java.util.List;

public class ResultShowTemplate {

	private int scoreRank;//名次
	private int pingshenTimes;//评审次数
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
	public int getPingshenTimes() {
		return pingshenTimes;
	}
	public void setPingshenTimes(int pingshenTimes) {
		this.pingshenTimes = pingshenTimes;
	}

	
	
}
