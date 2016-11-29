package com.changhong.service.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.EmployeeDao;
import com.changhong.dao.EmployeeProjectRDao;
import com.changhong.dao.PhaseDao;
import com.changhong.dao.ProjectDao;
import com.changhong.dao.ProjectReviewDao;
import com.changhong.entities.Employee;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
import com.changhong.entities.Projectreview;
import com.changhong.service.ProjectReviewService;
import com.changhong.support.projectreview.ProjectReviewInfoModel;
import com.changhong.support.projectreview.datainfo.PRDataInfo;
import com.changhong.support.projectreview.datainfo.PRProjectDataInfo;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;
import com.utility.reflect.ReflectUtil;

@Service("projectReviewService")
public class ProjectReviewServiceImpl implements ProjectReviewService{

	@Autowired
	private ProjectReviewDao projectReviewDao;
	
	@Autowired
	private PhaseDao phaseDao;
	
	@Autowired
	private ProjectDao projectDao;
	
	@Autowired
	private EmployeeDao employeeDao;
	
	@Autowired
	private EmployeeProjectRDao employeeProjectDao;
	
	@Override
	public List<Projectreview> getProjectreviewsByEmployeeIdAndDate(
			String employeeId, Date startDate, Date endDate) {
		return projectReviewDao.getProjectreviewsByEmployeeIdAndDate(employeeId, startDate, endDate);
	}

	@Override
	public List<Projectreview> getProjectreviewsByProjectId(String projectId) {
		return projectReviewDao.getProjectreviewsByProjectId(projectId);
	}

	@Override
	public void save(Projectreview projectreview) {
		projectReviewDao.save(projectreview);
	}

	@Override
	public void update(Projectreview projectreview) {
		projectReviewDao.update(projectreview);
	}

	@Override
	public void delete(Projectreview projectreview) {
		projectReviewDao.delete(projectreview);
	}

	@Override
	public List<Projectreview> getProjectreviewsByProjectIdForPage(
			Params params, String projectId, int phaseId) {
		return projectReviewDao.getProjectreviewsByProjectIdForPage(params, projectId, phaseId);
	}

	@Override
	public int getAmountByProjectIdForPage(Params params, String projectId,
			int phaseId) {
		return projectReviewDao.getAmountByProjectIdForPage(params, projectId,phaseId);
	}


	@Override
	public BatchResultTemplate saveBatch(List<Projectreview> lists) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(lists == null | lists.size()<1){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		brt.setTotalRecodes(lists.size());
		int repeatount = 0;
		brt.setRepeatRecodes(repeatount);
		brt.setImportRecodes(projectReviewDao.save(lists));
		return brt;
	}

	@Override
	public BatchResultTemplate batchImport(
			Map<String, List<PRProjectDataInfo>> maps,
			Date modifyDate) {
		
		List<Projectreview> prLists = new ArrayList<Projectreview>();
		Map<String,Phase> phaseMaps = initPhase(phaseDao);
		
		/**
		 * 有效数据的批量插入：
		 * 1、去除不可用数据
		 * ->优先识别员工  Employee maps.remove(keys)
		 *   -->再识别项目 Project
		 *     --->识别是否参与项目 
		 *       --->到2
		 * 2、批量插入
		 *  ->Map-->转成List
		 *   --->批量添加
		 */
		Set<Entry<String,List<PRProjectDataInfo>>> entrySet = maps.entrySet();
		for(Entry<String,List<PRProjectDataInfo>> entry: entrySet){
			String employeeName = entry.getKey();
			List<Employee> employeeItems = employeeDao.getByName(employeeName);
			if(employeeItems.size()>0){
				List<PRProjectDataInfo> prpDatas = entry.getValue();
				for(int i=0;i<prpDatas.size();i++){
					PRProjectDataInfo prpdi = prpDatas.get(i);
					String projectName = prpdi.getProject();
					Project projectItem = projectDao.getByName(projectName);
					if(projectItem!=null){
						for(Employee emp: employeeItems){
							int amount = employeeProjectDao.getCountByProjectAndEmployee(projectItem.getProjectId(), emp.getId());
							if(amount<0){continue;}
							else{
								for(PRDataInfo prData : prpdi.getDatas()){
									Projectreview pr = new Projectreview();
									pr.setEmployee(emp);
									pr.setProject(projectItem);
									pr.setPrdate(modifyDate);
									try {
										initOtherProperties(pr, prData, phaseMaps);
									} catch (Exception e) {
										e.printStackTrace();
									}
									
									prLists.add(pr);
								}
							}
						}
					}else{ continue;}
				}
			}else continue;
		}
		
		return saveBatch(prLists);
	}
	
	private void initOtherProperties(Projectreview pr, PRDataInfo prData, Map<String,Phase> phaseMaps) throws Exception{
		Field[] fieldNames = prData.getClass().getDeclaredFields();
		for(int i=0;i<fieldNames.length;i++){
			String fieldName = fieldNames[i].getName();
			if(fieldName.equals("phase")){
				Object value = ReflectUtil.invokeGetter(prData, fieldName);
				String val = value.toString();
				if(val.indexOf("阶段")==-1){
					val+="阶段";
				}
				ReflectUtil.invokeSetter(pr, fieldName, phaseMaps.get(val));
				continue;
			}
			ReflectUtil.invokeSetter(pr, fieldName, ReflectUtil.invokeGetter(prData, fieldName));
		}
	}

	private Map<String, Phase>  initPhase(PhaseDao phaseDao){
		List<Phase> phaseLists = phaseDao.findAll(Phase.class);
		 Map<String, Phase> maps = new HashMap<String, Phase>();
		for(int i=0;i<phaseLists.size();i++){
			Phase temp = phaseLists.get(i);
			maps.put(temp.getPhaseName(), temp);
		}
		return maps;
	}

	@Override
	public int getCountNotZero(String employeeId, Date startDate, Date endDate,
			String colName) {
		
		return projectReviewDao.getCountNotZero(employeeId, startDate, endDate, colName);
	}

	@Override
	public Long getSumByCol(String employeeId, Date startDate, Date endDate,
			String colName) {
		return projectReviewDao.getSumByCol(employeeId, startDate, endDate, colName);
	}

	@Override
	public Projectreview getByPRId(Integer projectReviewId) {
		return projectReviewDao.get(Projectreview.class, projectReviewId);
	}
	
	@Override
	public Project getProjectById(Integer projectReviewId) {
		return projectReviewDao.getProjectById( projectReviewId);
	}

	@Override
	public JSONObject update(int projectReviewId, int phaseId, Project project, String employeeId,
			int designReg,String designExplain,
			int flowsheetReg,String flowExplain, int workplan,String workplanExplain, int communication, String communicationExplain,int workEnt,String workEntExplain, String prexplain, Date prdate) {
		Projectreview pr = projectReviewDao.get(Projectreview.class, projectReviewId);
		Phase phase = phaseDao.get(Phase.class, phaseId);
		JSONObject obj = new JSONObject();
		if(phase==null){
			obj.put("result", "fail");
			obj.put("msg", "阶段不能为空");
			obj.put("itemName", "phaseId");
			return obj;
		}
		Employee emp = employeeDao.get(Employee.class, employeeId);
		if(emp==null){ 
			obj.put("result", "fail");
			obj.put("msg", "责任人不能为空");
			obj.put("itemName", "employeeId");
			return obj;
			}
		if(project == null){
			obj.put("result", "fail");
			obj.put("msg", "所属项目不能为空");
			obj.put("itemName", "projectId");
			return obj;
		}
		pr.setPhase(phase);
		pr.setProject(project);
		pr.setEmployee(emp);
		pr.setDesignReg(designReg);
		pr.setFlowsheetReg(flowsheetReg);
		pr.setWorkplan(workplan);
		pr.setCommunication(communication);
		pr.setWorkEnt(workEnt);
		pr.setPrexplain(prexplain);
		if(prdate!=null){
			pr.setPrdate(prdate);
		}
		
		if (designExplain!=null&&!designExplain.equals("")) {
			pr.setDesignExplain(designExplain);
		}
		if (flowExplain!=null&&!flowExplain.equals("")) {
			pr.setFlowExplain(flowExplain);
		}
		if (workplanExplain!=null&&!workplanExplain.equals("")) {
			pr.setWorkPlanExplain(workplanExplain);
		}
		if (communicationExplain!=null&&!communicationExplain.equals("")) {
			pr.setCommunicationExplain(communicationExplain);
		}
		if (workEntExplain!=null&&!workEntExplain.equals("")) {
			pr.setWorkEntExplain(workEntExplain);
		}
		
		projectReviewDao.update(pr);
		obj.put("result", "success");
		obj.put("msg", "更新成功");
		return obj;
	}

	@Override
	public JSONObject save(int phaseId, Project project, String employeeId,
			int designReg,String designExplain, int flowsheetReg, String flowExplain,int workplan,String workplanExplain, int communication,String communicationExplain,
			int workEnt,String workEntExplain, String prexplain, Date date) {
		Phase phase = phaseDao.get(Phase.class, phaseId);
		JSONObject obj = new JSONObject();
		if(phase==null){
			obj.put("result", "fail");
			obj.put("msg", "阶段不能为空");
			obj.put("itemName", "phaseId");
			return obj;
		}
		Employee emp = employeeDao.get(Employee.class, employeeId);
		if(emp==null){
			obj.put("result", "fail");
			obj.put("msg", "责任人不能为空");
			obj.put("itemName", "employeeId");
			return obj;
			}
		if(project == null){
			obj.put("result", "fail");
			obj.put("msg", "所属项目不能为空");
			obj.put("itemName", "projectId");
			return obj;
		}
		//Projectreview pr = new Projectreview(phase, project, emp, designReg, flowsheetReg, workplan, communication, workEnt, prexplain, date);
		Projectreview pr = new Projectreview();
		
		pr.setPhase(phase);
		pr.setProject(project);
		pr.setEmployee(emp);
		pr.setDesignReg(designReg);
		pr.setFlowsheetReg(flowsheetReg);
		pr.setWorkplan(workplan);
		pr.setCommunication(communication);
		pr.setWorkEnt(workEnt);
		pr.setPrexplain(prexplain);
		if(date!=null){
			pr.setPrdate(date);
		}
		
		if (designExplain!=null&&!designExplain.equals("")) {
			pr.setDesignExplain(designExplain);
		}
		if (flowExplain!=null&&!flowExplain.equals("")) {
			pr.setFlowExplain(flowExplain);
		}
		if (workplanExplain!=null&&!workplanExplain.equals("")) {
			pr.setWorkPlanExplain(workplanExplain);
		}
		if (communicationExplain!=null&&!communicationExplain.equals("")) {
			pr.setCommunicationExplain(communicationExplain);
		}
		if (workEntExplain!=null&&!workEntExplain.equals("")) {
			pr.setWorkEntExplain(workEntExplain);
		}
		
		projectReviewDao.save(pr);
		obj.put("result", "success");
		obj.put("msg", "添加成功");
		return obj;
	}

	@Override
	public void delete(int projectreviewId) {
		projectReviewDao.delete(Projectreview.class, projectreviewId);
	}
	
	@Override
	public List<Projectreview> getProjectreviewsByProjectIdForPageForUser(
			int pageNo, int pageSize, String projectId, int phaseId,
			String employeeId) {
		return projectReviewDao.getProjectreviewsByProjectIdForPageForUser(pageNo, pageSize, projectId, phaseId, employeeId);
	}

	@Override
	public int getAmountByProjectIdForPageForUser(String projectId,
			int phaseId, String employeeId) {
		return projectReviewDao.getAmountByProjectIdForPageForUser(projectId, phaseId, employeeId);
	}

	@Override
	public int getCountByEmployeeIdAndDate(String employee, Date startDate,
			Date endDate) {
		// TODO Auto-generated method stub
		return projectReviewDao.getCountByDateAndEmployee(employee, startDate, endDate);
	}

	@Override
	public int getProjectCountByDateAndEmployee(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return projectReviewDao.getProjectCountByDateAndEmployee(employeeId, startDate, endDate);
	}
}
