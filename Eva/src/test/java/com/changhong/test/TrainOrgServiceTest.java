package com.changhong.test;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changhong.action.ScoreAction;
import com.changhong.dao.ExperienceDao;
import com.changhong.dao.ProjectReviewDao;
import com.changhong.dao.ResultDao;
import com.changhong.entities.Secondlevelscore;
import com.changhong.service.AssistService;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.OrderService;
import com.changhong.service.PatentService;
import com.changhong.service.SecondLevelScoreService;
import com.changhong.service.TrainOrgService;
import com.changhong.support.FinalConstant;
import com.changhong.util.Params;

public class TrainOrgServiceTest {

	private static ApplicationContext applicationContext;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	@Test
	public void test() throws ParseException {
		/*ResultDao resultDao = (ResultDao) applicationContext.getBean("resultDao");
		List<Result> results = resultDao.getResultsByEmployeeIdAndDate("20158935");*/
		
		TrainOrgService trainOrgService = (TrainOrgService) applicationContext.getBean("trainOrgService");
		 Calendar cal = Calendar.getInstance();
	     SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	     Date startdate = format.parse("2011-10-10");
	     Date enddate = format.parse("2016-10-10");
		//System.out.println(trainOrgService.getCount("20158935", startdate, enddate));
		System.out.println(trainOrgService.getTrainorgsByEmployeeId("20158935", startdate, enddate).get(0).getEmployee().getName());
		
		SecondLevelScoreService secondLevelScoreService = (SecondLevelScoreService) applicationContext.getBean("secondLevelScoreService");
		
		double avg = secondLevelScoreService.getAvg(FinalConstant.SELF_GROWTH_enum.学习积极性.toString(), 16);
		System.out.println(avg);
		List<Secondlevelscore> secondlevelscores = secondLevelScoreService.getSecondlevelscoresByOverallIdAndEmployeeId("20158935", 16);
		for (int i = 0; i < secondlevelscores.size(); i++) {
			System.out.println(secondlevelscores.get(i).getSecondLevel()+":"+secondlevelscores.get(i).getScore());
		}
		
		
		
	}

}
