package com.changhong.util;

/**
 * 经验库查询使用ExpParam参数类
 *
 */
public class ExpParams extends Params {

	private String state;
	private int dirctId;
	private boolean hasChild;
	
	public ExpParams(Integer offset, Integer pageNo, Integer pageSize,
			String keyword, String orderName, String orderType) {
		super(offset, pageNo, pageSize, keyword, orderName, orderType);
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public int getDirctId() {
		return dirctId;
	}

	public void setDirctId(int dirctId) {
		this.dirctId = dirctId;
	}

	public boolean isHasChild() {
		return hasChild;
	}

	public void setHasChild(boolean hasChild) {
		this.hasChild = hasChild;
	}


}
