package com.changhong.action;


import java.text.DecimalFormat;
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
import com.changhong.entities.Job;
import com.changhong.entities.Mode;
import com.changhong.entities.Overallscore;
import com.changhong.entities.Patent;
import com.changhong.entities.Problem;
import com.changhong.entities.ResultShowTemplate;
import com.changhong.entities.Secondlevelscore;
import com.changhong.entities.Secondweight;
import com.changhong.entities.Train;
import com.changhong.entities.Trainorg;
import com.changhong.service.AssistService;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.EmployeeService;
import com.changhong.service.ExperienceService;
import com.changhong.service.JobService;
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
	@Result(name="saveModeId",location="/adminEnter/score/result_index_new.jsp"),//////修改到新的界面
	//@Result(name="resultModeId",location="/adminEnter/score/resultTemplate.jsp"),
	@Result(name="hegui",location="/adminEnter/score/heguiTemplate.jsp"),
	@Result(name="sheji",location="/adminEnter/score/shejiTemplate.jsp"),
	@Result(name="ziwochengzhang",location="/adminEnter/score/ziwochengzhangTemplate.jsp"),
	@Result(name="gongxian",location="/adminEnter/score/gongxianTemplate.jsp"),
	@Result(name="goutong",location="/adminEnter/score/goutongTemplate.jsp"),
	@Result(name="result",location="/adminEnter/score/score_main.jsp"),
	@Result(name="jobs",location="/adminEnter/score/make_score.jsp")
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
	@Autowired
	private JobService jobService;
	
	private Date start_time;
	private Date end_time;
	private int chooseItem;
	private String socreName;
	
	private Overallscore overallscore;
	
	private List<ResultShowTemplate> resultShowTemplates;
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String orderName;
	private String orderType;
	
	
	private double compliance_avg;
	private double learningAbility_avg;
	private double designAbility_avg;
	private double work_avg;
	private double communication_avg;
	
	private List<Overallscore> overallscores;
	
	private int modeId;
	private List<com.changhong.entities.Result> results;
	
	
	private List<Job> jobs;
	private int employeeType;
	
	private int pingshenToatleTimes;
	
	public List<ResultShowTemplate> getResultShowTemplates() {
		return resultShowTemplates;
	}
	public void setResultShowTemplates(List<ResultShowTemplate> resultShowTemplates) {
		this.resultShowTemplates = resultShowTemplates;
	}
	public double getCompliance_avg() {
		return compliance_avg;
	}
	public void setCompliance_avg(double compliance_avg) {
		this.compliance_avg = compliance_avg;
	}
	public double getLearningAbility_avg() {
		return learningAbility_avg;
	}
	public void setLearningAbility_avg(double learningAbility_avg) {
		this.learningAbility_avg = learningAbility_avg;
	}
	public double getDesignAbility_avg() {
		return designAbility_avg;
	}
	public void setDesignAbility_avg(double designAbility_avg) {
		this.designAbility_avg = designAbility_avg;
	}
	public double getWork_avg() {
		return work_avg;
	}
	public void setWork_avg(double work_avg) {
		this.work_avg = work_avg;
	}
	public double getCommunication_avg() {
		return communication_avg;
	}
	public void setCommunication_avg(double communication_avg) {
		this.communication_avg = communication_avg;
	}
	public int getEmployeeType() {
		return employeeType;
	}
	public void setEmployeeType(int employeeType) {
		this.employeeType = employeeType;
	}
	public List<Job> getJobs() {
		return jobs;
	}
	public void setJobs(List<Job> jobs) {
		this.jobs = jobs;
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
	
	public String getAllJob()
	{
		jobs = jobService.getJobs();
		return "jobs";
	}
	public String saveOverall() throws InterruptedException
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

		//thread.join();  //等待上面的线程执行完毕 进行计算平均值
		
		
		
		/*Thread thread2 = new Thread(){
			public void run() {
				
			};
		};
		thread2.start();*/
		
		return "success";
		
	}
	public String getAllOverallScore()
	{
		overallscores = overallService.getOverallscores(pageNo, pageSize);
		itemcount = overallService.getCount();
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
	public String deleteOverAll(){
		Overallscore os = new Overallscore();
		os = overallService.getOverallscoreById(modeId);
		overallService.delete(os);
		return "success";
	}
	public String getResultByModeId()
	{
		pingshenToatleTimes = 0;
		log.info("orderName = "+orderName+"  orderType="+orderType);
		int modeId = (Integer) ActionContext.getContext().getSession().get("modeId"); //此处modeId实际上是overallId，
		Params params = new Params(0, pageNo, pageSize, keyword, orderName, orderType);
		/*results = resultService.getResultsByPageAndModeId(params, modeId);
		itemcount = resultService.getCountByModeId(params,modeId);*/
		log.info("modeId = "+modeId);
		/*communication_avg = resultService.getAVG("communication", overallscore.getId());
		compliance_avg = resultService.getAVG("compliance", overallscore.getId());
		learningAbility_avg = resultService.getAVG("learningAbility", overallscore.getId());
		designAbility_avg = resultService.getAVG("designAbility", overallscore.getId());
		work_avg = resultService.getAVG("work", overallscore.getId());*/
		
		results = resultService.getResultsRankByCol(modeId, params);
		itemcount = results.size();
		resultShowTemplates = new ArrayList<ResultShowTemplate>();
		
		for (int i = 0; i < results.size(); i++) {
			List<Secondlevelscore> secondlevelscores = secondLevelScoreService.getSecondlevelscoresByModeIdAndEmployeeId(modeId, results.get(i).getEmployee().getId());
			ResultShowTemplate resultShowTemplate = new ResultShowTemplate();
			resultShowTemplate.setScoreRank(i+1);
			resultShowTemplate.setResult(results.get(i));
			
			int pingshenTimes = problemService.getCountByCommentIdAndEmployeeIdAndDate( results.get(i).getEmployee().getId(), results.get(i).getOverallscore().getStartTime(), results.get(i).getOverallscore().getEndTime());
			
			List<Secondlevelscore> doubles = new ArrayList<Secondlevelscore>();
			String oneLevelName = "";
			if (orderName.equals("compliance")) {
				oneLevelName = "合规";
				resultShowTemplate.setPingshenTimes(pingshenTimes);
			}else if (orderName.equals("designAbility")) {
				oneLevelName = "专业技术";
				resultShowTemplate.setPingshenTimes(pingshenTimes);
			}else if (orderName.equals("learningAbility")) {
				oneLevelName = "自我成长";
			}else if (orderName.equals("work")) {
				oneLevelName = "贡献";
			}else if (orderName.equals("communication")) {
				oneLevelName = "沟通管理";
			}
			log.info("oneLevelName = "+oneLevelName);
			log.info("secondlevelscores.size = "+secondlevelscores.size());
			for (int j = 0; j < secondlevelscores.size(); j++) {
				if ((secondlevelscores.get(j).getOneLevel().trim()).indexOf(oneLevelName)!=-1) {
					doubles.add(secondlevelscores.get(j));
				}
			}
			log.info("doubles.size = "+doubles.size());
			System.out.println("将要放置doubles");
			resultShowTemplate.setList(doubles);
			resultShowTemplates.add(resultShowTemplate);
			
		}
		log.info("finish"+" = "+resultShowTemplates.size());
		binarySearch(modeId);//插入平均值
		if (orderName.equals("compliance")) {
			return "hegui";
		}else if (orderName.equals("designAbility")) {
			return "sheji";
		}else if (orderName.equals("learningAbility")) {
			return "ziwochengzhang";
		}else if (orderName.equals("work")) {
			return "gongxian";
		}else if (orderName.equals("communication")) {
			return "goutong";
		}else{
			return "hegui";
		}
		
		//return "resultModeId";
	}
	
	
	private void calScore()
	{
		log.info("enter calScore");
		List<Employee> employees = new ArrayList<Employee>();
		if (employeeType == 0) {
			employees = employeeService.getAllEmployees();
		}else {
			employees = employeeService.getEmployeesByJobId(employeeType);
		}
		
		modeId = chooseItem;
		Mode mode = modeService.getModeById(modeId);
		
		Secondweight secondweight_yibanshejiquexian = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString());
		Secondweight secondweight_dijicuowu = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString());
		Secondweight secondweight_shejiguiding = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMPLIANCE_enum.设计规定.toString());
		
		Secondweight secondweight_xuexijijixing = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.SELF_GROWTH_enum.学习积极性.toString());
		Secondweight secondweight_zhuanli = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString());
		Secondweight secondweight_jingyanku = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString());
		Secondweight secondweight_zuzhizhe = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString());
		Secondweight secondweight_biaozhunhua = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString());
		Secondweight secondweight_zhongyaoxinxishouji = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString());
		Secondweight secondweight_xiangmuwendang = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString());
		Secondweight secondweight_qita = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString());
		
		Secondweight secondweight_workEx = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString());
		Secondweight secondweight_com = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString());
		Secondweight secondweight_workPlan = secondWeightService.getSecondweightByModeIdAndType(modeId, FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString());
		
		log.info("其他的权重 = "+secondweight_qita.getWeightly());
		
		//统计某个员工的各个维度的得分
		for(int i=0;i<employees.size();i++)
		{
			//一般设计缺陷 扣分总数和出现次数
			double yibansheji=0;
			int yibanshejiNum = 0;
			
			double yibanshejiWeight = 0.0;
			if (secondweight_yibanshejiquexian!=null) {
				yibanshejiWeight = secondweight_yibanshejiquexian.getWeightly();
			}
			//低级错误 扣分总数和出现次数
			double dijicuowu = 0;
			int dijicuowuNum = 0;
			
			double dijicuowuWeight = 0.0;
			if (secondweight_dijicuowu!=null) {
				dijicuowuWeight = secondweight_dijicuowu.getWeightly();
			}
			//设计规定扣分总数和出现次数
			double shejiguiding = 0;
			int shejiguidingNum = 0;
			double shejiguidingWeight = 0.0;
			if (secondweight_shejiguiding!=null) {
				shejiguidingWeight = secondweight_shejiguiding.getWeightly();
			}			
			//员工参与培训加分
			int xuexijijixing = 0;
			double xuexijijixingWeight =  0.0;
			if (secondweight_xuexijijixing!=null) {
				xuexijijixingWeight =  secondweight_xuexijijixing.getWeightly();
			}
			//专利加分
			int zhuanli = 0;
			double zhuanliWeight = 0.0;
			if (secondweight_zhuanli!=null) {
				zhuanliWeight = secondweight_zhuanli.getWeightly();
			}
			//经验分享加分
			int jingyanfenxiang = 0;
			double jingyanfenxiangWeight = 0.0 ;
			if (secondweight_jingyanku!=null) {
				jingyanfenxiangWeight = secondweight_jingyanku.getWeightly() ;
			}
			//标准化加分
			int biaozhunhua = 0 ;
			double biaozhunhuaWeight = 0.0 ;
			if (secondweight_biaozhunhua!=null) {
				biaozhunhuaWeight = secondweight_biaozhunhua.getWeightly() ;
			}
			//重要信息收集
			int zhongyaoxinxishouji = 0;
			double zhongyaoxinxishoujiWeight = 0.0;
			if (secondweight_zhongyaoxinxishouji!=null) {
				zhongyaoxinxishoujiWeight = secondweight_zhongyaoxinxishouji.getWeightly();
			}
			//项目文档
			int xiangmuwendang = 0;
			double xiangmuwendangWeight = 0.0;
			if (secondweight_xiangmuwendang!=null) {
				xiangmuwendangWeight = secondweight_xiangmuwendang.getWeightly();
			}
			//其他
			int qita = 0;
			double qitaWeight = 0.0;
			if (secondweight_qita!=null) {
				qitaWeight = secondweight_qita.getWeightly();
			}
			//培训组织者
			double peixunzuzhizhe = 0;
			double peixunzuzhizheWeight = 0.0;
			if (secondweight_zuzhizhe!=null) {
				peixunzuzhizheWeight = secondweight_zuzhizhe.getWeightly();
			}
			//获取某个员工某段时间的评审次数
			int pingshenTimes = problemService.getCountByCommentIdAndEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);
			
			log.info("员工"+employees.get(i).getName()+"设计评审次数为："+pingshenTimes);
			//根据员工的id找出在某段时间内该员工所犯的所有问题
			List<Problem> problems = new ArrayList<Problem>();
			problems = problemService.getProblemsByEmployeeId(employees.get(i).getId(), start_time, end_time);
			
			log.info("员工"+employees.get(i).getName()+"所有的问题个数："+problems.size());
			//对各个问题分别分析类别
			
			/*if (secondweight_yibanshejiquexian!=null) {
				yibanshejiWeight = secondweight_yibanshejiquexian.getWeightly();
			}else {
				yibanshejiWeight = 0.0;
			}
			if (secondweight_dijicuowu!=null) {
				dijicuowuWeight = secondweight_dijicuowu.getWeightly();
			}else {
				yibanshejiWeight = 0.0;
			}
			
			if (secondweight_shejiguiding!=null) {
				shejiguidingWeight = secondweight_shejiguiding.getWeightly();
			}else {
				shejiguidingWeight=0.0;
			}*/
			for (int j = 0; j < problems.size(); j++) {
				//一般设计缺陷
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString())) {
					log.info("员工"+employees.get(i).getName()+"一般设计缺陷："+problems.get(j).getProblemId());
					if (secondweight_yibanshejiquexian==null) {
					}else {
						
						if (problems.get(j).getProblemLevel().equals("A")) {
							
							yibansheji+=secondweight_yibanshejiquexian.getA();
							log.info("员工"+employees.get(i).getName()+"一般设计缺陷的A问题："+problems.get(j).getProblemLevel()+" 一般设计缺陷总分"+yibansheji);
							//yibanshejiNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							
							yibansheji+=secondweight_yibanshejiquexian.getB();
							log.info("员工"+employees.get(i).getName()+"一般设计缺陷的B问题："+problems.get(j).getProblemLevel()+" 一般设计缺陷总分"+yibansheji);
							//yibanshejiNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							
							yibansheji+=secondweight_yibanshejiquexian.getC();
							log.info("员工"+employees.get(i).getName()+"一般设计缺陷的C问题："+problems.get(j).getProblemLevel()+" 一般设计缺陷总分"+yibansheji);
							//yibanshejiNum++;
						}
						
					}	
				}else
				
				//低级错误
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString())) {
					
					
					if (secondweight_dijicuowu==null) {
						
					}else {
						
						if (problems.get(j).getProblemLevel().equals("A")) {
							dijicuowu+=secondweight_dijicuowu.getA();
							log.info("员工"+employees.get(i).getName()+"低级错误的A问题："+problems.get(j).getProblemLevel()+" 低级错误总分"+dijicuowu);
							dijicuowuNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							dijicuowu+=secondweight_dijicuowu.getB();
							log.info("员工"+employees.get(i).getName()+"低级错误的B问题："+problems.get(j).getProblemLevel()+" 低级错误总分"+dijicuowu);
							dijicuowuNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							dijicuowu+=secondweight_dijicuowu.getC();
							log.info("员工"+employees.get(i).getName()+"低级错误的C问题："+problems.get(j).getProblemLevel()+" 低级错误总分"+dijicuowu);
							dijicuowuNum++;
						}
						
					}	
				}else 
				//设计评审中的   设计规定扣分
				if (problems.get(j).getProblemtype().getTypeName().equals(FinalConstant.COMPLIANCE_enum.设计规定.toString())||problems.get(j).getProblemtype().getTypeName().equals("不合规")) {
					
					log.info("设计规定扣分项统计");
					if (secondweight_shejiguiding==null) {
						log.info("secondweight_shejiguiding == null");
					}else {
						log.info("问题级别"+problems.get(j).getProblemLevel());
						if (problems.get(j).getProblemLevel().equals("A")) {
							shejiguiding+=secondweight_shejiguiding.getA();
							log.info("员工"+employees.get(i).getName()+"设计规定的A问题："+problems.get(j).getProblemLevel()+" 设计规定总分"+shejiguiding);
							shejiguidingNum++;
						}else if (problems.get(j).getProblemLevel().equals("B")) {
							shejiguiding+=secondweight_shejiguiding.getB();
							log.info("员工"+employees.get(i).getName()+"设计规定的B问题："+problems.get(j).getProblemLevel()+" 设计规定总分"+shejiguiding);
							shejiguidingNum++;
						}else if (problems.get(j).getProblemLevel().equals("C")) {
							shejiguiding+=secondweight_shejiguiding.getC();
							log.info("员工"+employees.get(i).getName()+"设计规定的C问题："+problems.get(j).getProblemLevel()+" 设计规定总分"+shejiguiding);
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
			yibanshejiNum = pingshenTimes;
			if (yibanshejiNum==0) {
				second_yibansheji.setScore(0.0);
			}else {
				second_yibansheji.setScore((double)yibansheji/yibanshejiNum);
			}
			second_yibansheji.setOverallscore(overallscore);
			log.info("员工"+employees.get(i).getName()+"一般设计缺陷二级结果"+second_yibansheji.getScore()+"一般设计缺陷的评审次数="+yibanshejiNum+"一般设计总分="+yibansheji);
			secondLevelScoreService.save(second_yibansheji);
			//低级错误二级结果保存
			Secondlevelscore second_dijicuowu = new Secondlevelscore();
			second_dijicuowu.setEmployee(employees.get(i));
			second_dijicuowu.setMode(mode);
			second_dijicuowu.setOneLevel(FinalConstant.PROFESSIONAL_SKILL);
			second_dijicuowu.setSecondLevel(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString());
			dijicuowuNum = pingshenTimes;
			if (dijicuowuNum==0) {
				second_dijicuowu.setScore(0.0);
			}else {
				second_dijicuowu.setScore((double)dijicuowu/dijicuowuNum);
			}
			second_dijicuowu.setOverallscore(overallscore);
			
			log.info("员工"+employees.get(i).getName()+"低级错误二级结果"+second_dijicuowu.getScore()+"低级错误的评审次数="+dijicuowuNum+"总分="+dijicuowu);
			secondLevelScoreService.save(second_dijicuowu);
			
			//设计合规二级结果保存
			//int designRegNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time,"designReg");
			int designRegNum = projectReviewService.getCountByEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);//计算某段时间内进行的评审次数
			Long designRegSum = projectReviewService.getSumByCol(employees.get(i).getId(), start_time, end_time,"designReg"); //计算某段时间没某一列的所有数据的和
			
			Secondlevelscore second_shejiguiding = new Secondlevelscore();
			second_shejiguiding.setEmployee(employees.get(i));
			second_shejiguiding.setMode(mode);
			second_shejiguiding.setOneLevel(FinalConstant.COMPLIANCE);
			second_shejiguiding.setSecondLevel(FinalConstant.COMPLIANCE_enum.设计规定.toString());
			double tem_sheji = 0.0;
			shejiguidingNum = pingshenTimes;
			if (shejiguidingNum==0) {
				tem_sheji = 0.0;
			}else {
				tem_sheji = (double)shejiguiding/shejiguidingNum;
			}
			
			double tem_des = 0.0;
			if (designRegNum==0) {
				tem_des = 0.0;
			}else {
				tem_des = (double)designRegSum/designRegNum;
			}
			double score = tem_des+tem_sheji;
			second_shejiguiding.setScore(score);
			second_shejiguiding.setOverallscore(overallscore);
			
			log.info("员工"+employees.get(i).getName()+"设计规定二级结果"+second_shejiguiding.getScore()+"设计评审的评审次数="+shejiguidingNum+"总分="+score);
			secondLevelScoreService.save(second_shejiguiding);
			
			log.info("设计合规的计算 设计评审次数 = "+shejiguidingNum+" 设计规定分数="+shejiguiding+" tem+des="+tem_des+" tem_sheji="+tem_sheji);
			
			//流程合规二级结果保存
			//int flowsheetRegNum = projectReviewService.getCountNotZero(employees.get(i).getId(), start_time, end_time, "flowsheetReg");
			int flowsheetRegNum = projectReviewService.getCountByEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);
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
			log.info("员工"+employees.get(i).getName()+"流程二级结果"+second_liuchenghegui.getScore()+"流程合规的评审次数="+flowsheetRegNum+"总分="+flowsheetRegSum);
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
			
			log.info("员工"+employees.get(i).getName()+"工作积极性二级结果"+second_gongzuojijixing.getScore()+"评审次数="+workEntNum+"总分="+workEntSum);
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
			
			log.info("员工"+employees.get(i).getName()+"沟通能力二级结果"+second_goutongnengli.getScore()+"评审次数="+communicationNum+"总分="+communicationSum);
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
			log.info("员工"+employees.get(i).getName()+"工作计划性二级结果"+second_gongzuojihuaxing.getScore()+"评审次数="+workplanNum+"总分="+workEntSum);
			second_gongzuojihuaxing.setOverallscore(overallscore);
			
			
			secondLevelScoreService.save(second_gongzuojihuaxing);
			
			
			//自我成长
			//学习积极性 二级结果保存
			List<Employeetrainr> employeetrainrs=trainService.getEmployeetrainrsByEmployeeIdAndDate(employees.get(i).getId(), start_time, end_time);
			
			for (int j = 0; j < employeetrainrs.size(); j++) {
				
				if (secondweight_xuexijijixing==null) {
				}else {
					xuexijijixing+=secondweight_xuexijijixing.getA();
					/*if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("A")) {
						xuexijijixing+=secondweight_xuexijijixing.getA();
					}else if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("B")) {
						xuexijijixing+=secondweight_xuexijijixing.getB();
					}else if (employeetrainrs.get(j).getTrain().getTrainLevel().equals("C")) {
						xuexijijixing+=secondweight_xuexijijixing.getC();
					}*/
					
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
			
			for (int k = 0; k < trains.size(); k++) {
				peixunzuzhizhe += secondweight_zuzhizhe.getA();
				/*if (trains.get(k).getTrainLevel().equals("A")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getA();
				}else if (trains.get(k).getTrainLevel().equals("B")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getB();
				}else if (trains.get(k).getTrainLevel().equals("C")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getC();
				}*/
			}
			for (int j = 0; j < trainorgs.size(); j++) {
				peixunzuzhizhe += secondweight_zuzhizhe.getA();
				/*if (trainorgs.get(j).getTrain().getTrainLevel().equals("A")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getA();
				}else if (trainorgs.get(j).getTrain().getTrainLevel().equals("B")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getB();
				}else if (trainorgs.get(j).getTrain().getTrainLevel().equals("C")) {
					peixunzuzhizhe += secondweight_zuzhizhe.getC();
				}*/
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
				temp_yibansheji = (double)yibansheji/yibanshejiNum;
			}
			if (dijicuowuNum!=0) {
				temp_dijicuowu = (double)dijicuowu/dijicuowuNum;
			}
			
			
			zhuanyejishu = temp_yibansheji*yibanshejiWeight+temp_dijicuowu*dijicuowuWeight;//根据一般设计错误和低级错误进行加权计算
			log.info("员工"+employees.get(i).getName()+"设计一级结果");
			log.info("专业技术一级结果计算 temp_yibansheji= "+temp_yibansheji+" temp_dijicuowu = "+temp_dijicuowu+" yibanshejiWeight="+yibanshejiWeight+" dijicuowuWeight = "+dijicuowuWeight);
			//合规
			double temp_liucheng = 0.0;
			if (flowsheetRegNum==0) {
				temp_liucheng = 0.0;
			}else {
				temp_liucheng = (double)flowsheetRegSum/flowsheetRegNum;
			}
			//对合规的权重进行盘判定，如果设计合规的权重为100%，则合规总分就不进行加权计算。
			
			if (1-shejiguidingWeight<0.00001) {
				hegui = score+temp_liucheng;
			}else {
				hegui = score*shejiguidingWeight+temp_liucheng*(1-shejiguidingWeight);
			}
			log.info("员工"+employees.get(i).getName()+"合规一级结果");
			log.info("合规一级结果计算 temp_liucheng = "+temp_liucheng+" score"+score+" shejiguidingWeight="+shejiguidingWeight);
			
			//沟通管理
			
			
			double temp_workEnt = 0.0;
			double temp_com = 0.0;
			double temp_workPlan = 0.0;
			
			if (workEntNum!=0) {
				temp_workEnt = (double)workEntSum/workEntNum;
			}
			if (communicationNum!=0) {
				temp_com = (double)communicationSum/communicationNum;
			}
			
			if (workplanNum!=0) {
				temp_workPlan = (double)workplanSum/workplanNum;
			}
			goutongguanli = temp_workEnt*secondweight_workEx.getWeightly()+temp_com*secondweight_com.getWeightly()+temp_workPlan*secondweight_workPlan.getWeightly();
			log.info("沟通管理一级结果计算 temp_workEnt="+temp_workEnt+" workent_weight"+temp_workEnt+secondweight_workEx.getWeightly()+" temp_com="+temp_com+" comweight "+secondweight_com.getWeightly()+" temp_workPlan= "+temp_workPlan+" weight = "+secondweight_workPlan.getWeightly());
			
			
			//自我成长
			if((1-xuexijijixingWeight)<0.00001)
			{
				ziwochengzhang = xuexijijixing+exam_score;
			}else {
				ziwochengzhang = xuexijijixing*xuexijijixingWeight+exam_score*(1-xuexijijixingWeight);
			}
			
			
			log.info("xuexijijixing ="+xuexijijixing+" xuexijijixingWeight="+xuexijijixingWeight+" exam_score="+exam_score+ " ");
			//对公司贡献
			double zhuanliResult = zhuanli*zhuanliWeight;
			double jingyankuResult = jingyanfenxiang*jingyanfenxiangWeight;
			double biaozhunhuaResult = biaozhunhua*biaozhunhuaWeight;
			double zhongyaoxinxishoujiResult = zhongyaoxinxishouji*zhongyaoxinxishoujiWeight;
			double xiangmuwendangResult = xiangmuwendang*xiangmuwendangWeight;
			double qitaResult = qita*qitaWeight;
			double peixunResult = peixunzuzhizhe*peixunzuzhizheWeight;
			
			log.info("其他分数的计算"+" qita = "+qita+" qitaweight = "+qitaWeight+"  qitaResult = "+qitaResult);
			duigongsigongxian = zhuanliResult+jingyankuResult+biaozhunhuaResult+zhongyaoxinxishoujiResult+xiangmuwendangResult+qitaResult+peixunResult;
			
			log.info("贡献zhuanliResult ="+zhuanliResult+" jingyankuResult= "+jingyankuResult+" biaozhunhuaResult="+biaozhunhuaResult+" zhongyaoxinxishoujiResult="+zhongyaoxinxishoujiResult);
			log.info("贡献xiangmuwendangResult="+xiangmuwendangResult+" qitaResult="+qitaResult+" peixunResult="+peixunResult);
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setEmployee(employees.get(i));
			result.setMode(mode);
			
			result.setCommunication(goutongguanli);
			result.setCompliance(hegui);
			result.setDesignAbility(zhuanyejishu);
			result.setLearningAbility(ziwochengzhang);
			result.setWork(duigongsigongxian);
			
			log.info("一级结果 goutongguanli="+goutongguanli+" hegui="+hegui+" zhangyejishu = "+zhuanyejishu+" ziwochengzhang="+ziwochengzhang+" duigongsigongxian="+duigongsigongxian);
			result.setOverallscore(overallscore);
			
			result.setStartTime(start_time);
			result.setEndTime(end_time);
			resultService.save(result);
			
		}
	}
	
	
	public void saveAvg()
	{
		//获取到一级结果的平均值 并转成一条记录保存到数据库中
		communication_avg = resultService.getAVG("communication", overallscore.getId());
		compliance_avg = resultService.getAVG("compliance", overallscore.getId());
		learningAbility_avg = resultService.getAVG("learningAbility", overallscore.getId());
		designAbility_avg = resultService.getAVG("designAbility", overallscore.getId());
		work_avg = resultService.getAVG("work", overallscore.getId());
		
		com.changhong.entities.Result result = new com.changhong.entities.Result();
		result.setCommunication(communication_avg);
		result.setCompliance(compliance_avg);
		result.setLearningAbility(learningAbility_avg);
		result.setDesignAbility(designAbility_avg);
		result.setWork(work_avg);
		Employee employee = new Employee();
		employee.setId("00000000");
		employee.setName("平均值");
		result.setEmployee(employee);
		result.setStartTime(start_time);
		result.setEndTime(end_time);
		result.setOverallscore(overallscore);
		
		resultService.save(result);
		
		
	}
	
	//利用二分查找向结果集中添加平均值
	
	private void binarySearch(int overAllScoreId)
	{
		double yibanshejiquexian_avg;
		double dijicuowu_avg;
		double shejihegui_avg;
		double liuchenghegui_avg;
		double gongzuojijixing_avg;
		double gongtongnengli_avg;
		double gongzuojihuaxing_avg;
		double xuexijijixing_avg;
		double kaoshi_avg;
		double zhuanli_avg;
		double jingyanku_avg;
		double biaozhunhua_avg;
		double zhongyaoxinxishouji_avg;
		double xiangmuwendang_avg;
		double qita_avg;
		double peixun_avg;
		//resultShowTemplates
		 DecimalFormat df = new DecimalFormat("##.00");
		
		if (orderName.equals("compliance")) {//合规
			compliance_avg = resultService.getAVG("compliance", overAllScoreId);
			log.info("compliance avg = "+compliance_avg);
			log.info("enum = "+FinalConstant.COMPLIANCE_enum.设计规定.toString());
			shejihegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.设计规定.toString(), overAllScoreId);
			log.info("shejihegui_avg"+shejihegui_avg+"");
			liuchenghegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.流程规定.toString(), overAllScoreId);
			
			int low = 0;
			int height = resultShowTemplates.size();
			int mid;
			while (low<=height) {
				mid = (low+height)/2;
				if (resultShowTemplates.get(mid).getResult().getCompliance()>compliance_avg) {
					low = mid+1;
					
				}else {
					height = mid-1;
				}
			}
			ResultShowTemplate rst = new ResultShowTemplate();
			
			Secondlevelscore sls = new Secondlevelscore();
			sls.setScore(BaoLiuXiaoShu(shejihegui_avg));
			Secondlevelscore sls2 = new Secondlevelscore();
			sls2.setScore(BaoLiuXiaoShu(liuchenghegui_avg));
			List<Secondlevelscore> list = new ArrayList<Secondlevelscore>();
			list.add(sls);
			list.add(sls2);
			rst.setList(list );
			
			Employee employee = new Employee();
			employee.setId("平均值");
			employee.setName("平均值");
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setCompliance(BaoLiuXiaoShu(compliance_avg));
			result.setEmployee(employee);
			rst.setResult(result);
			
			
			resultShowTemplates.add(low, rst);
			
		}else if (orderName.equals("designAbility")) {//专业技术
			designAbility_avg = resultService.getAVG("designAbility", overAllScoreId);
			yibanshejiquexian_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString(), overAllScoreId);
			dijicuowu_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString(), overAllScoreId);
			
			int low = 0;
			int height = resultShowTemplates.size();
			int mid;
			while (low<=height) {
				mid = (low+height)/2;
				if (resultShowTemplates.get(mid).getResult().getDesignAbility()>designAbility_avg) {
					low = mid+1;
					
				}else {
					height = mid-1;
				}
			}
			ResultShowTemplate rst = new ResultShowTemplate();
			
			Secondlevelscore sls = new Secondlevelscore();
			sls.setScore(BaoLiuXiaoShu(yibanshejiquexian_avg));
			Secondlevelscore sls2 = new Secondlevelscore();
			sls2.setScore(BaoLiuXiaoShu(dijicuowu_avg));
			List<Secondlevelscore> list = new ArrayList<Secondlevelscore>();
			list.add(sls);
			list.add(sls2);
			rst.setList(list );
			
			Employee employee = new Employee();
			employee.setId("平均值");
			employee.setName("平均值");
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setDesignAbility(BaoLiuXiaoShu(designAbility_avg));
			result.setEmployee(employee);
			rst.setResult(result);
			
			resultShowTemplates.add(low, rst);
			
		}else if (orderName.equals("learningAbility")) {//自我成长
			learningAbility_avg = resultService.getAVG("learningAbility", overAllScoreId);
			xuexijijixing_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.学习积极性.toString(), overAllScoreId);
			kaoshi_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.考试.toString(), overAllScoreId);
			
			int low = 0;
			int height = resultShowTemplates.size();
			int mid;
			while (low<=height) {
				mid = (low+height)/2;
				if (resultShowTemplates.get(mid).getResult().getLearningAbility()>learningAbility_avg) {
					low = mid+1;
					
				}else {
					height = mid-1;
				}
			}
			ResultShowTemplate rst = new ResultShowTemplate();
			
			Secondlevelscore sls = new Secondlevelscore();
			sls.setScore(BaoLiuXiaoShu(xuexijijixing_avg));
			Secondlevelscore sls2 = new Secondlevelscore();
			sls2.setScore(BaoLiuXiaoShu(kaoshi_avg));
			List<Secondlevelscore> list = new ArrayList<Secondlevelscore>();
			list.add(sls);
			list.add(sls2);
			rst.setList(list );
			
			Employee employee = new Employee();
			employee.setId("平均值");
			employee.setName("平均值");
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setLearningAbility(BaoLiuXiaoShu(learningAbility_avg));
			result.setEmployee(employee);
			rst.setResult(result);
			
			resultShowTemplates.add(low, rst);
			
		}else if (orderName.equals("work")) {//贡献
			work_avg = resultService.getAVG("work", overAllScoreId);
			zhuanli_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString(), overAllScoreId);
			jingyanku_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString(), overAllScoreId);
			biaozhunhua_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString(), overAllScoreId);
			zhongyaoxinxishouji_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString(),overAllScoreId);
			qita_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString(), overAllScoreId);
			xiangmuwendang_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString(), overAllScoreId);
			peixun_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString(), overAllScoreId);
			
			
			int low = 0;
			int height = resultShowTemplates.size();
			int mid;
			while (low<=height) {
				mid = (low+height)/2;
				if (resultShowTemplates.get(mid).getResult().getWork()>work_avg) {
					low = mid+1;
					
				}else {
					height = mid-1;
				}
			}
			ResultShowTemplate rst = new ResultShowTemplate();
			
			Secondlevelscore sls = new Secondlevelscore();
			sls.setScore(BaoLiuXiaoShu(zhuanli_avg));
			Secondlevelscore sls2 = new Secondlevelscore();
			sls2.setScore(BaoLiuXiaoShu(jingyanku_avg));
			Secondlevelscore sls3 = new Secondlevelscore();
			sls3.setScore(BaoLiuXiaoShu(biaozhunhua_avg));
			Secondlevelscore sls4 = new Secondlevelscore();
			sls4.setScore(BaoLiuXiaoShu(zhongyaoxinxishouji_avg));
			Secondlevelscore sls5 = new Secondlevelscore();
			sls5.setScore(BaoLiuXiaoShu(xiangmuwendang_avg));
			Secondlevelscore sls6 = new Secondlevelscore();
			sls6.setScore(BaoLiuXiaoShu(qita_avg));
			Secondlevelscore sls7 = new Secondlevelscore();
			sls7.setScore(BaoLiuXiaoShu(peixun_avg));
			
			List<Secondlevelscore> list = new ArrayList<Secondlevelscore>();
			list.add(sls);
			list.add(sls2);
			list.add(sls3);
			list.add(sls4);
			list.add(sls5);
			list.add(sls6);
			list.add(sls7);
			rst.setList(list );
			
			Employee employee = new Employee();
			employee.setId("平均值");
			employee.setName("平均值");
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setWork(BaoLiuXiaoShu(work_avg));
			result.setEmployee(employee);
			rst.setResult(result);
			
			resultShowTemplates.add(low, rst);
			
		}else {//if (orderName.equals("communication")) {//沟通管理
			communication_avg = resultService.getAVG("communication",overAllScoreId);
			gongzuojijixing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString(),overAllScoreId);
			gongtongnengli_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString(), overAllScoreId);
			gongzuojihuaxing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString(), overAllScoreId);
			
			int low = 0;
			int height = resultShowTemplates.size();
			int mid;
			while (low<=height) {
				mid = (low+height)/2;
				if (resultShowTemplates.get(mid).getResult().getCommunication()>communication_avg) {
					low = mid+1;
					
				}else {
					height = mid-1;
				}
			}
			ResultShowTemplate rst = new ResultShowTemplate();
			
			Secondlevelscore sls = new Secondlevelscore();
			sls.setScore(BaoLiuXiaoShu(gongzuojijixing_avg));
			Secondlevelscore sls2 = new Secondlevelscore();
			sls2.setScore(BaoLiuXiaoShu(gongtongnengli_avg));
			Secondlevelscore sls3 = new Secondlevelscore();
			sls3.setScore(BaoLiuXiaoShu(gongzuojihuaxing_avg));
			
			List<Secondlevelscore> list = new ArrayList<Secondlevelscore>();
			list.add(sls);
			list.add(sls2);
			list.add(sls3);
			rst.setList(list );
			
			Employee employee = new Employee();
			employee.setId("平均值");
			employee.setName("平均值");
			com.changhong.entities.Result result = new com.changhong.entities.Result();
			result.setCommunication(BaoLiuXiaoShu(communication_avg));
			result.setEmployee(employee);
			rst.setResult(result);
			
			resultShowTemplates.add(low, rst);
		}
	}
	
	
	private double BaoLiuXiaoShu(double k)
	{
		int t = (int) (k*100);
		double r = (double)t/100;
		return r;
	}
	
}
