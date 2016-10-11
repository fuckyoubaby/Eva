package com.changhong.support.projectreview;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import com.changhong.support.projectreview.datainfo.PRDataInfo;
import com.changhong.support.projectreview.datainfo.PRProjectDataInfo;
import com.utility.reflect.ReflectUtil;

public class PRTest {

	public static ProjectReviewInfoModel initInt(ProjectReviewInfoModel pri, String [] fieldNames) throws Exception{
		for(int i=0;i<fieldNames.length;i++){
			Object value = ReflectUtil.invokeGetter(pri, fieldNames[i]);
			if(value==null){
				ReflectUtil.invokeSetter(pri, fieldNames[i], 0);
			}
		}
		return pri;
	}
	
	
	public static void main(String[] args) {
		String filePath="E:/MyWorkSpace/MyEclipseWorkSpace/.metadata/.me_tcat7/me-webapps/Eva/WEB-INF/upload/problem/project/admin/项目评审评价-2016.xls";
		Template2ProjectReview<ProjectReviewInfoModel> t2pr = new Template2ProjectReview<ProjectReviewInfoModel>();
		Map<String,List<ProjectReviewInfoModel> > maps = null;
		try {
			maps = t2pr.parseExcel(filePath, ProjectReviewInfoModel.class, 2);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(maps!=null && maps.size()>0){
			//移除空的记录
			t2pr.removeNullItems(maps);
			//System.out.println(maps.size());
			
			//填入项目名称
//			Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
//			for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
//				List<ProjectReviewInfoModel> lists = entry.getValue();
//				List<ProjectPosition> positions = t2pr.getFlagOfLists(lists);
//				for(int i=0;i<positions.size();i++){
//					ProjectPosition pp = positions.get(i);
//					int beginIndex = pp.getPosition();
//					int endIndex = 0;
//					if(i==positions.size()-1){
//						endIndex = lists.size();
//					}else endIndex = positions.get(i+1).getPosition();
//					
//					for(int j=beginIndex+1;j<endIndex;j++){
//						lists.get(j).setProject(pp.getProject());
//					}
//				}
//			}
			
			ProjectReviewInfoModelUtil.setProjectValue(maps);
			
			//移除无效记录
			t2pr.removeUnusefulItems(maps);
			//设置0值
			
//			String []fieldNames= new String[]{"designReg","flowsheetReg","workplan","communication","workEnt"};
//			for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
//				System.out.println(entry.getKey());
//				List<ProjectReviewInfoModel> lists = entry.getValue();
//				for(int x=0;x<lists.size();x++){
//					try {
//						PRTest.initInt(lists.get(x), fieldNames);
//					} catch (Exception e) {
//						e.printStackTrace();
//					}
//					System.out.println("\t"+lists.get(x));
//				}
//			}
			ProjectReviewInfoModelUtil.setZero(maps);
			
			//打印
			ProjectReviewInfoModelUtil.printMaps(maps);
//			Set<Entry<String, List<ProjectReviewInfoModel>>> keySets =  maps.entrySet();
//			for(Entry<String, List<ProjectReviewInfoModel>> entry: keySets){
//				System.out.println("~~"+entry.getKey()+"~~");
//				List<ProjectPosition> positions = ProjectReviewInfoModelUtil.getOneProjectPositon(entry.getValue());
//				for(int nj=0;nj<positions.size();nj++){
//					System.out.println(positions.get(nj));
//				}
//			}
			
			Map<String, List<PRProjectDataInfo>> results = ProjectReviewInfoModelUtil.changeTemplateAfterSetZero(maps);
			Set<Entry<String, List<PRProjectDataInfo>>> keySets =  results.entrySet();
			for(Entry<String, List<PRProjectDataInfo>> entry: keySets){
				//System.out.println("~~"+entry.getKey()+"~~");
				List<PRProjectDataInfo> prdiLists = entry.getValue();
				for(PRProjectDataInfo prpdi: prdiLists){
					//System.out.println("\t"+prpdi.getProject());
					List<PRDataInfo> prdLists = prpdi.getDatas();
					/*for(PRDataInfo prdi: prdLists){
						System.out.println("\t\t"+prdi);
					}*/
				}
			}
			
		}
	}
}
