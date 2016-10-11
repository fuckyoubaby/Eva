package com.changhong.support;

import java.io.Serializable;
import java.util.Date;

public class FileInfo implements Serializable, Comparable<FileInfo>{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * 文件名称
	 */
	private String name;
	
	/**
	 * 大小
	 */
	private String size;
	/**
	 * 最后修改时间 
	 */
	private Date lasModify;

	/**
	 * 是否是目录
	 */
	private boolean directory;
	
	
	public FileInfo(String name, String size, Date lasModify, boolean directory) {
		super();
		this.name = name;
		this.size = size;
		this.lasModify = lasModify;
		this.directory = directory;
	}

	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSize() {
		return size;
	}

	public void setSize(String size) {
		this.size = size;
	}

	public Date getLasModify() {
		return lasModify;
	}

	public void setLasModify(Date lasModify) {
		this.lasModify = lasModify;
	}

	public boolean isDirectory() {
		return directory;
	}

	public void setDirectory(boolean directory) {
		this.directory = directory;
	}


	@Override
	public int compareTo(FileInfo o) {
		return this.getLasModify().compareTo(o.getLasModify());
	}

}
