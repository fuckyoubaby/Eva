package com.changhong.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Comprehensive;
import com.changhong.entities.Employee;
import com.changhong.entities.Exam;
import com.changhong.entities.Mode;
import com.changhong.entities.Modecomprehensive;
import com.changhong.entities.Modeproblemmoder;
import com.changhong.entities.Problemmode;
import com.changhong.entities.Problemtype;
import com.changhong.entities.Secondweight;
import com.changhong.service.ComprehensiveService;
import com.changhong.service.ModeComprehensiveService;
import com.changhong.service.ModeProblemModeRService;
import com.changhong.service.ModeService;
import com.changhong.service.ProblemModeService;
import com.changhong.service.ProblemTypeService;
import com.changhong.service.SecondWeightService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("modeAction")
@Results({
	@Result(name="modesPage",location="/adminEnter/score/modeTemplate.jsp"),
	@Result(name="save",location="/success.jsp"),
	//@Result(name="save",location="/adminEnter/score/problem_mode_list.jsp"),
	@Result(name="problemmodes",location="/adminEnter/score/problemmodeTemplate.jsp"),
	@Result(name="saveProblemModeR",location="/adminEnter/score/comprehensive_list.jsp"),
	@Result(name="comprehensives",location="/adminEnter/score/comprehensiveTemplate.jsp"),
	@Result(name="turnProblemMode",location="/adminEnter/score/problem_mode_list.jsp"),
	@Result(name="saveComprehensiveR",location="/success.jsp"),
	@Result(name="success",location="/success.jsp"),
	@Result(name="ProblemListForUpdate",location="/adminEnter/score/score_model_update.jsp"),
	@Result(name="comprehensivesForUpdate",location="/adminEnter/score/comprehensive_list_update.jsp"),
	@Result(name="modesPageForScore",location="/adminEnter/score/modeTemplateForScore.jsp"),
	@Result(name="deleteMode",location="/adminEnter/score/score_model_index.jsp"),
	@Result(name="mulDelete",location="/adminEnter/score/score_model_index.jsp"),
})
public class ModeAction {

	private static final Logger log = LoggerFactory.getLogger(ModeAction.class);
	@Autowired
	private ModeService modeService;
	@Autowired
	private ProblemTypeService problemTypeService;
	@Autowired
	private ProblemModeService problemModeService;
	@Autowired
	private ModeProblemModeRService modeProblemModeRService;
	@Autowired
	private ComprehensiveService comprehensiveService;
	@Autowired
	private ModeComprehensiveService modeComprehensiveService;
	
	@Autowired
	private SecondWeightService secondWeightService;
	
	private String message;
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	private List<Mode> modes;
	private List<Problemtype> problemtypes;
	private List<Problemmode> problemmodes;
	private List<Comprehensive> comprehensives;
	private int comprehensiveId;
	
	private int modeId;
	private Mode mode;
	private List<Modeproblemmoder> modeproblemmoders;
	private List<Modecomprehensive> modecomprehensives;
	
	private String chkName;
	
	private String modelName;//模型名称
	private int problemModeId;
	
	//一般设计缺陷
	private int designFalutsA;
	private int designFalutsB;
	private int designFalutsC;
	private double designFalutsWeight;
	
	//低级错误
	private int sillyMiskakeA;
	private int sillyMiskakeB;
	private int sillyMiskakeC;
	private double sillyMiskakeWeight;
	
	//设计规定
	private int designA;
	private int designB;
	private int designC;
	private double designWeight;
	
	//学习积极性  参与的培训
	private int studyA;
	private int studyB;
	private int studyC;
	private double studyWeight;
	
	
	//专利加分
	private int patentA;
	private int patentB;
	private int patentC;
	private double patentWeight;
	
	
	//培训主讲人/组织者
	private int teacherA;
	private int teacherB;
	private int teacherC;
	private double teacherWeight;
	
	//经验分享
	private int experienceScore;
	private double experienceWeight;
	
	//其他权重分配
	
	private double standardWeight;
	private double otherWeight;
	private double projectWeight;
	private double importentWeight;
	
	//沟通管理
	
	private double workExWeight;//工作积极性权重
	private double comprehensiveWeitht;//沟通能力权重
	private double workPlanWeight;//工作计划性权重
	
	
	private String arr;
	
	private List<Secondweight> secondweights;
	
	
	public List<Secondweight> getSecondweights() {
		return secondweights;
	}
	public void setSecondweights(List<Secondweight> secondweights) {
		this.secondweights = secondweights;
	}
	public ModeService getModeService() {
		return modeService;
	}
	public void setModeService(ModeService modeService) {
		this.modeService = modeService;
	}
	
	public double getSillyMiskakeWeight() {
		return sillyMiskakeWeight;
	}
	public void setSillyMiskakeWeight(double sillyMiskakeWeight) {
		this.sillyMiskakeWeight = sillyMiskakeWeight;
	}
	public int getDesignA() {
		return designA;
	}
	public void setDesignA(int designA) {
		this.designA = designA;
	}
	public int getDesignB() {
		return designB;
	}
	public void setDesignB(int designB) {
		this.designB = designB;
	}
	public int getDesignC() {
		return designC;
	}
	public void setDesignC(int designC) {
		this.designC = designC;
	}
	public double getDesignWeight() {
		return designWeight;
	}
	public void setDesignWeight(double designWeight) {
		this.designWeight = designWeight;
	}
	public int getStudyA() {
		return studyA;
	}
	public void setStudyA(int studyA) {
		this.studyA = studyA;
	}
	public int getStudyB() {
		return studyB;
	}
	public void setStudyB(int studyB) {
		this.studyB = studyB;
	}
	public int getStudyC() {
		return studyC;
	}
	public void setStudyC(int studyC) {
		this.studyC = studyC;
	}
	public double getStudyWeight() {
		return studyWeight;
	}
	public void setStudyWeight(double studyWeight) {
		this.studyWeight = studyWeight;
	}
	public int getPatentA() {
		return patentA;
	}
	public void setPatentA(int patentA) {
		this.patentA = patentA;
	}
	public int getPatentB() {
		return patentB;
	}
	public void setPatentB(int patentB) {
		this.patentB = patentB;
	}
	public int getPatentC() {
		return patentC;
	}
	public void setPatentC(int patentC) {
		this.patentC = patentC;
	}
	public double getPatentWeight() {
		return patentWeight;
	}
	public void setPatentWeight(double patentWeight) {
		this.patentWeight = patentWeight;
	}
	public int getTeacherA() {
		return teacherA;
	}
	public void setTeacherA(int teacherA) {
		this.teacherA = teacherA;
	}
	public int getTeacherB() {
		return teacherB;
	}
	public void setTeacherB(int teacherB) {
		this.teacherB = teacherB;
	}
	public int getTeacherC() {
		return teacherC;
	}
	public void setTeacherC(int teacherC) {
		this.teacherC = teacherC;
	}
	public double getTeacherWeight() {
		return teacherWeight;
	}
	public void setTeacherWeight(double teacherWeight) {
		this.teacherWeight = teacherWeight;
	}
	public int getExperienceScore() {
		return experienceScore;
	}
	public void setExperienceScore(int experienceScore) {
		this.experienceScore = experienceScore;
	}
	public double getExperienceWeight() {
		return experienceWeight;
	}
	public void setExperienceWeight(double experienceWeight) {
		this.experienceWeight = experienceWeight;
	}
	public double getStandardWeight() {
		return standardWeight;
	}
	public void setStandardWeight(double standardWeight) {
		this.standardWeight = standardWeight;
	}
	public double getOtherWeight() {
		return otherWeight;
	}
	public void setOtherWeight(double otherWeight) {
		this.otherWeight = otherWeight;
	}
	public double getProjectWeight() {
		return projectWeight;
	}
	public void setProjectWeight(double projectWeight) {
		this.projectWeight = projectWeight;
	}
	public double getImportentWeight() {
		return importentWeight;
	}
	public void setImportentWeight(double importentWeight) {
		this.importentWeight = importentWeight;
	}
	public double getWorkExWeight() {
		return workExWeight;
	}
	public void setWorkExWeight(double workExWeight) {
		this.workExWeight = workExWeight;
	}
	public double getComprehensiveWeitht() {
		return comprehensiveWeitht;
	}
	public void setComprehensiveWeitht(double comprehensiveWeitht) {
		this.comprehensiveWeitht = comprehensiveWeitht;
	}
	public double getWorkPlanWeight() {
		return workPlanWeight;
	}
	public void setWorkPlanWeight(double workPlanWeight) {
		this.workPlanWeight = workPlanWeight;
	}
	public String getOrderName() {
		return orderName;
	}
	public void setOrderName(String orderName) {
		this.orderName = orderName;
	}
	public String getOrderType() {
		return orderType;
	}
	public void setOrderType(String orderType) {
		this.orderType = orderType;
	}
	public String getChkName() {
		return chkName;
	}
	public void setChkName(String chkName) {
		this.chkName = chkName;
	}
	public Mode getMode() {
		return mode;
	}
	public void setMode(Mode mode) {
		this.mode = mode;
	}
	public int getModeId() {
		return modeId;
	}
	public void setModeId(int modeId) {
		this.modeId = modeId;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getItemcount() {
		return itemcount;
	}
	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}
	
	public List<Mode> getModes() {
		return modes;
	}
	public void setModes(List<Mode> modes) {
		this.modes = modes;
	}
	
	public String getModelName() {
		return modelName;
	}
	public void setModelName(String modelName) {
		this.modelName = modelName;
	}
	
	public int getDesignFalutsA() {
		return designFalutsA;
	}
	public void setDesignFalutsA(int designFalutsA) {
		this.designFalutsA = designFalutsA;
	}
	public int getDesignFalutsB() {
		return designFalutsB;
	}
	public void setDesignFalutsB(int designFalutsB) {
		this.designFalutsB = designFalutsB;
	}
	public int getDesignFalutsC() {
		return designFalutsC;
	}
	public void setDesignFalutsC(int designFalutsC) {
		this.designFalutsC = designFalutsC;
	}
	public double getDesignFalutsWeight() {
		return designFalutsWeight;
	}
	public void setDesignFalutsWeight(double designFalutsWeight) {
		this.designFalutsWeight = designFalutsWeight;
	}
	public int getSillyMiskakeA() {
		return sillyMiskakeA;
	}
	public void setSillyMiskakeA(int sillyMiskakeA) {
		this.sillyMiskakeA = sillyMiskakeA;
	}
	public int getSillyMiskakeB() {
		return sillyMiskakeB;
	}
	public void setSillyMiskakeB(int sillyMiskakeB) {
		this.sillyMiskakeB = sillyMiskakeB;
	}
	public int getSillyMiskakeC() {
		return sillyMiskakeC;
	}
	public void setSillyMiskakeC(int sillyMiskakeC) {
		this.sillyMiskakeC = sillyMiskakeC;
	}
	
	public List<Problemtype> getProblemtypes() {
		return problemtypes;
	}
	public void setProblemtypes(List<Problemtype> problemtypes) {
		this.problemtypes = problemtypes;
	}
	public List<Problemmode> getProblemmodes() {
		return problemmodes;
	}
	public void setProblemmodes(List<Problemmode> problemmodes) {
		this.problemmodes = problemmodes;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public int getProblemModeId() {
		return problemModeId;
	}
	public void setProblemModeId(int problemModeId) {
		this.problemModeId = problemModeId;
	}
	public String getArr() {
		return arr;
	}
	public void setArr(String arr) {
		this.arr = arr;
	}
	public List<Comprehensive> getComprehensives() {
		return comprehensives;
	}
	public void setComprehensives(List<Comprehensive> comprehensives) {
		this.comprehensives = comprehensives;
	}
	public int getComprehensiveId() {
		return comprehensiveId;
	}
	public void setComprehensiveId(int comprehensiveId) {
		this.comprehensiveId = comprehensiveId;
	}
	public List<Modeproblemmoder> getModeproblemmoders() {
		return modeproblemmoders;
	}
	public void setModeproblemmoders(List<Modeproblemmoder> modeproblemmoders) {
		this.modeproblemmoders = modeproblemmoders;
	}
	public List<Modecomprehensive> getModecomprehensives() {
		return modecomprehensives;
	}
	public void setModecomprehensives(List<Modecomprehensive> modecomprehensives) {
		this.modecomprehensives = modecomprehensives;
	}
	public String getModesByPage()
	{
		/*modes = modeService.getModesByPage(pageNo, pageSize, keyword);
		itemcount = modeService.getCount(keyword);*/
		
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		modes = modeService.getModesByPage(params);
		itemcount = modeService.getCount(params);
		return "modesPage";
	}
	public String getModesByPageForScore()
	{
		/*modes = modeService.getModesByPage(pageNo, pageSize, keyword);
		itemcount = modeService.getCount(keyword);*/
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		modes = modeService.getModesByPage(params);
		itemcount = modeService.getCount(params);
		return "modesPageForScore";
	}
	public String save()
	{
		ActionContext context = ActionContext.getContext();
		Mode mode = new Mode();
		Employee employee = (Employee) context.getSession().get("employee");
		Date date = new Date();
		mode.setModeName(modelName);
		mode.setEmployee(employee);
		mode.setCreateTime(date);
		//modeService.save(mode);
		if (modelName!=null&&!modelName.equals("")) {
			Mode mode2 = modeService.saveAndGet(mode);
			context.getSession().put("mode", mode2);
		}
		return "save";
	}
	/*public String problemmodeSave()
	{
		Problemmode problemmode = new Problemmode();
		return "problemScoreSave";
	}*/
	public String getProblemMode()
	{
		problemmodes = problemModeService.getProblemmodes(pageNo, pageSize, keyword);
		return "problemmodes";
	}
	public String saveProblemModeR()
	{
		log.info("problemmodeid = "+problemModeId);
		//message="添加成功";
		
		ActionContext context = ActionContext.getContext();
		Mode mode = null;
		if (modeId==0) {
			mode = (Mode) context.getSession().get("mode");
		}else {
			mode = modeService.getModeById(modeId);
		}
		
		log.info("arr = "+arr);
		if (arr!=null&&!arr.equals("")) {
			String[] strA=arr.split(",");
			log.info("strA size  = "+strA.length);
			for (int i = 0; i < strA.length; i++) {
				log.info("stra[i]="+strA[i]+"---");
				
				if (!strA[i].equals("")) {
					Problemmode problemmode = problemModeService.getProblemmodeById(Integer.parseInt(strA[i]));
					//log.info("problemmode = "+problemmode.getProblemtype().getTypeName()+"mode = "+mode.getModeName());
					Modeproblemmoder modeproblemmoder = new Modeproblemmoder();
					modeproblemmoder.setMode(mode);
					modeproblemmoder.setProblemmode(problemmode);
					//测试结束后去掉后面的注释
					modeProblemModeRService.save(modeproblemmoder);
				}
				
			}
		}
		
		return "saveProblemModeR";
	}
	public String turnProblemMode()
	{
		Problemmode problemmode = problemModeService.getProblemmodeById(problemModeId);
		JSONObject object= new JSONObject();
		object.put("index", problemModeId);
		object.put("name", problemmode.getProblemtype().getTypeName());
		object.put("A", problemmode.getA());
		object.put("B", problemmode.getB());
		object.put("C", problemmode.getC());
		message = object.toString();
		
		 HttpServletResponse response = ServletActionContext.getResponse();
		 response.setContentType("application/json");  
         response.setCharacterEncoding("UTF-8");
         PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("message = "+message);
         out.print(message);
         out.flush();
         out.close();
		return "turnProblemMode";
	}
	public String getComprehensive()
	{
		comprehensives = comprehensiveService.getComprehensivesByPage(pageNo, pageSize, keyword);
		itemcount = comprehensiveService.getCount(keyword);
		return "comprehensives";
	}
	public String turnComprehensive()
	{
		Comprehensive comprehensive = comprehensiveService.getComprehensive(comprehensiveId);
		
		JSONObject object= new JSONObject();
		object.put("index", comprehensiveId);
		object.put("name", comprehensive.getName());
		object.put("lowPoint", comprehensive.getLowPoint());
		object.put("oneStep", comprehensive.getOneStep());
		message = object.toString();
		
		 HttpServletResponse response = ServletActionContext.getResponse();
		 response.setContentType("application/json");  
         response.setCharacterEncoding("UTF-8");
         PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info("message = "+message);
         out.print(message);
         out.flush();
         out.close();
         
		return "turnComprehensive";
	}
	public String saveComprehensiveR()
	{
		ActionContext context = ActionContext.getContext();
		Mode mode = null;
		if (modeId==0) {
			mode = (Mode) context.getSession().get("mode");
		}else {
			mode = modeService.getModeById(modeId);
		}
		if (arr!=null&&!arr.equals("")) {
			String[] strA=arr.split(",");
			for (int i = 0; i < strA.length; i++) {
				if (!strA[i].equals("")) {
				Comprehensive comprehensive = comprehensiveService.getComprehensive(Integer.parseInt(strA[i].trim()));
				Modecomprehensive modeComprehensive = new Modecomprehensive();
				modeComprehensive.setMode(mode);
				modeComprehensive.setComprehensive(comprehensive);
				//测试结束后去掉后面的注释
				modeComprehensiveService.save(modeComprehensive);
				}
			}
		}
		message="模型创建成功";
		return "saveComprehensiveR";
	}
	
	public String getProblemListForUpdate()
	{
		ActionContext context = ActionContext.getContext();
		mode=modeService.getModeById(modeId);
		secondweights = secondWeightService.getSecondweightsByModeId(modeId);
		context.getSession().put("modeupdate", mode);
		return "ProblemListForUpdate";
	}
	public String getComprehensiveForUpdate()
	{
		mode=modeService.getModeById(modeId);
		log.info("arr = "+arr);
		if (arr!=null&&!arr.equals("")) {
			String[] strA=arr.split(",");
			for (int i = 0; i < strA.length; i++) {
				if (!strA[i].equals("")) {
				Problemmode problemmode = problemModeService.getProblemmodeById(Integer.parseInt(strA[i]));
				//log.info("problemmode = "+problemmode.getProblemtype().getTypeName()+"mode = "+mode.getModeName());
				Modeproblemmoder modeproblemmoder = new Modeproblemmoder();
				modeproblemmoder.setMode(mode);
				modeproblemmoder.setProblemmode(problemmode);
				//测试结束后去掉后面的注释
				modeProblemModeRService.save(modeproblemmoder);
				}
			}
		}
		
		mode=modeService.getModeById(modeId);
		modecomprehensives = modeComprehensiveService.getModecomprehensivesByModeId(modeId);
		return "comprehensivesForUpdate";
	}
	
	public String deleteModeProblemMode()
	{
		modeProblemModeRService.delete(modeId, problemModeId);
		return "success";
	}
	public String deleteModeComprehensive()
	{
		modeComprehensiveService.delete(modeId, comprehensiveId);
		return "success";
	}
	public String deleteMode()
	{
		try {
			Mode mode = modeService.getModeById(modeId);
			modeService.delete(mode);
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "deleteMode";
	}
	public String mulDelete()
	{
		try {
			String[] strA = chkName.split(",");
			for (int i = 0; i < strA.length; i++) {
				String idStr = strA[i].trim();
				if (idStr.matches("\\d+")) {
					int id = Integer.parseInt(idStr);
					Mode mode = modeService.getModeById(id);
					modeService.delete(mode);
				} else
					continue;
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return "deleteMode";
	}
	
	public String saveMode()
	{
		Mode mode = new Mode();
		ActionContext context = ActionContext.getContext();
		
		Employee employee = (Employee) context.getSession().get("loginer");
		Date date = new Date();
		mode.setModeName(modelName);
		mode.setEmployee(employee);
		mode.setCreateTime(date);
		
		mode = modeService.saveAndGet(mode);
		
		//把一般设计缺陷添加到表中
		log.info("designFalutsA="+designFalutsA+"-designFalutsB="+designFalutsB+"-designFalutsC="+designFalutsC+"-designFalutsW="+designFalutsWeight);
		Secondweight secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
		secondweight.setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString());
		secondweight.setA(designFalutsA);
		secondweight.setB(designFalutsB);
		secondweight.setC(designFalutsC);
		secondweight.setWeightly(designFalutsWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//低级错误扣分及权重
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
		secondweight.setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString());
		secondweight.setA(sillyMiskakeA);
		secondweight.setB(sillyMiskakeB);
		secondweight.setC(sillyMiskakeC);
		secondweight.setWeightly(sillyMiskakeWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//设计合规
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.COMPLIANCE);
		secondweight.setSecondLevel(FinalConstant.COMPLIANCE_enum.设计规定.toString());
		secondweight.setA(designA);
		secondweight.setB(designB);
		secondweight.setC(designC);
		secondweight.setWeightly(designWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//参与培训
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.SELF_GROWTH);
		secondweight.setSecondLevel(FinalConstant.SELF_GROWTH_enum.学习积极性.toString());
		secondweight.setA(studyA);
		secondweight.setB(studyB);
		secondweight.setC(studyC);
		secondweight.setWeightly(studyWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//专利
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString());
		secondweight.setA(patentA);
		secondweight.setB(patentB);
		secondweight.setC(patentC);
		secondweight.setWeightly(patentWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//培训主讲人/组织者
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString());
		secondweight.setA(teacherA);
		secondweight.setB(teacherB);
		secondweight.setC(teacherC);
		secondweight.setWeightly(teacherWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//经验分享
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString());
		secondweight.setA(experienceScore);//每颗星的得分
		secondweight.setWeightly(teacherWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//标准化
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString());
		
		secondweight.setWeightly(standardWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//其他加分
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString());
				
		secondweight.setWeightly(otherWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//项目文档
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString());
						
		secondweight.setWeightly(projectWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//重要信息收集
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
		secondweight.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString());
						
		secondweight.setWeightly(importentWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		
		//工作积极性权重
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
		secondweight.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString());
						
		secondweight.setWeightly(workExWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//沟通能力
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
		secondweight.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString());
						
		secondweight.setWeightly(comprehensiveWeitht/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		//工作计划性
		secondweight = new Secondweight();
		secondweight.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
		secondweight.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString());
						
		secondweight.setWeightly(workPlanWeight/100.0d);
		secondweight.setMode(mode);
		secondWeightService.save(secondweight);
		
		message="模型创建成功";
		
		return "save";
	}
	
	public String updateMode()
	{
		ActionContext context = ActionContext.getContext();
		Mode mode = (Mode) context.getSession().get("modeupdate");
		secondweights = secondWeightService.getSecondweightsByModeId(mode.getModeId());
		if (modelName!=null) {
			mode.setModeName(modelName);
			modeService.update(mode);
		}
		log.info("哈哈哈哈哈哈哈哈啊哈哈哈哈哈哈哈哈哈哈哈哈哈");
		for (int i = 0; i < secondweights.size(); i++) {
			log.info("secondweights size = "+secondweights.size());
			if (secondweights.get(i).getSecondLevel().equals(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString())) {
				
				secondweights.get(i).setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
				secondweights.get(i).setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString());
				secondweights.get(i).setA(designFalutsA);
				secondweights.get(i).setB(designFalutsB);
				secondweights.get(i).setC(designFalutsC);
				secondweights.get(i).setWeightly(designFalutsWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString())) {
				
				//低级错误扣分及权重
				secondweights.get(i).setA(sillyMiskakeA);
				secondweights.get(i).setB(sillyMiskakeB);
				secondweights.get(i).setC(sillyMiskakeC);
				secondweights.get(i).setWeightly(sillyMiskakeWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.COMPLIANCE_enum.设计规定.toString())) {
				
				//设计合规
				secondweights.get(i).setA(designA);
				secondweights.get(i).setB(designB);
				secondweights.get(i).setC(designC);
				secondweights.get(i).setWeightly(designWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.SELF_GROWTH_enum.学习积极性.toString())) {
				
				//参与培训
				secondweights.get(i).setA(studyA);
				secondweights.get(i).setB(studyB);
				secondweights.get(i).setC(studyC);
				secondweights.get(i).setWeightly(studyWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString())) {
				
				//专利
				secondweights.get(i).setA(patentA);
				secondweights.get(i).setB(patentB);
				secondweights.get(i).setC(patentC);
				secondweights.get(i).setWeightly(patentWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString())) {
				
				//培训主讲人/组织者
				secondweights.get(i).setA(teacherA);
				secondweights.get(i).setB(teacherB);
				secondweights.get(i).setC(teacherC);
				secondweights.get(i).setWeightly(teacherWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString())) {
				
				//经验分享
				
				secondweights.get(i).setA(experienceScore);//每颗星的得分
				secondweights.get(i).setWeightly(teacherWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString())) {
				
				//标准化
				secondweights.get(i).setWeightly(standardWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString())) {
				
				//其他加分
				secondweights.get(i).setWeightly(otherWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString())) {
				
				//项目文档
				secondweights.get(i).setWeightly(projectWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString())) {
				//重要信息收集			
				secondweights.get(i).setWeightly(importentWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString())) {
				//工作积极性权重
				secondweights.get(i).setWeightly(workExWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString())) {
				//沟通能力
				secondweights.get(i).setWeightly(comprehensiveWeitht/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}else if (secondweights.get(i).getSecondLevel().equals(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString())) {
				//工作计划性
				secondweights.get(i).setWeightly(workPlanWeight/100.0d);
				secondweights.get(i).setMode(mode);
				secondWeightService.update(secondweights.get(i));
			}
			
			
		}	
				message="模型更新成功";
		return "save";
	}
}
