package com.changhong.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.aspectj.util.FileUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Classify;
import com.changhong.entities.DataDirt;
import com.changhong.entities.Employee;
import com.changhong.entities.Experience;
import com.changhong.service.ClassifyService;
import com.changhong.service.DataDirtService;
import com.changhong.service.ExperienceService;
import com.changhong.util.ExpParams;
import com.changhong.util.Params;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.util.ResolverUtil.NameEndsWith;

@Action("experienceAction")
@Results({
	@Result(name="experiencesPage",location="/adminEnter/experienceBase/experienceTemplate.jsp"),
	@Result(name="experience",location="/adminEnter/experienceBase/experience_info.jsp"),
	@Result(name="delete",location="/adminEnter/experienceBase/experience_index.jsp"),
	@Result(name="experienceForEvaluate",location="/adminEnter/experienceBase/experience_grade.jsp"),
	//@Result(name="update",location="/experienceAction!getAllNum.action", type="chain"),
	@Result(name="update",location="/adminEnter/experienceBase/success.jsp"),
	@Result(name="allNum",location="/adminEnter/experienceBase/experience_index.jsp"),
	@Result(name="experienceForUpdate",location="/adminEnter/experienceBase/exp_update.jsp"),
	
	
	@Result(name="employeeGetByPage",location="/userEnter/experienceBase/experienceTemplate.jsp"),
	@Result(name="experienceForUser",location="/userEnter/experienceBase/experience_info.jsp"),
	@Result(name="experienceForUserForUpdate",location="/userEnter/experienceBase/exp_update.jsp"),
	@Result(name="forAddExp",location="/userEnter/experienceBase/exp_add.jsp"),
	@Result(name="save",location="/userEnter/experienceBase/expBase_index.jsp")
})
public class ExperienceAction {

	private static final Logger log = LoggerFactory.getLogger(ExperienceAction.class);
	@Autowired
	private ExperienceService experienceService;
	@Autowired
	private ClassifyService classifyService;
	@Autowired
	private DataDirtService dataDirtService;
	
	private List<Integer> list;
	private int hasnot;
	private int finished;
	private int all;
	
	
	private int pageNo;
	private int pageSize;
	private String keyword;
	private int itemcount;
	private String state;
	private String orderName;
	private String orderType;
	
	private List<Experience> experiences;
	private int experienceId;
	private Experience experience;
	
	private int score;
	private String chkName;
	
	private String experienceName;
	private String country;
	private String area;
	private int experienceClassify;
	private String main_word;
	private String expAbstruct;
	private String fileurl;
	private List<Classify> classifies;
	
	private List<DataDirt> dataDirts;
	private String dataDirtPId;
	private String dataDirtNId;
	private int type;
	private String mainChip;
	
	private DataDirt dataDirt;
	
	
	
	 //注意，file并不是指前端jsp上传过来的文件本身，而是文件上传过来存放在临时文件夹下面的文件
    private File file;
    
    //提交过来的file的名字
    private String fileFileName;
    
    //提交过来的file的MIME类型
    private String fileContentType;
	
	
	
	public String getMainChip() {
		return mainChip;
	}
	public void setMainChip(String mainChip) {
		this.mainChip = mainChip;
	}
	public File getFile() {
		return file;
	}
	public void setFile(File file) {
		this.file = file;
	}
	public String getFileFileName() {
		return fileFileName;
	}
	public void setFileFileName(String fileFileName) {
		this.fileFileName = fileFileName;
	}
	public String getFileContentType() {
		return fileContentType;
	}
	public void setFileContentType(String fileContentType) {
		this.fileContentType = fileContentType;
	}
	public DataDirt getDataDirt() {
		return dataDirt;
	}
	public void setDataDirt(DataDirt dataDirt) {
		this.dataDirt = dataDirt;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	
	public String getDataDirtPId() {
		return dataDirtPId;
	}
	public void setDataDirtPId(String dataDirtPId) {
		this.dataDirtPId = dataDirtPId;
	}
	public String getDataDirtNId() {
		return dataDirtNId;
	}
	public void setDataDirtNId(String dataDirtNId) {
		this.dataDirtNId = dataDirtNId;
	}
	public List<DataDirt> getDataDirts() {
		return dataDirts;
	}
	public void setDataDirts(List<DataDirt> dataDirts) {
		this.dataDirts = dataDirts;
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
	public String getExperienceName() {
		return experienceName;
	}
	public void setExperienceName(String experienceName) {
		this.experienceName = experienceName;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getArea() {
		return area;
	}
	public void setArea(String area) {
		this.area = area;
	}
	public int getExperienceClassify() {
		return experienceClassify;
	}
	public void setExperienceClassify(int experienceClassify) {
		this.experienceClassify = experienceClassify;
	}
	public String getMain_word() {
		return main_word;
	}
	public void setMain_word(String main_word) {
		this.main_word = main_word;
	}
	public String getExpAbstruct() {
		return expAbstruct;
	}
	public void setExpAbstruct(String expAbstruct) {
		this.expAbstruct = expAbstruct;
	}
	public String getFileurl() {
		return fileurl;
	}
	public void setFileurl(String fileurl) {
		this.fileurl = fileurl;
	}
	public List<Classify> getClassifies() {
		return classifies;
	}
	public void setClassifies(List<Classify> classifies) {
		this.classifies = classifies;
	}
	public String getChkName() {
		return chkName;
	}
	public void setChkName(String chkName) {
		this.chkName = chkName;
	}
	public int getHasnot() {
		return hasnot;
	}
	public void setHasnot(int hasnot) {
		this.hasnot = hasnot;
	}
	public int getFinished() {
		return finished;
	}
	public void setFinished(int finished) {
		this.finished = finished;
	}
	public int getAll() {
		return all;
	}
	public void setAll(int all) {
		this.all = all;
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
	
	public List<Experience> getExperiences() {
		return experiences;
	}
	public void setExperiences(List<Experience> experiences) {
		this.experiences = experiences;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getExperienceId() {
		return experienceId;
	}
	public void setExperienceId(int experienceId) {
		this.experienceId = experienceId;
	}
	public Experience getExperience() {
		return experience;
	}
	public void setExperience(Experience experience) {
		this.experience = experience;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public List<Integer> getList() {
		return list;
	}
	public void setList(List<Integer> list) {
		this.list = list;
	}
	public String getExperiencesByPage()
	{
		ExpParams params = new ExpParams(0, pageNo, pageSize, keyword, orderName, orderType);
		log.info("dataDirtPId=="+dataDirtPId+",dataDirtNId=="+dataDirtNId);
		if(StringUtils.isBlank(dataDirtPId)){
			params.setDirctId(-1);
		}else{
			int pId = Integer.parseInt(dataDirtPId);
			int nId = Integer.parseInt(dataDirtNId);
			if(pId==-1){
				params.setDirctId(-1);
			}else{
				if(nId!=-1){
					params.setDirctId(nId);
				}else params.setDirctId(pId);
			}
		}
		String expState="";
		if(StringUtils.isNotBlank(state)){
			expState = state.equals("all")?"":(state.equals("not")?"未处理":"已处理");
		}else expState = null;
		params.setState(expState);
		
		experiences = experienceService.getExperiencesByPage(params);
		itemcount = experienceService.getCount(params);
		
		return "experiencesPage";
	}
	public String getExperienceById()
	{
		experience = experienceService.getExperience(experienceId);
		String []fileString = experience.getExUrl().split("\\\\");
		setFileFileName(fileString[fileString.length-1]);
		return "experience";
	}
	public String getExperienceByIdForUpdate()
	{
		ActionContext context = ActionContext.getContext();
		experience = experienceService.getExperience(experienceId);
		int pid=0;
		if (experience!=null) {
			if (experience.getDataDirt()!=null) {
				pid = experience.getDataDirt().getpId();
			}
		}
		
		dataDirt = dataDirtService.getNode(pid);
		dataDirts = dataDirtService.getDataDirtsByPID(1);
		context.getSession().put("experience", experience);
		return "experienceForUpdate";
	}
	
	
	public String getDataDirtByPId()
	{
		List<DataDirt> dataDirts = dataDirtService.getDataDirtsByPID(Integer.parseInt(dataDirtPId));
		
		JSONArray jsonArray = new JSONArray();
		for (int i = 0; i < dataDirts.size(); i++) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("nId", dataDirts.get(i).getnId());
			jsonObject.put("name", dataDirts.get(i).getName());
			jsonArray.add(jsonObject);
		}
		
		 HttpServletResponse response = ServletActionContext.getResponse();
		 response.setContentType("application/json");  
         response.setCharacterEncoding("UTF-8");
         PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
         out.print(jsonArray.toString());
         out.flush();
         out.close();
		return "experience";
	}
	
	public String delete()
	{
		Experience experience = new Experience();
		experience = experienceService.getExperience(experienceId);
		experienceService.delete(experience);
		return "delete";
	}
	public String muldelete()
	{
		if (chkName!=null&&!chkName.equals("")) {
			String[] strA=chkName.split(",");
			Experience experience = new Experience();
			for (int i = 0; i < strA.length; i++) {
				experience = experienceService.getExperience(Integer.parseInt(strA[i].trim()));
				experienceService.delete(experience);
			}
			list = experienceService.getAllNum();
			if (list.size()>=3) {
				all = list.get(0);
				finished = list.get(1);
				hasnot = list.get(2);
			}
		}
		
		return "delete";
	}
	public String getExperienceForEvaluate()
	{
		ActionContext context = ActionContext.getContext();
		experience = experienceService.getExperience(experienceId);
		context.getSession().put("experience", experience);
		return "experienceForEvaluate";
	}
	public String update()
	{
		ActionContext context = ActionContext.getContext();
		Experience experience  = (Experience) context.getSession().get("experience");
		experience.setScore(score);
		experience.setExState("已处理");
		experienceService.update(experience);
		return "update";
	}
	public String getAllNum()
	{
		list = experienceService.getAllNum();
		if (list.size()>=3) {
			all = list.get(0);
			finished = list.get(1);
			hasnot = list.get(2);
		}
		dataDirts = dataDirtService.getDataDirtsByPID(1);
		return "allNum";
	}
	public String updateExperience()
	{
		ActionContext context = ActionContext.getContext();
		Experience experience = (Experience) context.getSession().get("experience");
		Employee employee = (Employee) context.getSession().get("employee");
		Classify classify = classifyService.getClassify(experienceClassify);
		if (fileFileName!=null) {
			String directory = "/upload/experience";        //一个安全的目录
	        String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);
	        File target = new File(targetDirectory,fileFileName);
	        File oldTarget = new File(experience.getExUrl());
	        if(oldTarget.exists()){
	        	oldTarget.delete();
	        }try {
				FileUtil.copyFile(file, target);
				//System.out.println("文件上传成功"+targetDirectory);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        experience.setExUrl(""+target);
		}
		System.gc();
		experience.setAbstract_(expAbstruct);
		experience.setArea(area);
		experience.setCounty(country);
		experience.setClassify(classify);
		experience.setEmployee(employee);
		experience.setExperienceName(experienceName);
		Date date = new Date();
		experience.setExTime(date);
		//experience.setExUrl(fileurl);
		
		experience.setKeyword(main_word);
		DataDirt dataDirt = dataDirtService.getNode(Integer.parseInt(dataDirtNId));
		experience.setDataDirt(dataDirt);
		experienceService.update(experience);
		
		return "update";
		
	}
	//用户端用到的方法
	
	public String employeeGetByPage()
	{
		experiences = experienceService.getExperiencesByPage(pageNo, pageSize, keyword);
		itemcount = experienceService.getCount(keyword);
		return "employeeGetByPage";
	}
	
	public String getExperienceByIdForUser()
	{
		ActionContext context = ActionContext.getContext();
		
		experience = experienceService.getExperience(experienceId);
		context.getSession().put("experience_employeeId", experience.getEmployee().getId());
		String []fileString = experience.getExUrl().split("\\\\");
		setFileFileName(fileString[fileString.length-1]);
		return "experienceForUser";
	}

	public String getExperienceByIdForUserForUpdate()
	{
		ActionContext context = ActionContext.getContext();
		experience = experienceService.getExperience(experienceId);
		context.getSession().put("experience", experience);
		classifies = classifyService.getAll();
		return "experienceForUserForUpdate";
	}
	public String updateForUser()
	{
		ActionContext context = ActionContext.getContext();
		Experience experience = (Experience) context.getSession().get("experience");
		Employee employee = (Employee) context.getSession().get("employee");
		Classify classify = classifyService.getClassify(experienceClassify);
		experience.setAbstract_(expAbstruct);
		experience.setArea(area);
		experience.setClassify(classify);
		experience.setEmployee(employee);
		experience.setExperienceName(experienceName);
		experience.setExState("未处理");
		Date date = new Date();
		experience.setExTime(date);
		experience.setExUrl(fileurl);
		experience.setKeyword(main_word);
		DataDirt dataDirt;
        if (Integer.parseInt(dataDirtNId)<=0) {
        	dataDirt = dataDirtService.getNode(Integer.parseInt(dataDirtPId));
		}else {
			dataDirt = dataDirtService.getNode(Integer.parseInt(dataDirtNId));
		}
        experience.setDataDirt(dataDirt);
		
		experienceService.update(experience);
		
		return "updateForUser";
	}
	
	public String forAddExp()
	{
		dataDirts = dataDirtService.getDataDirtsByPID(1);
		return "forAddExp";
	}
	public String save() throws IOException
	{
		ActionContext context = ActionContext.getContext();
		Experience experience = new Experience();
		Employee employee = (Employee) context.getSession().get("employee");
		String directory = "/upload/experience";        //一个安全的目录
		String targetDirectory = ServletActionContext.getServletContext().getRealPath(directory);
        File target = new File(targetDirectory,fileFileName);
		
		log.info("fileFileName="+fileFileName);
       // File target = new File(targetDirectory,fileFileName);
        if(target.exists()){
        	target.delete();
        }try {
			FileUtil.copyFile(file, target);
			//System.out.println("文件上传成功");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        DataDirt dataDirt;
        if (Integer.parseInt(dataDirtNId)<=0) {
        	dataDirt = dataDirtService.getNode(Integer.parseInt(dataDirtPId));
		}else {
			dataDirt = dataDirtService.getNode(Integer.parseInt(dataDirtNId));
		}
        experience.setDataDirt(dataDirt);
        experience.setAbstract_(expAbstruct);
        experience.setCounty(country);
		experience.setArea(area);
		experience.setEmployee(employee);
		experience.setExperienceName(experienceName);
		experience.setExState("未处理");
		Date date = new Date();
		experience.setExTime(date);
		
		experience.setKeyword(main_word);
        experience.setExUrl(""+target);
        experience.setMainChip(mainChip);
		experienceService.save(experience);
		return "save";
	}
}
