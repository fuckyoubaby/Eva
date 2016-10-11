package com.changhong.support.employee;

import java.io.File;
import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

//import org.hibernate.annotations.common.reflection.ReflectionUtil;
//测试一下
import com.changhong.entities.Department;
import com.changhong.entities.Employee;
import com.changhong.entities.Job;
import com.utility.excel.ExcelHelper;
import com.utility.excel.FileNameUtil;
import com.utility.excel.HssfExcelHelper;
import com.utility.excel.XssfExcelHelper;
import com.utility.reflect.ReflectUtil;

/**
 * Excel文件转换
 * @author cheeger
 * @param <T>
 *
 */
public class Template2Employee<T> {
	
	private String objectFieldName[]={"department","job"};
	
	private Map<String, Job> jobMaps;
	private Map<String, Department> departmentMaps;
	
	public List<EmployeeTemplate> parseObj4Excel(String filePath) throws Exception{
		File file = new File(filePath);
		String suffix = FileNameUtil.getFullPathSuffix(filePath.trim());
		ExcelHelper eh = null;
		if(suffix.equals("xls")){
			eh = HssfExcelHelper.getInstance(file);
		}else if (suffix.equals("xlsx")){
			eh = XssfExcelHelper.getInstance(file);
		}
		
		String[] fieldNames =new String[]{"id","name"};
		List<EmployeeTemplate> lists = null;
		try {
			lists = eh.readExcel(EmployeeTemplate.class, fieldNames, 0, 2, 1);
			//System.out.println("EmployeeModel size: "+lists.size());
			for(EmployeeTemplate em:lists){
				//System.out.println(em);
			}
			return lists;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	public List<T> parseObj4Excel(String filePath, Class<T> clzz) throws Exception{
		File file = new File(filePath);
		String suffix = FileNameUtil.getFullPathSuffix(filePath.trim());
		ExcelHelper eh = null;
		if(suffix.equals("xls")){
			eh = HssfExcelHelper.getInstance(file);
		}else if (suffix.equals("xlsx")){
			eh = XssfExcelHelper.getInstance(file);
		}
		
		String[] fieldNames =this.getField4Class(clzz);
		List<T> lists = null;
		try {
			lists = eh.readExcel(clzz, fieldNames, 0, 2, 1);
			return lists;
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
	}
	
	private String[] getField4Class(Class<T> clazz){
		Field [] fields = clazz.getDeclaredFields();
		String [] fieldNames = new String[fields.length];
		for(int i=0;i<fields.length;i++){
			fieldNames[i] = fields[i].getName();
		}
		return fieldNames;
	}
	
	public List<Employee> template2Employee(List<T> lists) throws Exception{
		List<Employee> eLists = new ArrayList<Employee>();
		for(int i=0;i<lists.size();i++){
			Employee e;
			try {
				e = parseEmloyee(lists.get(i));
			} catch (Exception e1) {
				e1.printStackTrace();
				throw e1;
			} 
			necessaryInit(e, true);
			eLists.add(e);
		}
		return eLists;
	}
	
	
	/**
	 * 强制转换
	 * @param target
	 * 			目标对象
	 * @return
	 * 			转换后的对象
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	public <T> Employee parseEmloyee(T target) throws NoSuchFieldException, SecurityException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		Field[] fields = target.getClass().getDeclaredFields();
		Employee e = new Employee();
		for (int i = 0; i < fields.length; i++) {
			String fieldName = fields[i].getName();
			if(fieldName.equals("department")) continue;
			if(fieldName.equals("job")) continue;
			ReflectUtil.invokeSetter(e, fieldName, ReflectUtil.invokeGetter(target, fieldName));
		}
		return e;
	}
	/**
	 * 强制转换
	 * @param target
	 * 			原始对象
	 * @param fieldsMaps
	 * 			属性映射关系
	 * @return
	 * @throws NoSuchFieldException
	 * @throws SecurityException
	 * @throws NoSuchMethodException
	 * @throws IllegalAccessException
	 * @throws IllegalArgumentException
	 * @throws InvocationTargetException
	 */
	public <T> Employee parseEmloyee(T target, Map<String,String> fieldsMaps) throws NoSuchFieldException, SecurityException, NoSuchMethodException, IllegalAccessException, IllegalArgumentException, InvocationTargetException{
		Field[] fields = target.getClass().getDeclaredFields();
		Employee e = new Employee();
		for (int i = 0; i < fields.length; i++) {
			String fieldName = fields[i].getName();
			String fieldMapName = fieldsMaps.get(fieldName);
			ReflectUtil.invokeSetter(e, fieldMapName, ReflectUtil.invokeGetter(target, fieldName));
		}
		return e;
	}
	
	public void necessaryInit(Employee e, boolean setPassword){
		e.setPermission(1);
		String id = e.getId();
		if(setPassword){
			String currentId = id.length()<4?"1234":
				id.substring(id.length()-4);	
			e.setPassword(currentId);
		}
	}
	
	public static void main(String[] args) {
		Template2Employee<EmployeeTemplate> t2e = new Template2Employee<EmployeeTemplate>();
//		EmployeeTemplate et = new EmployeeTemplate();
//		et.setId("1234456");
//		et.setName("guoxx");
//		try {
//			Employee e = t2e.parseEmloyee(et);
//			System.out.println("[Employee] id="+e.getId()+", name="+e.getName());
//			t2e.necessaryInit(e, true);
//			System.out.println("[Employee] id="+e.getId()+", name="+e.getName()+", permission="+
//			e.getPermission()+", password="+e.getPassword());
//		}catch (Exception e){
//			e.printStackTrace();
//		}
		String filePath="C:\\Users\\cheeger\\Desktop\\硬件研发部人员名单-测试.xlsx";
		try {
			List<EmployeeTemplate> eLists = t2e.parseObj4Excel(filePath, EmployeeTemplate.class);
			//System.out.println("[Template2Employee:main]--eLists.size="+eLists.size());
			List<Employee> employeeLists = t2e.template2Employee(eLists);
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	public Map<String, Job> getJobMaps() {
		return jobMaps;
	}

	public void setJobMaps(Map<String, Job> jobMaps) {
		this.jobMaps = jobMaps;
	}

	public Map<String, Department> getDepartmentMaps() {
		return departmentMaps;
	}

	public void setDepartmentMaps(Map<String, Department> departmentMaps) {
		this.departmentMaps = departmentMaps;
	}
	
}
