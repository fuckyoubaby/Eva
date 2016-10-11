package com.changhong.action;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Assist;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Experience;
import com.changhong.entities.Mode;
import com.changhong.entities.Modecomprehensive;
import com.changhong.entities.Modeproblemmoder;
import com.changhong.entities.Overallscore;
import com.changhong.entities.Patent;
import com.changhong.entities.Problem;
import com.changhong.entities.Projectreview;
import com.changhong.entities.Secondlevelscore;
import com.changhong.entities.Secondweight;
import com.changhong.entities.Train;
import com.changhong.entities.Trainorg;
import com.changhong.service.AssistService;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.EmployeeService;
import com.changhong.service.ExperienceService;
import com.changhong.service.ModeComprehensiveService;
import com.changhong.service.ModeProblemModeRService;
import com.changhong.service.ModeService;
import com.changhong.service.OverallService;
import com.changhong.service.PatentService;
import com.changhong.service.ProblemService;
import com.changhong.service.ProjectReviewService;
import com.changhong.service.ResultService;
import com.changhong.service.SecondLevelScoreService;
import com.changhong.service.SecondWeightService;
import com.changhong.service.TrainOrgService;
import com.changhong.service.TrainService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;

@Action("scoreAction")
@Results({
	@Result(name="success",location="/adminEnter/score/score_made_index.jsp"),
	@Result(name="overallScorePage",location="/adminEnter/score/overallScoreTemplate.jsp"),
	@Result(name="overallScorePageForEmployee",location="/userEnter/score/overallScoreTemplate.jsp"),
	@Result(name="saveModeId",location="/adminEnter/score/result_index.jsp"),
	@Result(name="resultModeId",location="/adminEnter/score/resultTemplate.jsp"),
	@Result(name="result",location="/adminEnter/score/score_main.jsp")
})
public class ScoreAction {

	private static final Logger log = LoggerFactory.getLogger(ScoreAction.class);
	
	
	@Autowired
	private OverallService overallService;
	@Autowired
	private ModeService modeService;
	@Autowired
	private EmployeeService employeeService;
	@Autowired
	private ModeProblemModeRService modeProblemModeRService;
	@Autowired
	private ModeComprehensiveService modeComprehensiveService;
	@Autowired
	private ProblemService problemService;
	@Autowired
	private ExperienceService experienceService;
	@Autowired
	private TrainService trainService;
	@Autowired
	private ResultService resultService;
	@Autowired
	private SecondWeightService secondWeightService;
	@Autowired
	private SecondLevelScoreService secondLevelScoreService;
	@Autowired
	private ProjectReviewService projectReviewService;
	@Autowired
	private PatentService patentService;
	@Autowired
	private EmployeeExamService employeeExamService;
	@Autowired
	private AssistService assistService;
	@Autowired
	private TrainOrgService trainOrgService;
	
	private Date start_time;
	private Date end_time;
	private int chooseItem;
	private String socreName;
	
	private Overallscore overallscore;
	
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	
	
	
	private List<Overallscore> overallscores;
	
	private int modeId;
	private List<com.changhong.entities.Result> results;
	
	
	
	
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
	public List<com.changhong.entities.Result> getResults() {
		return results;
	}
	public void setResults(List<com.changhong.entities.Result> results) {
		this.results = results;
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
	public Overallscore getOverallscore() {
		return overallscore;
	}
	public void setOverallscore(Overallscore overallscore) {
		this.overallscore = overallscore;
	}
	public String getSocreName() {
		return socreName;
	}
	public void setSocreName(String socreName) {
		this.socreName = socreName;
	}
	public Date getStart_time() {
		return start_time;
	}
	public void setStart_time(Date start_time) {
		this.start_time = start_time;
	}
	public Date getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Date end_time) {
		this.end_time = end_time;
	}
	public int getChooseItem() {
		return chooseItem;
	}
	public void setChooseItem(int chooseItem) {
		this.chooseItem = chooseItem;
	}

	public List<Overallscore> getOverallscores() {
		return overallscores;
	}
	public void setOverallscores(List<Overallscore> overallscores) {
		this.overallscores = overallscores;
	}
	public String getResult()
	{
		log.info("starttime = "+start_time+"  endtime = "+end_time+"  modeid = "+chooseItem);
		return "success";
	}
	public String saveOverall()
	{
		Overallscore overallscore2 = new Overallscore();
		overallscore2.setStartTime(start_time);
		overallscore2.setEndTime(end_time);
		overallscore2.setName(socreName);
		Date date = new Date();
		overallscore2.setCreateTime(date);
		Mode mode = modeService.getModeById(chooseItem);
		overallscore2.setMode(mode);
		
		overallscore = overallService.saveAndGet(overallscore2);
		
		Thread thread = new Thread(){
			   public void run(){
				   calScore();
			   }
			
			};
			
			thread.start();

		
		
		return "success";
		
	}
	public String getAllOverallScore()
	{
		overallscores = overallService.getOverallscores(pageNo, pageSize);
		itemcount = overallService.getCount();
		//log.info("itemcount= "+itemcount+"overallscores="+overallscores.get(0).getName());
		return "overallScorePage";
	}
	public String getAllOverallScoreForEmployee()
	{
		overallscores = overallService.getOverallscores(pageNo, pageSize);
		itemcount = overallService.getCount();
		log.info("itemcount= "+itemcount+"overallscores="+overallscores.get(0).getName());
		return "overallScorePageForEmployee";
	}
	public String saveModeId()
	{
		ActionContext context = ActionContext.getContext();
		context.getSession().put("modeId", modeId);
		return "saveModeId";
	}
	public String getResultByModeId()
	{
		log.info("orderName = "+orderName+"  orderType="+orderType);
		int modeId = (Integer) ActionContext.getContext().getSession().get("modeId");
		/*results = resultService.getResultsByPageAndModeId(pageNo, pageSize, modeId);
		itemcount = resultService.getCountByModeId(modeId);*/
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		results = resultService.getResultsByPageAndModeId(params, modeId);
		itemcount = resultService.getCountByModeId(params,modeId);
		return "resultModeId";
	}
	
	
	private void calScore()
	{
		List<Employee> employees = employeeService.getAllEmployees();
		modeId = chooseItem;
		Mode mode = modeService.getModeById(modeId);
		//统计某个员工的各个维度的得分
		for(int i=0;i<employees.size();i++)
		{
			//一般设计缺陷 扣分总数和出现次数
			double yibansheji=0;
			int yibanshejiNum = 0;
			double yibanshejiWeight = 0;
			
			//低级错误 扣分总数和出现次数
			double dijicuowu = 0;
			int dijicuowuNum = 0;
			double dijicuowuWeight = 0;
			
			//设计规定扣分总数和出现次数
			double shejiguiding = 0;
			int shejiguidingNum = 0;
			double shejiguidingWeight = 0;
						
			//员工参与培训加分
			int xuexijijixing = 0;
			double xuexijijixingWeight = 0;
			
			//专利加分
			int zhuanli = 0;
			double zhuanliWeight = 0;
			
			//经验分享加分
			int jingyanfenxiang = 0;
			double jingyanfenxiangWeight = 0 ;
			
			//标准化加分
			int biaozhunhua = 0 ;
			double biaozhunhuaWeight = 0 ;
			
			//重要信息收集
			int zhongyaoxinxishouji = 0;
			double zhongyaoxinxishoujiWeight = 0;
			
			//项目文档
			int xiangmuwendang = 0;
			double xiangmuwendangWeight = 0;
			
			//其他
			int qita = 0;
			double qitaWeight = 0;
			
			//培训组织者
			double peixunzuzhizhe = 0;
			double peixunzuzhizheWeight = 0;
			 
			//根据员工的id找出在某段时间内该员工所犯的所有问题
			List<Problem> problems = new ArrayList<Problem>();
			problems = problemService.getProblemsByEmployeeId(employees.get(i).getId(), start_time, end_time);
			//对各个问题分别分析类别
			Secondweight secondweight_yibanshejiquexian = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString());
			Secondweight secondweight_dijicuowu = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString());
			Secondweight secondweight_shejiguiding = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMPLIANCE_enum.设计规定.toString());
			for (int j = 0; j < problems.size(); j++) {
				//一般设计缺陷
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString())) {
					
					if (secondweight_yibanshejiquexian==null) {
					}else {
						yibanshejiWeight = secondweight_yibanshejiquexian.getWeightly();
						if (problems.get(j).getProblemLevel().equals("A")) {
							yibansheji+=secondweight_yibanshejiquexian.getA();
							yibanshejiNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							yibansheji+=secondweight_yibanshejiquexian.getB();
							yibanshejiNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							yibansheji+=secondweight_yibanshejiquexian.getC();
							yibanshejiNum++;
						}
						
					}	
				}else
				
				//低级错误
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString())) {
					
					
					if (secondweight_dijicuowu==null) {
						
					}else {
						dijicuowuWeight = secondweight_dijicuowu.getWeightly();
						if (problems.get(j).getProblemLevel().equals("A")) {
							dijicuowu+=secondweight_dijicuowu.getA();
							dijicuowuNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							dijicuowu+=secondweight_dijicuowu.getA();
							dijicuowuNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							dijicuowu+=secondweight_dijicuowu.getA();
							dijicuowuNum++;
						}
						
					}	
				}else 
				
				//设计评审中的   设计规定扣分
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.COMPLIANCE_enum.设计规定.toString())) {
					
					
					if (secondweight_shejiguiding==null) {
						
					}else {
						shejiguidingWeight = secondweight_shejiguiding.getWeightly();
						if (problems.get(j).getProblemLevel().equals("A")) {
							shejiguiding+=secondweight_shejiguiding.getA();
							shejiguidingNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							shejiguiding+=secondweight_shejiguiding.getA();
							shejiguidingNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							shejiguiding+=secondweight_shejiguiding.getA();
							shejiguidingNum++;
						}
						
					}	
				}
				
			}//problems 循环
			
			
			//一般设计缺陷二级结果保存
			Secondlevelscore second_yibansheji = new Secondlevelscore();
			second_yibansheji.setEmployee(employees.get(i));
			second_yibansheji.setMode(mode);
			second_yibansheji.setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
			second_yibansheji.setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString());
			if (yibanshejiNum==0) {
				second_yibansheji.setScore(0.0);
			}else {
				second_yibansheji.setScore((double)yibansheji/yibanshejiNum);
			}
			second_yibansheji.setOverallscore(overallscore);
			log.info("secondscore "+second_yibansheji.getSecondLevel());
			secondLevelScoreService.save(second_yibansheji);
			log.info("secondscore "+second_yibansheji.getSecondLevel()+"保存成功");
			//低级错误二级结果保存
			Secondlevelscore second_dijicuowu = new Secondlevelscore();
			second_dijicuowu.setEmployee(employees.get(i));
			second_dijicuowu.setMode(mode);
			second_dijicuowu.setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
			second_dijicuowu.setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString());
			if (dijicuowuNum==0) {
				second_dijicuowu.setScore(0.0);
			}else {
				second_dijicuowu.setScore((double)dijicuowu/dijicuowuNum);
			}
			second_dijicuowu.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_dijicuowu);
			
			//设计合规二级结果保存
			int designRegNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time,"designReg");
			Long designRegSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time,"designReg");
			
			Secondlevelscore second_shejiguiding = new Secondlevelscore();
			second_shejiguiding.setEmployee(employees.get(i));
			second_shejiguiding.setMode(mode);
			second_shejiguiding.setOneLevel(FinalConstant.COMPLIANCE);
			second_shejiguiding.setSecondLevel(FinalConstant.COMPLIANCE_enum.设计规定.toString());
			double tem_sheji = 0.0;
			if (shejiguidingNum==0) {
				tem_sheji = 0.0;
			}else {
				tem_sheji = shejiguiding/shejiguidingNum;
			}
			
			double tem_des = 0.0;
			if (designRegNum==0) {
				tem_des = 0.0;
			}else {
				tem_des = designRegSum/designRegNum;
			}
			double score = tem_des+tem_sheji;
			second_shejiguiding.setScore(score);
			second_shejiguiding.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_shejiguiding);
			
			
			//流程合规二级结果保存
			int flowsheetRegNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time, "flowsheetReg");
			Long flowsheetRegSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time, "flowsheetReg");
			
			Secondlevelscore second_liuchenghegui = new Secondlevelscore();
			second_liuchenghegui.setEmployee(employees.get(i));
			second_liuchenghegui.setMode(mode);
			second_liuchenghegui.setOneLevel(FinalConstant.COMPLIANCE);
			second_liuchenghegui.setSecondLevel(FinalConstant.COMPLIANCE_enum.流程规定.toString());
			if (flowsheetRegSum==0) {
				second_liuchenghegui.setScore(0.0);
			}else {
				second_liuchenghegui.setScore((double)flowsheetRegSum/flowsheetRegNum);
			}
			second_liuchenghegui.setOverallscore(overallscore);
			
			
			secondLevelScoreService.save(second_liuchenghegui);
			
			//工作积极性二级结果保存
			int workEntNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time, "workEnt");
			Long workEntSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time, "workEnt");
			
			Secondlevelscore second_gongzuojijixing = new Secondlevelscore();
			second_gongzuojijixing.setEmployee(employees.get(i));
			second_gongzuojijixing.setMode(mode);
			second_gongzuojijixing.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
			second_gongzuojijixing.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString());
			if (workEntNum==0) {
				second_gongzuojijixing.setScore(0.0);
			}else {
				second_gongzuojijixing.setScore((double)workEntSum/workEntNum);
			}
			second_gongzuojijixing.setOverallscore(overallscore);
			
			
			secondLevelScoreService.save(second_gongzuojijixing);
			
			//沟通能力 二级结果保存
			int communicationNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time, "communication");
			Long communicationSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time, "communication");
			
			Secondlevelscore second_goutongnengli = new Secondlevelscore();
			second_goutongnengli.setEmployee(employees.get(i));
			second_goutongnengli.setMode(mode);
			second_goutongnengli.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
			second_goutongnengli.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString());
			if (communicationNum==0) {
				second_goutongnengli.setScore(0.0);
			}else {
				second_goutongnengli.setScore((double)communicationSum/communicationNum);
			}
			second_goutongnengli.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_goutongnengli);
			
			//工作计划性二级结果保存
			int workplanNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time, "workplan");
			Long workplanSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time, "workplan");
			
			Secondlevelscore second_gongzuojihuaxing = new Secondlevelscore();
			second_gongzuojihuaxing.setEmployee(employees.get(i));
			second_gongzuojihuaxing.setMode(mode);
			second_gongzuojihuaxing.setOneLevel(FinalConstant.COMMUNICATION_MANAGEMENT);
			second_gongzuojihuaxing.setSecondLevel(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString());
			if (workplanNum==0) {
				second_gongzuojihuaxing.setScore(0.0);
			}else {
				second_gongzuojihuaxing.setScore((double)workplanSum/workplanNum);
			}
			second_gongzuojihuaxing.setOverallscore(overallscore);
			
			
			secondLevelScoreService.save(second_gongzuojihuaxing);
			
			
			//自我成长
			//学习积极性 二级结果保存
			List<Employeetrainr> employeetrainrs=trainService.getEmployeetrainrsByEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);
			Secondweight secondweight_xuexijijixing = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.SELF_GROWTH_enum.学习积极性.toString());
			for (int j = 0; j < employeetrainrs.size(); j++) {
				
				if (secondweight_xuexijijixing==null) {
				}else {
					xuexijijixingWeight = secondweight_xuexijijixing.getWeightly();
					if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("A")) {
						xuexijijixing+=secondweight_xuexijijixing.getA();
					}else if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("B")) {
						xuexijijixing+=secondweight_xuexijijixing.getB();
					}else if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("C")) {
						xuexijijixing+=secondweight_xuexijijixing.getC();
					}
					
				}	
			}
			Secondlevelscore second_xuexijijixing = new Secondlevelscore();
			second_xuexijijixing.setEmployee(employees.get(i));
			second_xuexijijixing.setMode(mode);
			second_xuexijijixing.setOneLevel(FinalConstant.SELF_GROWTH);
			second_xuexijijixing.setSecondLevel(FinalConstant.SELF_GROWTH_enum.学习积极性.toString());
			second_xuexijijixing.setScore((double)xuexijijixing);
			second_xuexijijixing.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_xuexijijixing);
			
			
			//考试  二级结果保存
			double exam_score = employeeExamService.getAvgByEmployeeId(employees.get(i).getId(),start_time, end_time);
			Secondlevelscore second_kaoshi = new Secondlevelscore();
			second_kaoshi.setEmployee(employees.get(i));
			second_kaoshi.setMode(mode);
			second_kaoshi.setOneLevel(FinalConstant.SELF_GROWTH);
			second_kaoshi.setSecondLevel(FinalConstant.SELF_GROWTH_enum.考试.toString());
			second_kaoshi.setScore(exam_score);
			second_kaoshi.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_kaoshi);
			
			
			//专利 二级结果保存
			List<Patent> patents = patentService.getPatentsByEmployeeId(employees.get(i).getId(), start_time, end_time);
			Secondweight secondweight_zhuanli = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString());
			for (int j = 0; j < patents.size(); j++) {
				
				if (secondweight_zhuanli==null) {
				}else {
					zhuanliWeight = secondweight_zhuanli.getWeightly();
					if (patents.get(j).getPatentType().equals("发明专利")) {
						zhuanli+=secondweight_zhuanli.getA();
					}else if (patents.get(j).getPatentType().equals("实用新型")) {
						zhuanli+=secondweight_zhuanli.getB();
					}else if (patents.get(j).getPatentType().equals("外观设计")) {
						zhuanli+=secondweight_zhuanli.getC();
					}
					
				}	
			}
			Secondlevelscore second_zhuanli = new Secondlevelscore();
			second_zhuanli.setEmployee(employees.get(i));
			second_zhuanli.setMode(mode);
			second_zhuanli.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_zhuanli.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString());
			second_zhuanli.setScore((double)zhuanli);
			second_zhuanli.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_zhuanli);
			
			
			//经验库 二级结果保存
			List<Experience> experiences = experienceService.getExperiencesByEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);
			Secondweight secondweight_jingyanku = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString());
			for (int j = 0; j < experiences.size(); j++) {
				
				if (secondweight_jingyanku==null) {
				}else {
					jingyanfenxiangWeight = secondweight_jingyanku.getWeightly();
					if (experiences.get(j).getScore()==null) {
						jingyanfenxiang += 0;
					}else {
						jingyanfenxiang += secondweight_jingyanku.getA()*experiences.get(j).getScore();
					}
					
					
				}	
			}
			Secondlevelscore second_jingyanku = new Secondlevelscore();
			second_jingyanku.setEmployee(employees.get(i));
			second_jingyanku.setMode(mode);
			second_jingyanku.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_jingyanku.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString());
			second_jingyanku.setScore((double)jingyanfenxiang);
			second_jingyanku.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_jingyanku);
			
			//标准化、重要信息收集、项目文档和其他 二级分类加分
			List<Assist> assists = assistService.getAssistsByEmployeeId(employees.get(i).getId(), start_time, end_time);
			for (int j = 0; j < assists.size(); j++) {
				if (assists.get(j).getAssistName().indexOf("标准")!=-1) {
					biaozhunhua += assists.get(j).getScore();
				}else if (assists.get(j).getAssistName().indexOf("重要信息")!=-1) {
					zhongyaoxinxishouji += assists.get(j).getScore();
				}else if (assists.get(j).getAssistName().indexOf("项目文档")!=-1) {
					xiangmuwendang += assists.get(j).getScore();
				}else if (assists.get(j).getAssistName().indexOf("其他")!=-1) {
					qita += assists.get(j).getScore();
				}
			}
			// 标准化
			Secondlevelscore second_biaozhunhua = new Secondlevelscore();
			second_biaozhunhua.setEmployee(employees.get(i));
			second_biaozhunhua.setMode(mode);
			second_biaozhunhua.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_biaozhunhua.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString());
			second_biaozhunhua.setScore((double)biaozhunhua);
			second_biaozhunhua.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_biaozhunhua);
			
			//重要信息收集
			Secondlevelscore second_zhongyaoxinxishouji = new Secondlevelscore();
			second_zhongyaoxinxishouji.setEmployee(employees.get(i));
			second_zhongyaoxinxishouji.setMode(mode);
			second_zhongyaoxinxishouji.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_zhongyaoxinxishouji.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString());
			second_zhongyaoxinxishouji.setScore((double)zhongyaoxinxishouji);
			second_zhongyaoxinxishouji.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_zhongyaoxinxishouji);
			
			// 项目文档
			Secondlevelscore second_xiangmuwendang = new Secondlevelscore();
			second_xiangmuwendang.setEmployee(employees.get(i));
			second_xiangmuwendang.setMode(mode);
			second_xiangmuwendang.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_xiangmuwendang.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString());
			second_xiangmuwendang.setScore((double)xiangmuwendang);
			second_xiangmuwendang.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_xiangmuwendang);
			
			//其他
			Secondlevelscore second_qita = new Secondlevelscore();
			second_qita.setEmployee(employees.get(i));
			second_qita.setMode(mode);
			second_qita.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_qita.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString());
			second_qita.setScore((double)qita);
			second_qita.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_qita);
			
			// 培训组织者或者是主讲人
			List<Train> trains = trainService.getTrainsByTeacher(employees.get(i).getId(), start_time, end_time);
			List<Trainorg> trainorgs = trainOrgService.getTrainorgsByEmployeeId(employees.get(i).getId(), start_time, end_time);
			Secondweight secondweight_zuzhizhe = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString());
			for (int k = 0; k < trains.size(); k++) {
				if (trains.get(k).getTrainLevel().equals("A")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getA();
				}else if (trains.get(k).getTrainLevel().equals("B")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getB();
				}else if (trains.get(k).getTrainLevel().equals("C")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getC();
				}
			}
			for (int j = 0; j < trainorgs.size(); j++) {
				if (trainorgs.get(j).getTrain().getTrainLevel().equals("A")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getA();
				}else if (trainorgs.get(j).getTrain().getTrainLevel().equals("B")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getB();
				}else if (trainorgs.get(j).getTrain().getTrainLevel().equals("C")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getC();
				}
			}
			
			Secondlevelscore second_peixunzuzhizhe = new Secondlevelscore();
			second_peixunzuzhizhe.setEmployee(employees.get(i));
			second_peixunzuzhizhe.setMode(mode);
			second_peixunzuzhizhe.setOneLevel(FinalConstant.CONTRIBUTION_TO_COMPANY);
			second_peixunzuzhizhe.setSecondLevel(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString());
			second_peixunzuzhizhe.setScore(peixunzuzhizhe);
			second_peixunzuzhizhe.setOverallscore(overallscore);
			
			secondLevelScoreService.save(second_peixunzuzhizhe);
			
			//计算一级分类的结果，并进行保存
			double zhuanyejishu = 0.0;
			double hegui = 0.0;
			double goutongguanli = 0.0;
			double ziwochengzhang = 0.0;
			double duigongsigongxian = 0.0;
			
			//专业技术
			double temp_yibansheji = 0.0;
			double temp_dijicuowu = 0.0;
			if (yibanshejiNum!=0) {
				temp_yibansheji = yibansheji/yibanshejiNum;
			}
			if (dijicuowuNum!=0) {
				temp_dijicuowu = dijicuowu/dijicuowuNum;
			}
			zhuanyejishu = temp_yibansheji*yibanshejiWeight+temp_dijicuowu*dijicuowuWeight;
			//合规
			double temp_liucheng = 0.0;
			if (flowsheetRegNum==0) {
				temp_liucheng = 0.0;
			}else {
				temp_liucheng = flowsheetRegSum/flowsheetRegNum;
			}
			hegui = score*shejiguidingWeight+temp_liucheng*(1-shejiguidingWeight);
			//沟通管理
			Secondweight secondweight_workEx = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString());
			Secondweight secondweight_com = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString());
			Secondweight secondweight_workPlan = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString());
			
			double temp_workEnt = 0.0;
			double temp_com = 0.0;
			double temp_workPlan = 0.0;
			
			if (workEntNum!=0) {
				temp_workEnt = workEntSum/workEntNum;
			}
			if (communicationNum!=0) {
				temp_com = communicationSum/communicationNum;
			}
			
			if (workplanNum!=0) {
				temp_workPlan = workplanSum/workplanNum;
			}
			goutongguanli = temp_workEnt*secondweight_workEx.getWeightly()+temp_com*secondweight_com.getWeightly()+temp_workPlan*secondweight_workPlan.getWeightly();
			//自我成长
			Secondweight secondweight_learn = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.SELF_GROWTH_enum.学习积极性.toString());
			ziwochengzhang = xuexijijixing*xuexijijixingWeight+exam_score*(1-xuexijijixingWeight);
			
			//对公司贡献
			double zhuanliResult = zhuanli*zhuanliWeight;
			double jingyankuResult = jingyanfenxiang*jingyanfenxiangWeight;
			double biaozhunhuaResult = biaozhunhua*biaozhunhuaWeight;
			double zhongyaoxinxishoujiResult = zhongyaoxinxishouji*zhongyaoxinxishoujiWeight;
			double xiangmuwendangResult = xiangmuwendang*xiangmuwendangWeight;
			double qitaResult = qita*qitaWeight;
			double peixunResult = peixunzuzhizhe*peixunzuzhizheWeight;
			
			duigongsigongxian = zhuanliResult+jingyankuResult+biaozhunhuaResult+zhongyaoxinxishoujiResult+xiangmuwendangResult+qitaResult+peixunResult;
			
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setEmployee(employees.get(i));
			result.setMode(mode);
			
			result.setCommunication(goutongguanli);
			result.setCompliance(hegui);
			result.setDesignAbility(zhuanyejishu);
			result.setLearningAbility(ziwochengzhang);
			result.setWork(duigongsigongxian);
			
			result.setOverallscore(overallscore);
			
			result.setStartTime(start_time);
			result.setEndTime(end_time);
			resultService.save(result);
			
		}//employees 循环
		
	}
}
