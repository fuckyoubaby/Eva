package com.changhong.support.problem;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.apache.poi.ss.usermodel.DateUtil;

import com.changhong.support.interfaces.Excel2Template;
import com.utility.date.DateUtils;
import com.utility.excel.CellPosition;
import com.utility.excel.ExcelHelper;
import com.utility.excel.FileNameUtil;
import com.utility.excel.HssfExcelHelper;
import com.utility.excel.XssfExcelHelper;

public class Template2Problem<T> extends Excel2Template<T>{
	private Date createDate = null;
	
	public Date getCreateDate() {
		return createDate;
	}

	@Override
	public List<T> parse2Obj(String filePath, Class<T> clazz) throws Exception {
		//"E:\\项目\\个人量化系统\\批量导入模板\\样机评审表格.xlsx"
		File file = new File(filePath);
		String suffix = FileNameUtil.getFullPathSuffix(filePath.trim());
		ExcelHelper eh = null;
		eh = suffix.equals("xls")?HssfExcelHelper.getInstance(file):XssfExcelHelper.getInstance(file);
		
		String[] filedNames = new String[]{"problemName","problemLevel","problemstate","explaintion","problemtype"};
		CellPosition position = new CellPosition("电路review", 2, 3);
		List<T> lists = null;
		
		try{
			lists = eh.readExcel(clazz,filedNames,4,8,1);
			String content = eh.readExcelInPosition(position);
			Date date = DateUtils.parse(content, "yyyyMMdd");
			createDate =date;
		}catch(Exception e){
			e.printStackTrace();
		}
		
		return lists;
	}
	
	public String readDateFromExcel(String filePath, CellPosition position) throws Exception{
		File file = new File(filePath);
		String fileName = file.getName();
		String suffix = FileNameUtil.getFileSuffix(fileName);
		ExcelHelper eh = null;
		eh = "xls".equals(suffix)?HssfExcelHelper.getInstance(file):XssfExcelHelper.getInstance(file);
		return eh.readExcelInPosition(position);
	}
	
	
	public String readDateFromExcel(File file, CellPosition position) throws Exception{
		String fileName = file.getName();
		String suffix = FileNameUtil.getFileSuffix(fileName);
		ExcelHelper eh = null;
		eh = "xls".equals(suffix)?HssfExcelHelper.getInstance(file):XssfExcelHelper.getInstance(file);
		return eh.readExcelInPosition(position);
	}
	
	
}
