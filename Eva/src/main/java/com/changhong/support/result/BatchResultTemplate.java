package com.changhong.support.result;
/**
 * 批量添加结果模型
 * @author cheeger
 *
 */
public class BatchResultTemplate {
	/**
	 * 插入的记录数
	 */
	private int importRecodes;
	
	/**
	 *重复记录数 
	 */
	private int repeatRecodes;
	/**
	 * 总记录数
	 */
	private int totalRecodes;
	
	public BatchResultTemplate() {
		super();
	}

	public BatchResultTemplate(int importRecodes, int repeatRecodes,
			int totalRecodes) {
		super();
		this.importRecodes = importRecodes;
		this.repeatRecodes = repeatRecodes;
		this.totalRecodes = totalRecodes;
	}

	public int getImportRecodes() {
		return importRecodes;
	}

	public void setImportRecodes(int importRecodes) {
		this.importRecodes = importRecodes;
	}

	public int getRepeatRecodes() {
		return repeatRecodes;
	}

	public void setRepeatRecodes(int repeatRecodes) {
		this.repeatRecodes = repeatRecodes;
	}

	public int getTotalRecodes() {
		return totalRecodes;
	}

	public void setTotalRecodes(int totalRecodes) {
		this.totalRecodes = totalRecodes;
	}

}
