package com.changhong.util;

public class Params {
	
	private Integer offset;
	private Integer pageNo;
	private Integer pageSize;
	private String keyword;
	private String orderName;
	private String orderType;
	
	
	
	
	public Params(Integer offset, Integer pageNo, Integer pageSize,
			String keyword, String orderName, String orderType) {
		super();
		this.offset = offset;
		this.pageNo = pageNo;
		this.pageSize = pageSize;
		this.keyword = keyword;
		this.orderName = orderName;
		this.orderType = orderType;
	}
	public Integer getOffset() {
		return offset;
	}
	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	public Integer getPageNo() {
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public Integer getPageSize() {
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	
	
	
}
