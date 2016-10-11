package com.changhong.support;

import java.io.Serializable;

public class File2JSON implements Serializable{

	/**
	 * 文件名
	 */
	private String fileName;
	/**
	 * 大小
	 */
	private String size;
	/**
	 * 最后修改时间
	 */
	private String lastModify;
	/**
	 * 是否是目录
	 */
	private boolean isDirectory;
	

	public File2JSON(String fileName, String size, String lastModify,
			boolean isDirectory) {
		super();
		this.fileName = fileName;
		this.size = size;
		this.lastModify = lastModify;
		this.isDirectory = isDirectory;
	}
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getSize() {
		return size;
	}
	public void setSize(String size) {
		this.size = size;
	}
	public String getLastModify() {
		return lastModify;
	}
	public void setLastModify(String lastModify) {
		this.lastModify = lastModify;
	}
	public boolean isDirectory() {
		return isDirectory;
	}
	public void setDirectory(boolean isDirectory) {
		this.isDirectory = isDirectory;
	}
	
	
}
