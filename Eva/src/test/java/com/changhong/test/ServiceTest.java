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

import com.changhong.dao.EmployeeDao;
import com.changhong.dao.ProblemDao;
import com.changhong.dao.ProjectReviewDao;
import com.changhong.dao.ResultDao;
import com.changhong.dao.StructureProblemDao;
import com.changhong.dao.TrainDao;
import com.changhong.entities.Comment;
import com.changhong.entities.Employeeexamr;
import com.changhong.entities.Employeetrainr;
import com.changhong.entities.Problem;
import com.changhong.entities.Result;
import com.changhong.entities.Secondweight;
import com.changhong.entities.Structureproblem;
import com.changhong.service.CommentService;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.ProblemService;
import com.changhong.service.SecondWeightService;
import com.changhong.support.FinalConstant;

public class ServiceTest {

	private static ApplicationContext applicationContext;
	@BeforeClass
	public static void setUpBeforeClass() throws Exception {
		applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
	}
	
	@Test
	public void test() throws ParseException {
	
		
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date startDate = format.parse("2016-01-01");
	    Date endDate = format.parse("2016-12-31");
	  /*  
	    EmployeeExamService employeeExamService = (EmployeeExamService) applicationContext.getBean("employeeExamService");
	    Employeeexamr eer = employeeExamService.getEmployeeexamrByEmployeeIdAndExamId(1, "2");
	    
	    System.out.println("eer = "+eer);*/
	    
	    EmployeeDao employeeDao = (EmployeeDao) applicationContext.getBean("employeeDao");
	    boolean is =  employeeDao.isExist("12138029");
	    System.out.println("is="+is);
	    /*TrainDao trainDao = (TrainDao) applicationContext.getBean("trainDao");
	    
	    List<Employeetrainr> list = trainDao.getTrainsByEmployeeIdAndDate("20155708", startDate, endDate);
	    System.out.println(list.size());*/
	    
	    
	     
	    /* SecondWeightService secondWeightService = (SecondWeightService) applicationContext.getBean("secondWeightService");
	     Secondweight secondweight_shejiguiding = secondWeightService.getSecondweightByModeIdAndType(1, FinalConstant.COMPLIANCE_enum.设计规定.toString());
	     System.out.println(secondweight_shejiguiding.getWeightly());*/
	   /*  
	     CommentService commentService = (CommentService) applicationContext.getBean("commentService");
	     
	     List<Comment> comments = commentService.findAll();
	     for (int i = 0; i < comments.size(); i++) {
			for (int j = 0; j < problems.size(); j++) {
				if (problems.get(j).getComment()!=null) {
					if (comments.get(i).getId().equals(problems.get(j).getComment().getId())) {
						Comment comment = comments.get(i);
						comment.setEmployeeId(problems.get(j).getEmployee().getId());
						commentService.updateEntity(comment);
						System.out.println("更新");
					}
				}
				
			}
		}*/
			
	}

}
