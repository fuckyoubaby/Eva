package com.changhong.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Secondlevelscore;
import com.changhong.service.ResultService;
import com.changhong.service.SecondLevelScoreService;
import com.changhong.support.FinalConstant;
import com.opensymphony.xwork2.ActionContext;

@Action("resultAction")
@Results({
	@Result(name="resultsForEmployeeId",location="/userEnter/score/score_main.jsp"),
	@Result(name="result",location="/adminEnter/score/score_main.jsp")
})
public class ResultAction {
	private static final Logger log = LoggerFactory.getLogger(ResultAction.class);
	@Autowired
	private ResultService resultService;
	@Autowired
	private SecondLevelScoreService secondLevelScoreService;
	
	private List<com.changhong.entities.Result> results;
	
	private com.changhong.entities.Result result;
	
	private int resultId;
	
	
	private double compliance_avg;
	private double learningAbility_avg;
	private double designAbility_avg;
	private double work_avg;
	private double communication_avg;
	
	private double compliance_max;
	private double learningAbility_max;
	private double designAbility_max;
	private double work_max;
	private double communication_max;
	
	private int overallId;
	
	private double yibanshejiquexian_avg;
	private double dijicuowu_avg;
	private double shejihegui_avg;
	private double liuchenghegui_avg;
	private double gongzuojijixing_avg;
	private double gongtongnengli_avg;
	private double gongzuojihuaxing_avg;
	private double xuexijijixing_avg;
	private double kaoshi_avg;
	private double zhuanli_avg;
	private double jingyanku_avg;
	private double biaozhunhua_avg;
	private double zhongyaoxinxishouji_avg;
	private double xiangmuwendang_avg;
	private double qita_avg;
	private double peixun_avg;
	
	private List<Secondlevelscore> secondlevelscores;
	
	
	
	
	public double getPeixun_avg() {
		return peixun_avg;
	}
	public void setPeixun_avg(double peixun_avg) {
		this.peixun_avg = peixun_avg;
	}
	public double getXiangmuwendang_avg() {
		return xiangmuwendang_avg;
	}
	public void setXiangmuwendang_avg(double xiangmuwendang_avg) {
		this.xiangmuwendang_avg = xiangmuwendang_avg;
	}
	public double getYibanshejiquexian_avg() {
		return yibanshejiquexian_avg;
	}
	public void setYibanshejiquexian_avg(double yibanshejiquexian_avg) {
		this.yibanshejiquexian_avg = yibanshejiquexian_avg;
	}
	public double getDijicuowu_avg() {
		return dijicuowu_avg;
	}
	public void setDijicuowu_avg(double dijicuowu_avg) {
		this.dijicuowu_avg = dijicuowu_avg;
	}
	public double getShejihegui_avg() {
		return shejihegui_avg;
	}
	public void setShejihegui_avg(double shejihegui_avg) {
		this.shejihegui_avg = shejihegui_avg;
	}
	public double getLiuchenghegui_avg() {
		return liuchenghegui_avg;
	}
	public void setLiuchenghegui_avg(double liuchenghegui_avg) {
		this.liuchenghegui_avg = liuchenghegui_avg;
	}
	public double getGongzuojijixing_avg() {
		return gongzuojijixing_avg;
	}
	public void setGongzuojijixing_avg(double gongzuojijixing_avg) {
		this.gongzuojijixing_avg = gongzuojijixing_avg;
	}
	public double getGongtongnengli_avg() {
		return gongtongnengli_avg;
	}
	public void setGongtongnengli_avg(double gongtongnengli_avg) {
		this.gongtongnengli_avg = gongtongnengli_avg;
	}
	public double getGongzuojihuaxing_avg() {
		return gongzuojihuaxing_avg;
	}
	public void setGongzuojihuaxing_avg(double gongzuojihuaxing_avg) {
		this.gongzuojihuaxing_avg = gongzuojihuaxing_avg;
	}
	public double getXuexijijixing_avg() {
		return xuexijijixing_avg;
	}
	public void setXuexijijixing_avg(double xuexijijixing_avg) {
		this.xuexijijixing_avg = xuexijijixing_avg;
	}
	public double getKaoshi_avg() {
		return kaoshi_avg;
	}
	public void setKaoshi_avg(double kaoshi_avg) {
		this.kaoshi_avg = kaoshi_avg;
	}
	public double getZhuanli_avg() {
		return zhuanli_avg;
	}
	public void setZhuanli_avg(double zhuanli_avg) {
		this.zhuanli_avg = zhuanli_avg;
	}
	public double getJingyanku_avg() {
		return jingyanku_avg;
	}
	public void setJingyanku_avg(double jingyanku_avg) {
		this.jingyanku_avg = jingyanku_avg;
	}
	public double getBiaozhunhua_avg() {
		return biaozhunhua_avg;
	}
	public void setBiaozhunhua_avg(double biaozhunhua_avg) {
		this.biaozhunhua_avg = biaozhunhua_avg;
	}
	public double getZhongyaoxinxishouji_avg() {
		return zhongyaoxinxishouji_avg;
	}
	public void setZhongyaoxinxishouji_avg(double zhongyaoxinxishouji_avg) {
		this.zhongyaoxinxishouji_avg = zhongyaoxinxishouji_avg;
	}
	public double getQita_avg() {
		return qita_avg;
	}
	public void setQita_avg(double qita_avg) {
		this.qita_avg = qita_avg;
	}
	public List<Secondlevelscore> getSecondlevelscores() {
		return secondlevelscores;
	}
	public void setSecondlevelscores(List<Secondlevelscore> secondlevelscores) {
		this.secondlevelscores = secondlevelscores;
	}
	public int getOverallId() {
		return overallId;
	}
	public void setOverallId(int overallId) {
		this.overallId = overallId;
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
	public double getCompliance_max() {
		return compliance_max;
	}
	public void setCompliance_max(double compliance_max) {
		this.compliance_max = compliance_max;
	}
	public double getLearningAbility_max() {
		return learningAbility_max;
	}
	public void setLearningAbility_max(double learningAbility_max) {
		this.learningAbility_max = learningAbility_max;
	}
	public double getDesignAbility_max() {
		return designAbility_max;
	}
	public void setDesignAbility_max(double designAbility_max) {
		this.designAbility_max = designAbility_max;
	}
	public double getWork_max() {
		return work_max;
	}
	public void setWork_max(double work_max) {
		this.work_max = work_max;
	}
	public double getCommunication_max() {
		return communication_max;
	}
	public void setCommunication_max(double communication_max) {
		this.communication_max = communication_max;
	}
	public int getResultId() {
		return resultId;
	}
	public void setResultId(int resultId) {
		this.resultId = resultId;
	}
	public com.changhong.entities.Result getResult() {
		return result;
	}
	public void setResult(com.changhong.entities.Result result) {
		this.result = result;
	}
	public List<com.changhong.entities.Result> getResults() {
		return results;
	}
	public void setResults(List<com.changhong.entities.Result> results) {
		this.results = results;
	}
	public String getResultByEmployeeId()
	{
		String employeeId = (String) ActionContext.getContext().getSession().get("employeeId");
		//results = resultService.getResultsByEmployeeIdAndDate(employeeId);
		result = resultService.getResultByEmployeeIdAndOverallId(employeeId, overallId);
		
		communication_avg = resultService.getAVG("communication", overallId);
		compliance_avg = resultService.getAVG("compliance", overallId);
		learningAbility_avg = resultService.getAVG("learningAbility", overallId);
		designAbility_avg = resultService.getAVG("designAbility", overallId);
		work_avg = resultService.getAVG("work", overallId);
		
		com.changhong.entities.Result communication_Result = resultService.getMax("communication", overallId);
		if (communication_Result!=null) {
			communication_max = communication_Result.getCommunication();
			if (communication_max==0) {
				communication_max = 5.0;
			}
		}
		com.changhong.entities.Result compliance_Result = resultService.getMax("compliance", overallId);
		if (compliance_Result!=null) {
			compliance_max = compliance_Result.getCompliance();
			if (compliance_max==0) {
				compliance_max = 5.0;
			}
		}
		com.changhong.entities.Result learningAbility_Result = resultService.getMax("learningAbility", overallId);
		if (learningAbility_Result!=null) {
			learningAbility_max = learningAbility_Result.getLearningAbility();
			if (learningAbility_max == 0) {
				learningAbility_max=5.0;
			}
		}
		com.changhong.entities.Result designAbility_Result = resultService.getMax("designAbility", overallId);
		if (designAbility_Result!=null) {
			designAbility_max = designAbility_Result.getDesignAbility();
			if (designAbility_max == 0) {
				designAbility_max = 5.0;
			}
		}
		com.changhong.entities.Result work_Result = resultService.getMax("work", overallId);
		if (work_Result!=null) {
			work_max = work_Result.getWork();
			if (work_max==0) {
				work_max = 5.0;
			}
		}
		
		yibanshejiquexian_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString(), overallId);
		dijicuowu_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString(), overallId);
		shejihegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.设计规定.toString(), overallId);
		liuchenghegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.流程规定.toString(), overallId);
		gongzuojijixing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString(), overallId);
		gongtongnengli_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString(), overallId);
		gongzuojihuaxing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString(), overallId);
		xuexijijixing_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.学习积极性.toString(), overallId);
		kaoshi_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.考试.toString(), overallId);
		zhuanli_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString(), overallId);
		jingyanku_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString(), overallId);
		biaozhunhua_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString(), overallId);
		zhongyaoxinxishouji_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString(), overallId);
		qita_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString(), overallId);
		xiangmuwendang_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString(), overallId);
		peixun_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString(), overallId);
		
		secondlevelscores = secondLevelScoreService.getSecondlevelscoresByOverallIdAndEmployeeId(employeeId, overallId);
		
		return "resultsForEmployeeId";
	}

	public String getResultById()
	{
		result = resultService.getResultById(resultId);
		ActionContext context = ActionContext.getContext();
		int overallId = (Integer) context.getSession().get("modeId");
		communication_avg = resultService.getAVG("communication", overallId);
		compliance_avg = resultService.getAVG("compliance", overallId);
		learningAbility_avg = resultService.getAVG("learningAbility", overallId);
		designAbility_avg = resultService.getAVG("designAbility", overallId);
		work_avg = resultService.getAVG("work", overallId);
		
		com.changhong.entities.Result communication_Result = resultService.getMax("communication", overallId);
		if (communication_Result!=null) {
			communication_max = communication_Result.getCommunication();
			if (communication_max==0) {
				communication_max = 5.0;
			}
		}
		com.changhong.entities.Result compliance_Result = resultService.getMax("compliance", overallId);
		if (compliance_Result!=null) {
			compliance_max = compliance_Result.getCompliance();
			if (compliance_max==0) {
				compliance_max = 5.0;
			}
		}
		com.changhong.entities.Result learningAbility_Result = resultService.getMax("learningAbility", overallId);
		if (learningAbility_Result!=null) {
			learningAbility_max = learningAbility_Result.getLearningAbility();
			if (learningAbility_max == 0) {
				learningAbility_max=5.0;
			}
		}
		com.changhong.entities.Result designAbility_Result = resultService.getMax("designAbility", overallId);
		if (designAbility_Result!=null) {
			designAbility_max = designAbility_Result.getDesignAbility();
			if (designAbility_max == 0) {
				designAbility_max = 5.0;
			}
		}
		com.changhong.entities.Result work_Result = resultService.getMax("work", overallId);
		if (work_Result!=null) {
			work_max = work_Result.getWork();
			if (work_max==0) {
				work_max = 5.0;
			}
		}
		
		
		yibanshejiquexian_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.一般设计缺陷.toString(), overallId);
		dijicuowu_avg = secondLevelScoreService.getAvg(FinalConstant.PROFESSIONAL_SKILL_enum.低级错误.toString(), overallId);
		shejihegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.设计规定.toString(), overallId);
		liuchenghegui_avg = secondLevelScoreService.getAvg(FinalConstant.COMPLIANCE_enum.流程规定.toString(), overallId);
		gongzuojijixing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作积极性.toString(), overallId);
		gongtongnengli_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.沟通能力.toString(), overallId);
		gongzuojihuaxing_avg = secondLevelScoreService.getAvg(FinalConstant.COMMUNICATION_MANAGEMENT_enum.工作计划性.toString(), overallId);
		xuexijijixing_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.学习积极性.toString(), overallId);
		kaoshi_avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.考试.toString(), overallId);
		zhuanli_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.专利.toString(), overallId);
		jingyanku_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.经验库.toString(), overallId);
		biaozhunhua_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.标准化.toString(), overallId);
		zhongyaoxinxishouji_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.重要信息收集.toString(), overallId);
		qita_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.其他.toString(), overallId);
		xiangmuwendang_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.项目文档.toString(), overallId);
		peixun_avg = secondLevelScoreService.getAvg(FinalConstant.CONTRIBUTION_TO_COMPANY_enum.培训.toString(), overallId);
		
		secondlevelscores = secondLevelScoreService.getSecondlevelscoresByOverallIdAndEmployeeId(result.getEmployee().getId(), overallId);
		
		
		return "result";
	}
	
}
