package com.changhong.test.dao;

import java.util.Date;
import java.util.List;

import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.dao.ProblemDao;
import com.changhong.entities.Problem;
import com.changhong.util.Params;
import com.utility.date.DateUtils;

public class ProblemDaoTest extends BaseDaoTest{
	
	@Autowired
	private ProblemDao problemDao;
	

	@Ignore
	public void testGetProblemsByCommentId(){
		String commentId = "40288ae657bd64b30157bd6e05770001";
		
		Params params = new Params(0, 0, 10, null, null, null);
		List <Problem> problemLists = problemDao.getProblemsByCommentId(params, commentId);
		Assert.assertNotNull("问题列表不为空", problemLists);
		
		int counts = problemDao.getProblemsCountByCommentId(params, commentId);
		Assert.assertTrue(counts>0);
	}
	@Test
	public void testGetCommentAmount(){
		String employeeId="20158935";
		Date startDate =  DateUtils.parse("2016-10-01", "yyyy-MM-dd");
		Date endDate =DateUtils.parse("2016-11-02", "yyyy-MM-dd");
		System.out.println(endDate);
		int amount = problemDao.getCommentAmountByEmployeeId(employeeId, startDate, endDate);
		System.out.println("amount=="+amount);
		Assert.assertTrue(amount>0);


	}
}
