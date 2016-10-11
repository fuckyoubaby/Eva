package com.changhong.support.projectreview;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;

import com.changhong.support.interfaces.Excel2Template;
import com.utility.excel.ExcelHelper;
import com.utility.excel.FileNameUtil;
import com.utility.excel.HssfExcelHelper;
import com.utility.excel.XssfExcelHelper;
/**
 * 项目评审Excel和模板类转换工具类
 * 1、先转换成Map<工作区名，List<模板类>>
 * 2、移除空的项
 * 3、填入项目名称、移除无效数据
 * 4、初始化未填入的值
 *
 * @param <T> 模板类，需实现 canRemove()和 isUseful()两个方法
 * 
 */
public class Template2ProjectReview<T> extends Excel2Template<T> {
	private Date modifyDate = null;
	
	
	public Date getModifyDate() {
		return modifyDate;
	}


	public void setModifyDate(Date modifyDate) {
		this.modifyDate = modifyDate;
	}


	@Override
	public List<T> parse2Obj(String filePath, Class<T> clazz) throws Exception {
		File file = new File(filePath);
		String suffix = FileNameUtil.getFileSuffix(filePath.trim());
		ExcelHelper eh = null;
		eh = suffix.equals("xls") ? HssfExcelHelper.getInstance(file) : XssfExcelHelper.getInstance(file);
		String [] fieldNames = this.getField4Class(clazz);
		List<T> models = eh.readExcel(clazz, fieldNames, 2, 3, 0);
		return models;
	}
	
	
	/**
	 * 转换所有的sheet
	 * @param filePath
	 * @param clazz
	 * @return
	 * @throws Exception
	 */
	public Map<String,List<T>> parseExcel(String filePath, Class<T> clazz, int sheetIndexBegin) throws Exception{
		File file = new File(filePath);
		String suffix = FileNameUtil.getFileSuffix(filePath.trim());
		ExcelHelper eh = null;
		eh = suffix.equals("xls") ? HssfExcelHelper.getInstance(file) : XssfExcelHelper.getInstance(file);
		String [] fieldNames = this.getField4Class(clazz);
		
		Map<String,List<T>> maps = new HashMap<String, List<T>>();
		
		List<String> names = eh.getSheetNames();
		for(int i=sheetIndexBegin;i<names.size();i++){
			List<T> models = eh.readExcel(clazz, fieldNames, i, 3, 0);
			maps.put(names.get(i), models);
		}
		return maps;
	}

	public List<ProjectPosition> getFlagOfLists(List<ProjectReviewInfoModel> lists){
		ProjectReviewInfoModel prim = null;
		List<ProjectPosition> positions = new ArrayList<ProjectPosition>();
		for(int i=0;i<lists.size();i++){
			prim = lists.get(i);
			if(StringUtils.isNotBlank(prim.getProject())){
				ProjectPosition pp = new ProjectPosition(prim.getProject(), i);
				positions.add(pp);
			}
		}
		return positions;
	}
	
	/**
	 * 移除空的数据
	 * @param maps
	 * @return
	 */
	public Map<String,List<T>> removeNullItems(Map<String,List<T>> maps){
		List<String> names= new ArrayList<String> ();
		if(maps!=null && maps.size()>0){
		Set<Entry<String, List<T>>> keySets =  maps.entrySet();
			for(Entry<String, List<T>> entry: keySets){
				List<T> lists = entry.getValue();
				for(int i=lists.size()-1;i>=0;i--){
					T prm = lists.get(i);
					if(canRemove(prm)){
						lists.remove(i);
						continue;
					}
				}
				if(lists.size()==0){
					names.add(entry.getKey());
				}
			}
			for(int m=0;m<names.size();m++){
				maps.remove(names.get(m));
			}
		}
		return maps;
	}
	
	/**
	 * 移除无效数据
	 * @param maps
	 * @return
	 */
	public Map<String,List<T>> removeUnusefulItems(Map<String,List<T>> maps){
		List<String> names= new ArrayList<String> ();
		if(maps!=null && maps.size()>0){
		Set<Entry<String, List<T>>> keySets =  maps.entrySet();
			for(Entry<String, List<T>> entry: keySets){
				List<T> lists = entry.getValue();
				for(int i=lists.size()-1;i>=0;i--){
					T prm = lists.get(i);
					if(!usfulItem(prm)){
						lists.remove(i);
						continue;
					}
				}
				if(lists.size()==0){
					names.add(entry.getKey());
				}
			}
			for(int m=0;m<names.size();m++){
				maps.remove(names.get(m));
			}
		}
		return maps;
	}
	
	
	private boolean canRemove(T t){
		if(t instanceof ProjectReviewInfoModel){
			return ((ProjectReviewInfoModel)t).canRemove();
		}else{
			return false;
		}
	}
	
	private boolean usfulItem(T t){
		if(t instanceof ProjectReviewInfoModel){
			return ((ProjectReviewInfoModel)t).isUseful();
		}else{
			return true;
		}
	}
	
}
