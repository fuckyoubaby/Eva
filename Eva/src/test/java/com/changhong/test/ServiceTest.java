package com.changhong.test;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changhong.dao.ProblemDao;
import com.changhong.dao.ResultDao;
import com.changhong.entities.Result;

public class ServiceTest {

	private static ApplicationContext applicationContext;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	@Test
	public void test() throws ParseException {
		/*ResultDao resultDao = (ResultDao) applicationContext.getBean("resultDao");
		List<Result> results = resultDao.getResultsByEmployeeIdAndDate("20158935");
		System.out.println(results.get(0).getEmployee().getName());*/
		
		/*SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
	     Date startdate = format.parse("2011-10-10");
	     Date enddate = format.parse("2016-10-10");
		ProblemDao problemDao = (ProblemDao) applicationContext.getBean("problemDao");
		int count = problemDao.getCommentAmountByEmployeeId("20158935", startdate, enddate);
		System.out.println("count = "+count);*/
		
		ResultDao resultDao = (ResultDao) applicationContext.getBean("resultDao");
		resultDao.getResult();
		
	}

}
