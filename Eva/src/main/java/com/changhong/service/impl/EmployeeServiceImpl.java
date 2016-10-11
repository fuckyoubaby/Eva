package com.changhong.service.impl;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.druid.filter.AutoLoad;
import com.changhong.dao.DepartmentDao;
import com.changhong.dao.EmployeeDao;
import com.changhong.dao.JobDao;
import com.changhong.entities.Department;
import com.changhong.entities.Employee;
import com.changhong.entities.Job;
import com.changhong.service.EmployeeService;
import com.changhong.support.employee.EmployeeModel;
import com.changhong.support.employee.EmployeeTemplate;
import com.changhong.support.result.BatchResultTemplate;
import com.changhong.util.Params;
import com.utility.reflect.ReflectUtil;

@Service("employeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	private EmployeeDao employeeDao;
	@Autowired
	private JobDao jobDao;
	
	@Autowired
	private DepartmentDao departmentDao;
	
	@Override
	public boolean isExist(String userName) {
		// TODO Auto-generated method stub
		return employeeDao.isExist(userName);
	}

	@Override
	public Employee login(String userName, String password) {
		// TODO Auto-generated method stub
		return employeeDao.login(userName, password);
	}

	@Override
	public List<Integer> getAllNum(int type, String employeeId) {
		// TODO Auto-generated method stub
		return employeeDao.getAllNum(type, employeeId);
	}

	@Override
	public List<Employee> getAllEmployees() {
		// TODO Auto-generated method stub
		return employeeDao.findAll(Employee.class);
	}

	@Override
	public Employee getEmployee(String employeeId) {
		// TODO Auto-generated method stub
		return employeeDao.get(Employee.class, employeeId);
	}

	@Override
	public List<Employee> getEmployeesByPage(int offset, int length,
			String keyword) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeesByPage(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return employeeDao.getCount(keyword);
	}

	@Override
	public void update(Employee employee) {
		employeeDao.update(employee);
	}

	@Override
	public void delete(Employee employee) {
		employeeDao.delete(employee);
	}

	@Override
	public void save(Employee employee) {
		employeeDao.save(employee);
	}

	@Override
	public List<Employee> getEmployeesByPage(Params params) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeesByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return employeeDao.getCount(params);
	}

	@Override
	public List<Employee> getEmployeesByJobId(int jobId) {
		// TODO Auto-generated method stub
		return employeeDao.getEmployeesByJobId(jobId);
	}

	@Override
	public BatchResultTemplate save(List<Employee> employeeLists) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(employeeLists==null | employeeLists.size()<1){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		
		employeeLists = cleanBlank(employeeLists);
		brt.setTotalRecodes(employeeLists.size());
		int repeatCount = 0;
		for(int i=employeeLists.size()-1;i>=0;i--){
			Employee e = employeeLists.get(i);
			if(employeeDao.isExist(e.getId().trim())){
				employeeLists.remove(i);
				repeatCount++;
			}
		}
		brt.setRepeatRecodes(repeatCount);
		brt.setImportRecodes(employeeDao.save(employeeLists));
		return brt;
	}

	
	private List<Employee> cleanBlank(List<Employee> lists){
		
		for(int i= lists.size()-1;i>=0;i--){
			Employee e = lists.get(i);
			if(StringUtils.isBlank(e.getId())){
				lists.remove(i);
			}
		}
		return lists;
	}

	@Override
	public BatchResultTemplate saveTemplate(
			List<EmployeeModel> templateLists) {
		BatchResultTemplate brt = new BatchResultTemplate();
		if(templateLists==null | templateLists.size()<1){
			brt.setImportRecodes(0);
			brt.setRepeatRecodes(0);
			brt.setTotalRecodes(0);
			return brt;
		}
		
		Map<String , Job> jobMaps =parseJobMaps(jobDao.findAll(Job.class));
		Map<String, Department> departmentMaps = parseDepartmentMaps(departmentDao.findAll(Department.class));
		
		List<Employee> eLists = null;
		try{
			eLists = parse2Employee(templateLists, jobMaps, departmentMaps); 
		}catch(Exception e){
			e.printStackTrace();
			return save(eLists);
		}
		
		return save(eLists);
	}

	
	
	/**
	 * 将读取到的模板转换成实体类对象
	 * @param templateLists 模板对象链表
	 * @param jobMaps 工作岗位Map对照
	 * @param departmentMaps 
	 * @return
	 * @throws Exception
	 */
	private List<Employee> parse2Employee(List<EmployeeModel> templateLists, Map<String, Job> jobMaps, Map<String, Department> departmentMaps)
		throws Exception{
		
		List<Employee> eLists = new ArrayList<Employee>();
		for(int i=0; i<templateLists.size();i++){
			EmployeeModel em = templateLists.get(i);
			
			Job job = null;
			Department department = null;
			
			String emJob = em.getJob();
			String emDepartment = em.getDepartment();
			emJob = StringUtils.isBlank(emJob)?emJob:emJob.trim();
			emDepartment = StringUtils.isBlank(emDepartment)?emDepartment:emDepartment.trim();
			
			if(jobMaps.containsKey(emJob)){
				job = jobMaps.get(emJob);
			}
			if(departmentMaps.containsKey(emDepartment)){
				department = departmentMaps.get(emDepartment);
			}
			
			Employee e = template2target(em, job, department);
			necessaryInit(e, true);
			eLists.add(e);
		}
		return eLists;
	}
	
	/**
	 * List转Map
	 * @param jobs 工作岗位链表对象
	 * @return
	 */
	private Map<String, Job> parseJobMaps(List<Job> jobs){
		Map<String, Job> jobMaps = new HashedMap();
		for(int i=0; i<jobs.size();i++){
			jobMaps.put(jobs.get(i).getJobName(), jobs.get(i));
		}
		return jobMaps;
	}
	
	/**
	 * List转Map
	 * @param departments 部门链表对象
	 * @return
	 */
	private Map<String, Department> parseDepartmentMaps(List<Department> departments){
		Map<String, Department> departmentMaps = new HashedMap();
		for(int i=0; i<departments.size();i++){
			departmentMaps.put(departments.get(i).getDepartmentName(), departments.get(i));
		}
		return departmentMaps;
	}
	
	/**
	 * 读取模板对象转换成实体类对象
	 * @param et 模板对象
	 * @param job 工作岗位对象
	 * @param department 部门对象
	 * @return
	 * @throws Exception
	 */
	private Employee template2target(EmployeeModel et, Job job, Department department) throws Exception{
		Field[] fields = et.getClass().getDeclaredFields();
		Employee e = new Employee();
		for (int i = 0; i < fields.length; i++) {
			String fieldName = fields[i].getName();
			if(fieldName.equals("department")){
				e.setDepartment(department);;
				continue;	
			} 
			if(fieldName.equals("job")){
				e.setJob(job); 
				continue;
			}
			ReflectUtil.invokeSetter(e, fieldName, ReflectUtil.invokeGetter(et, fieldName));
		}
		return e;
	}
	
	/**
	 * 初始化权限和密码
	 * @param e
	 * @param setPassword
	 */
	private void necessaryInit(Employee e, boolean setPassword){
		e.setPermission(1);
		String id = e.getId();
		if(setPassword){
			String currentId = id.length()<4?"1234":
				id.substring(id.length()-4);	
			e.setPassword(currentId);
		}
	}

	

}
