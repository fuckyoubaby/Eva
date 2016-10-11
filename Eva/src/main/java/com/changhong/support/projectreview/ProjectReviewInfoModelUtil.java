package com.changhong.support.projectreview;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Map.Entry;

import org.apache.commons.lang3.StringUtils;

import com.changhong.support.projectreview.datainfo.PRDataInfo;
import com.changhong.support.projectreview.datainfo.PRProjectDataInfo;
import com.utility.reflect.ReflectUtil;

public class ProjectReviewInfoModelUtil {
	
	public static ProjectReviewInfoModel initInt(ProjectReviewInfoModel pri, String [] fieldNames) throws Exception{
		for(int i=0;i<fieldNames.length;i++){
			Object value = ReflectUtil.invokeGetter(pri, fieldNames[i]);
			if(value==null){
				ReflectUtil.invokeSetter(pri, fieldNames[i], 0);
			}
		}
		return pri;
	}
	/**
	 * 获取所属同一项目的起点位置
	 * @param lists
	 * @return
	 */
	public static List<ProjectPosition> getFlagOfLists(List<ProjectReviewInfoModel> lists){
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
	 * 获取同一项目的起点位置
	 * @param lists
	 * @return
	 */
	public static List<ProjectPosition> getOneProjectPositon(List<ProjectReviewInfoModel> lists){
		ProjectReviewInfoModel prim = null;
		List<ProjectPosition> positions = new ArrayList<ProjectPosition>();
		String tempName = "";
		int i=0;
		while(i<lists.size()){
			int offset = 1;
			prim = lists.get(i);
			tempName= prim.getProject();
			ProjectPosition position = new ProjectPosition(tempName, i);
			for(int j=i+1;j<lists.size();j++){
				ProjectReviewInfoModel temp = lists.get(j);
				if(temp.getProject().equals(tempName)){
					offset++;
					continue;
				}else{
					break;
				}
			}
			positions.add(position);
			i+=offset;
		}
		return positions;
	}
	
	
	public static void setProjectValue(Map<String,List<ProjectReviewInfoModel> > maps){
		Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
		for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
			List<ProjectReviewInfoModel> lists = entry.getValue();
			List<ProjectPosition> positions = getFlagOfLists(lists);
			for(int i=0;i<positions.size();i++){
				ProjectPosition pp = positions.get(i);
				int beginIndex = pp.getPosition();
				int endIndex = 0;
				if(i==positions.size()-1){
					endIndex = lists.size();
				}else endIndex = positions.get(i+1).getPosition();
				
				for(int j=beginIndex+1;j<endIndex;j++){
					lists.get(j).setProject(pp.getProject());
				}
			}
		}
		
	}

	public static void setZero(Map<String,List<ProjectReviewInfoModel> > maps){
		String []fieldNames= new String[]{"designReg","flowsheetReg","workplan","communication","workEnt"};
		Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
		for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
			List<ProjectReviewInfoModel> lists = entry.getValue();
			for(int x=0;x<lists.size();x++){
				try {
					initInt(lists.get(x), fieldNames);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	public static void printMaps(Map<String,List<ProjectReviewInfoModel> > maps){
		Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
		for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
			//System.out.println("【"+entry.getKey()+"】");
			List<ProjectReviewInfoModel> lists = entry.getValue();
			/*for(int x=0;x<lists.size();x++){
				System.out.println("\t"+lists.get(x));
			}*/
		}
	}
	
	
	
	public static Map<String, List<PRProjectDataInfo>> changeTemplateBeforeRMUnuse(Map<String,List<ProjectReviewInfoModel> > maps){
		 Map<String, List<PRProjectDataInfo>> reults = new HashMap<String, List<PRProjectDataInfo>>();
		 Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
			for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
				List<PRProjectDataInfo> prpDatas = new ArrayList<PRProjectDataInfo>();

				List<ProjectReviewInfoModel> lists = entry.getValue();
				List<ProjectPosition> positions = getFlagOfLists(lists);
				
				for(int i=0;i<positions.size();i++){
					ProjectPosition pp = positions.get(i);
					int beginIndex = pp.getPosition();
					int endIndex = 0;
					if(i==positions.size()-1){
						endIndex = lists.size();
					}else endIndex = positions.get(i+1).getPosition();
					//一个项目记录对象
					PRProjectDataInfo prpdi = new PRProjectDataInfo();
					prpdi.setProject(pp.getProject());
					List<PRDataInfo> datas = new ArrayList<PRDataInfo>();
						for(int j=beginIndex;j<endIndex;j++){
							ProjectReviewInfoModel prim = lists.get(j);
							PRDataInfo data = new PRDataInfo(prim.getPhase() , prim.getDesignReg(), prim.getFlowsheetReg(),
									prim.getWorkplan(),prim.getCommunication(),prim.getWorkEnt(),prim.getPrexplain());
							datas.add(data);
						}
					prpdi.setDatas(datas);
					prpDatas.add(prpdi);
				}
				
				reults.put(entry.getKey(), prpDatas);
			}
			return reults;
	}
	
	public static Map<String, List<PRProjectDataInfo>> changeTemplateAfterSetZero(Map<String,List<ProjectReviewInfoModel> > maps){
		Map<String, List<PRProjectDataInfo>> reults = new HashMap<String, List<PRProjectDataInfo>>();
		 Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
			for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
				String employeeName = entry.getKey();
				List<PRProjectDataInfo> prpDatas = new ArrayList<PRProjectDataInfo>();
				List<ProjectReviewInfoModel> models = entry.getValue();
				List<ProjectPosition> positions = getOneProjectPositon(models);
				
				for(int i=0;i<positions.size();i++){
					ProjectPosition pp = positions.get(i);
					int beginIndex = pp.getPosition();
					int endIndex = 0;
					if(i==positions.size()-1){
						endIndex = models.size();
					}else endIndex = positions.get(i+1).getPosition();
					//一个项目记录对象
					PRProjectDataInfo prpdi = new PRProjectDataInfo();
					prpdi.setProject(pp.getProject());
					List<PRDataInfo> datas = new ArrayList<PRDataInfo>();
						for(int j=beginIndex;j<endIndex;j++){
							ProjectReviewInfoModel prim = models.get(j);
							PRDataInfo data = new PRDataInfo(prim.getPhase() , prim.getDesignReg(), prim.getFlowsheetReg(),
									prim.getWorkplan(),prim.getCommunication(),prim.getWorkEnt(),prim.getPrexplain());
							datas.add(data);
						}
					prpdi.setDatas(datas);
					prpDatas.add(prpdi);
				}
				reults.put(employeeName, prpDatas);
			}
			return reults;
	}
	
}
