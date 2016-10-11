package com.changhong.test;

import static org.junit.Assert.*;

import java.util.List;

import org.junit.BeforeClass;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.changhong.dao.ResultDao;
import com.changhong.entities.Result;

public class ServiceTest {

	private static ApplicationContext applicationContext;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	@Test
	public void test() {
		ResultDao resultDao = (ResultDao) applicationContext.getBean("resultDao");
		List<Result> results = resultDao.getResultsByEmployeeIdAndDate("20158935");
		System.out.println(results.get(0).getEmployee().getName());
	}

}
