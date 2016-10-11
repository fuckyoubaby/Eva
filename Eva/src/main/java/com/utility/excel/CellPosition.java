package com.utility.excel;

/**
 * 
 * 位置类
 */
public class CellPosition {

	/**
	 * 工作区名称
	 */
	private String sheetName;
	
	/**
	 * 行位置
	 */
	private int rowIndex;
	/**
	 * 列位置
	 */
	private int columnIndex;
	

	
	public CellPosition(String sheetName, int rowIndex, int columnIndex
			) {
		super();
		this.sheetName = sheetName;
		this.rowIndex = rowIndex;
		this.columnIndex = columnIndex;
	
	}

	public int getRowIndex() {
		return rowIndex;
	}

	public void setRowIndex(int rowIndex) {
		this.rowIndex = rowIndex;
	}

	public int getColumnIndex() {
		return columnIndex;
	}

	public void setColumnIndex(int columnIndex) {
		this.columnIndex = columnIndex;
	}



	public String getSheetName() {
		return sheetName;
	}

	public void setSheetName(String sheetName) {
		this.sheetName = sheetName;
	}

	@Override
	public String toString() {
		return "CellPosition [sheetName=" + sheetName + ", rowIndex="
				+ rowIndex + ", columnIndex=" + columnIndex + "]";
	}
	
	
}
