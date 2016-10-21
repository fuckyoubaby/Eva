package com.changhong.entities;

/**
 * 排名适配器类
 * @author shijinxiang
 *
 */
public class RankObject {
	
	private int scoreRank;//排名
	private Object object;
	
	public RankObject(int scoreRank,Object object) {
		this.scoreRank = scoreRank;
		this.object = object;
	}

	public int getScoreRank() {
		return scoreRank;
	}

	public void setScoreRank(int scoreRank) {
		this.scoreRank = scoreRank;
	}

	public Object getObject() {
		return object;
	}

	public void setObject(Object object) {
		this.object = object;
	}
	

}
