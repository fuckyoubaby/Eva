package com.changhong.service.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.EmployeeDao;
import com.changhong.dao.EmployeeExamDao;
import com.changhong.dao.ExamDao;
import com.changhong.entities.Employee;
import com.changhong.entities.Employeeexamr;
import com.changhong.entities.Exam;
import com.changhong.service.EmployeeExamService;
import com.changhong.support.exam.ExamScoreModel;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;
import com.utility.reflect.ReflectUtil;

@Service("employeeExamService")
public class EmployeeExamServiceImpl implements EmployeeExamService{

	@Autowired
	private EmployeeExamDao employeeExamDao;
	@Autowired
	private ExamDao examDao;
	@Autowired
	private EmployeeDao employeeDao;
	
	@Override
	public List<Employeeexamr> getMin(int examId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getMin(examId);
	}

	@Override
	public List<Employeeexamr> getMax(int examId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getMax(examId);
	}

	@Override
	public double getAvg(int examId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getAvg(examId);
	}

	@Override
	public void save(Employeeexamr employeeexamr) {
		employeeExamDao.save(employeeexamr);
	}

	@Override
	public void delete(Employeeexamr employeeexamr) {
		employeeExamDao.delete(employeeexamr);
	}

	@Override
	public void update(Employeeexamr employeeexamr) {
		employeeExamDao.update(employeeexamr);
	}

	@Override
	public List<Employeeexamr> getEmployeeexamrsByPages(int offset, int length,
			String keyword,int examId,Params params) {
		
		return employeeExamDao.getEmployeeexamrsByPage(offset, length, keyword, examId, params);
	}

	@Override
	public int getCount(String keyword,int examId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getCount(keyword,examId);
	}

	@Override
	public Employeeexamr getEmployeeexamrById(int employeeExamId) {
		// TODO Auto-generated method stub
		return employeeExamDao.get(Employeeexamr.class, employeeExamId);
	}

	@Override
	public List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(int offset,
			int length, String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getEmployeeexamrsByPageAndEmployeeId(offset, length, keyword, employeeId);
	}

	@Override
	public int getCountForEmployee(String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getCount(keyword, employeeId);
	}

	@Override
	public Employeeexamr getEmployeeexamrByEmployeeIdAndExamId(int examId,
			String employeeId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getEmployeeexamrByEmployeeIdAndExamId(examId, employeeId);
	}

	@Override
	public List<Employeeexamr> getEmployeeexamrsByPageAndEmployeeId(
			Params params, String employeeId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getEmployeeexamrsByPageAndEmployeeId(params, employeeId);
	}

	@Override
	public int getCountForEmployee(Params params, String employeeId) {
		// TODO Auto-generated method stub
		return employeeExamDao.getCount(params, employeeId);
	}

	@Override
	public BatchResultTemplate saveTemplate(List<Employeeexamr> employeeExamrLists) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(employeeExamrLists == null | 1>employeeExamrLists.size()){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		//TODO 清空无法识别的，主要数据
		brt.setTotalRecodes(employeeExamrLists.size());
		int repeatCount = 0;
		for(int i=employeeExamrLists.size()-1;i>=0;i--){
			Employeeexamr eer = employeeExamrLists.get(i);
			long amount = employeeExamDao.getExisitCount(eer.getExam().getExamId(), eer.getEmployee().getId());
			if(amount>0){ 
				employeeExamrLists.remove(i);
				repeatCount++;
			}
		}
		brt.setRepeatRecodes(repeatCount);
		brt.setImportRecodes(employeeExamDao.save(employeeExamrLists));
		
		return brt;
	}



	@Override
	public BatchResultTemplate saveTemplate(List<ExamScoreModel> templateLists, int examId) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(templateLists==null ){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		//清空无效数据
		templateLists = cleanBadData(templateLists);
		if(templateLists.size()<1){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		Map<String, Employee> employeeMaps = parseEmployeeMaps(employeeDao.findAll(Employee.class));
		Exam exam = examDao.get(Exam.class, examId);
		List<Employeeexamr> eLists = null;
		try{
			eLists = parse2Exampleeexamr(templateLists, employeeMaps, exam);
		}catch(Exception e){
			e.printStackTrace();
			return saveTemplate(eLists);
		}
		return saveTemplate(eLists);
	}



	private List<ExamScoreModel> cleanBadData(List<ExamScoreModel> templateLists) {
		
		for(int i=templateLists.size()-1;i>=0;i--){
			ExamScoreModel esm = templateLists.get(i);
			String email = esm.getEmail();
			Integer score = esm.getScore();
			
			if(StringUtils.isBlank(email)){
				templateLists.remove(i);
				continue;
			}
			if(score==null){
				templateLists.remove(i);
				continue;
			}
		}
		return templateLists;
	}

	public List<Employeeexamr> parse2Exampleeexamr(List<ExamScoreModel> eLists,
			Map<String, Employee> employeeMaps, Exam exam) throws Exception {
		List<Employeeexamr> eeLists = new ArrayList<Employeeexamr>();
		for(int i=0; i<eLists.size();i++){
			ExamScoreModel ee  = eLists.get(i);
			Employee employee = null;
			String email = ee.getEmail();
			email = StringUtils.isBlank(email)?email:email.trim();
			
			if(!employeeMaps.containsKey(email.toLowerCase())){
				continue;
			}
			employee = employeeMaps.get(email);
		
			//TODO Action传回一个Exam对象
			Employeeexamr eer = template2target(ee, employee, exam);
			eeLists.add(eer);
		}
		return eeLists;
	}

	private Employeeexamr template2target(ExamScoreModel ee, Employee employee, Exam exam) throws Exception{
		Field[] fields = ee.getClass().getDeclaredFields();
		Employeeexamr eer = new Employeeexamr();
		for(int i=0;i<fields.length;i++){
			String fieldName = fields[i].getName();
			if(fieldName.equals("name") || fieldName.equals("phone")){ 
				continue;
			}
			if(fieldName.equals("email")){
				ReflectUtil.invokeSetter(eer, "employee", employee);
				continue;
			}
			ReflectUtil.invokeSetter(eer, fieldName, ReflectUtil.invokeGetter(ee, fieldName));
		}
		eer.setExam(exam);
		return eer;
	}

	private Map<Integer, Exam> parseExamMaps(List<Exam> examLists) {
		Map<Integer,Exam> examMaps = new HashMap();
		for(int i=0;i<examLists.size();i++){
			examMaps.put(examLists.get(i).getExamId(), examLists.get(i));
		}
		return examMaps;
	}

	private Map<String, Employee> parseEmployeeMaps(List<Employee> employeeLists) {
		Map<String, Employee> employeeMaps = new HashMap();
		for(int i=0;i<employeeLists.size();i++){
			Employee ee = employeeLists.get(i);
			//TODO 邮箱为空时，跳过该员工
			if(StringUtils.isBlank(ee.getEmail())) continue;
			employeeMaps.put(employeeLists.get(i).getEmail(), employeeLists.get(i));
		}
		return employeeMaps;
	}

	@Override
	public double getAvgByEmployeeId(String employeeId, Date startDate,
			Date endDate) {
		// TODO Auto-generated method stub
		return employeeExamDao.getAvgByEmployeeId(employeeId, startDate, endDate);
	}

	@Override
	public List<Employeeexamr> getExamByEmployeeId(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return employeeExamDao.getListByEmployeeId(employeeId, startDate, endDate);
	}
}
