package com.changhong.support.exam;

import java.io.File;
import java.util.List;

import com.changhong.support.interfaces.Excel2Template;
import com.utility.excel.ExcelHelper;
import com.utility.excel.FileNameUtil;
import com.utility.excel.HssfExcelHelper;
import com.utility.excel.XssfExcelHelper;

public class Template2Employeeexamr<T> extends Excel2Template<T>{

	@Override
	public List<T> parse2Obj(String filePath, Class<T> clazz) throws Exception{
		File file = new File(filePath);
		String suffix = FileNameUtil.getFullPathSuffix(filePath.trim());
		ExcelHelper eh = null;
		if(suffix.equals("xls")){
			eh = HssfExcelHelper.getInstance(file);
		}else if (suffix.equals("xlsx")){
			eh = XssfExcelHelper.getInstance(file);
		}
		String[] fieldNames =getField4Class(clazz);
		List<T> results = null;
		try{
			results = eh.readExcel(clazz,fieldNames,0,2,0);
			return results;
		}catch(Exception e){
			e.printStackTrace();
			throw e;
		}
		
	}
	

	/*public static void main(String[] args) {
		Template2Employeeexamr<ExamScoreModel> t2e = new Template2Employeeexamr<ExamScoreModel>();
		String filePath="C:\\Users\\cheeger\\Desktop\\考试成绩模板.xls";
		try {
			List<ExamScoreModel>esmLists =   t2e.parse2Obj(filePath, ExamScoreModel.class);
			for(ExamScoreModel esm: esmLists){
				System.out.println(esm);
			}
			System.out.println("共计"+esmLists.size());
		
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}*/
}
