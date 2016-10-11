package com.utility.excel.modelTest;

import java.io.File;
import java.util.List;

import com.utility.excel.ExcelHelper;
import com.utility.excel.FileNameUtil;
import com.utility.excel.HssfExcelHelper;
import com.utility.excel.XssfExcelHelper;

public class EMReadTest {
	
	public static void main(String[] args) {
		String filePath = "C:\\Users\\cheeger\\Desktop\\硬件研发部人员名单(2016.06.13).xlsx";
		File file = new File(filePath);
		String suffix = FileNameUtil.getFullPathSuffix(filePath.trim());
		ExcelHelper eh = null;
		if(suffix.equals("xls")){
			eh = HssfExcelHelper.getInstance(file);
		}else if (suffix.equals("xlsx")){
			eh = XssfExcelHelper.getInstance(file);
		}
		
		String[] fieldNames =new String[]{"id","name"};
		
		try {
			List<EmployeeModel> lists = eh.readExcel(EmployeeModel.class, fieldNames, 0, 2, 1);
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}
}
