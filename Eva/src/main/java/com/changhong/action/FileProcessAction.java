package com.changhong.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;

import com.changhong.entities.Employee;
import com.changhong.entities.Job;
import com.changhong.entities.Project;
import com.changhong.service.EmployeeExamService;
import com.changhong.service.EmployeeService;
import com.changhong.service.JobService;
import com.changhong.service.ProblemService;
import com.changhong.service.ProjectReviewService;
import com.changhong.support.File2JSON;
import com.changhong.support.FileInfo;
import com.changhong.support.FinalConstant;
import com.changhong.support.employee.EmployeeModel;
import com.changhong.support.employee.EmployeeTemplate;
import com.changhong.support.employee.Template2Employee;
import com.changhong.support.exam.ExamScoreModel;
import com.changhong.support.exam.Template2Employeeexamr;
import com.changhong.support.problem.ProblemModel;
import com.changhong.support.problem.Template2Problem;
import com.changhong.support.projectreview.ProjectReviewInfoModel;
import com.changhong.support.projectreview.ProjectReviewInfoModelUtil;
import com.changhong.support.projectreview.Template2ProjectReview;
import com.changhong.support.result.BatchResultTemplate;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.utility.date.DateUtils;
import com.utility.excel.FileNameUtil;
@ParentPackage("jsonPackage")
@Action("fileUploadAction")
@Scope("prototype")
@Results({
	@Result(name="success",type="json",params={"excludeNullProperties","true","root","result"}),
	@Result(name="filetemplate",location="/adminEnter/ajaxtemplate/savedFilesTemplate.jsp"),
	@Result(name="download",type="stream",params={
			"contentType","application/octet-stream;charset=ISO8859-1",
			"inputName","inputStream",
			"contentDisposition","attachment;fileName=\"${downloadFileName}\"",
			"bufferSize","4096"})
	})
@InterceptorRef(value="mydefault")
public class FileProcessAction extends ActionSupport{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private static final Logger log = Logger.getLogger(FileProcessAction.class);
	
	@Autowired
	private EmployeeService employeeServiceImpl;
	@Autowired
	private EmployeeExamService employeeExamServiceImpl;
	@Autowired
	private ProblemService problemServiceImpl;
	@Autowired
	private ProjectReviewService projectReviewServiceImpl;
//	@Autowired
//	private DepartmentService departmentServiceImpl;
	
	/**
	 * 用来封装上传文件的,多文件上传使用List，单文件就用File
	 */
	private List<File> file;

	/**
	 * 上传文件的类型
	 */
	private List<String> fileContentType;
	
	/**
	 * 上传文件的名称
	 */
	private List<String> fileFileName;
	
	/**
	 * 此项名称
	 */
	private String itemName;
	

	/**
	 * 要删除的文件名
	 */
	private String deleFileName;
	
	/**
	 * 批量导入文件名称
	 */
	private String importFileName;
	
	/**
	 * 导入成绩的竞赛ID 
	 */
	private String examId;
	
	/**
	 * 下载的文件名称
	 */
	private String chooseFileName;
	
	/**
	 * 问题导入时传入的phaseId，项目流程Id
	 */
	private int phaseId;
	
	/**
	 * 问题导入时传入的reviewId，项目评审Id
	 */
	private int reviewId;
	/**
	 * 评审问题导入时传入的employeeId,项目责任人Id
	 */
	private String employeeId;
	
	/**
	 * 项目评审日期时间
	 */
	private String modifyDate;
	
	/**
	 * 文件输入流
	 */
	private FileInputStream inputStream;
	
	/**
	 * 文件信息列表
	 */
	private List<FileInfo> fileInfoLists;
	
	
	public String getDeleFileName() {
		return deleFileName;
	}

	public void setDeleFileName(String deleFileName) {
		this.deleFileName = deleFileName;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public static Logger getLog() {
		return log;
	}

	private JSONObject result;

	public List<File> getFile() {
		return file;
	}

	public void setFile(List<File> file) {
		this.file = file;
	}

	public List<String> getFileContentType() {
		return fileContentType;
	}

	public void setFileContentType(List<String> fileContentType) {
		this.fileContentType = fileContentType;
	}

	public List<String> getFileFileName() {
		return fileFileName;
	}

	public void setFileFileName(List<String> fileFileName) {
		this.fileFileName = fileFileName;
	}
	
	/**
	 * 文件上传处理方法<br/>
	 *  格式 {itemName:'employee',file:[文件数组]}
	 * @return
	 */
	public String uploadFile() {
		log.info("itemName=="+itemName);
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		log.info(admin.getId());
		String cUser  = (admin==null)?"anyone":admin.getId();
		String head = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		String currentpath =head+"\\"+itemName+"\\"+cUser+"\\";
		
		JSONObject obj = new JSONObject();
		try {
			File parentDirectory = new File(currentpath);
			if(!parentDirectory.exists()){
				parentDirectory.mkdirs();
			}
			for(int i=0; i<file.size();i++){
			
				File tempFile = file.get(i);
				String tempFileName=fileFileName.get(i);
				String newFileName = FileNameUtil.bulidNewFileName(parentDirectory,tempFileName);
				File f = new File(currentpath+newFileName);
				FileUtils.copyFile(tempFile, f);
//				log.info("fileName=="+fileFileName.get(i)+", contentType=="+fileContentType.get(i));
//				log.info("file-path:"+tempFile.getAbsolutePath());
//				log.info("save file-path:"+f.getAbsolutePath());
			}
			 
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			obj.put("result", "fail");
			obj.put("msg", "找不到要写入的文件");
			this.setResult(obj);
			return "success";
			
		} catch (IOException e) {
			e.printStackTrace();
			obj.put("result", "fail");
			obj.put("msg", "文件读写失败");
			this.setResult(obj);
			return "success";
		}catch (NullPointerException e) {
			obj.put("result", "fail");
			obj.put("msg", "参数错误");
			this.setResult(obj);
			return "fail";
		}catch(Exception e){
			obj.put("result", "fail");
			obj.put("msg", "服务器错误");
			this.setResult(obj);
			return "success";
		}
		
		obj.put("result", "success");
		obj.put("msg", "添加成功！");
		this.setResult(obj);
		return "success";
	}


	/**
	 * 获取已保存的文件信息，返回为JSON格式<br />
	 * {"direPath":"xxx","files":[{"fileName":xxx,"size":12KB,"lastModify":"yyyy-MM-dd HH:mm:ss","directory":true/false}]}
	 * @return
	 */
	public String getSavedFiles(){
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		//log.info(admin.getId());
		String cUser  = (admin==null)?"anyone":admin.getId();
		String currentDirectory = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		
		currentDirectory=currentDirectory+"\\"+itemName+"\\"+cUser;
		File directory = new File(currentDirectory);
		
		JSONObject obj = new JSONObject();
		cUser = StringUtils.isBlank(cUser)?"anyone":cUser;
		obj.put("direPath", itemName+"\\"+cUser);
		JSONArray arry = new JSONArray();
		
		File[] files = directory.listFiles();
		
		for(int i=0;i<files.length;i++){
			File2JSON temp = initFileParam(files[i]);
			arry.add(JSONObject.fromObject(temp));
		}
		//log.info(arry.toString());
		obj.put("files", arry);
		//log.info(obj.toString());
		result = obj;
		return "success";
	}
	
	/**
	 * 获取指定目录下已保存的文件信息<br />
	 *   请求格式：<br/>
	 *   AJAX -post  params: {itemName:'emplyee'}
	 *   返回信息为模板JSP
	 * @return
	 */
	public String listSavedFiles(){
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String cUser  = (admin==null)?"anyone":admin.getId();
		String currentDirectory = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		currentDirectory=currentDirectory+"\\"+itemName+"\\"+cUser;
		File directory = new File(currentDirectory);
		if(!directory.exists()){directory.mkdirs();}
		File[] files = directory.listFiles();
		setFileInfoLists(initeFileInfos(files));
		return "filetemplate";
	}
	
	

	/**
	 * 删除单个文件<br />
	 * 请求格式： iteName=employee&deleFileName=BUGLIST-研发人员绩效评估.xlsx<br />
	 * @return
	 */
	public String deleteFile(){
	
		JSONObject object = new JSONObject();
		//log.info(itemName+"--"+deleFileName);
		if(StringUtils.isBlank(itemName) || StringUtils.isBlank(deleFileName)){
			object.put("result", "fail");
			object.put("msg","参数错误");
			setResult(object);
			return "success";
		}
		
		String prefix = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		log.info(admin.getId());
		String cUser  = (admin==null)?"anyone":admin.getId();
		String filePath = prefix+"\\"+itemName+"\\"+cUser;
		File file =null;
		String path =null;
		try{
			path = filePath+"\\"+deleFileName;
			file = new File(path);
			boolean b = file.delete();
			if(b){
				object.put("result", "success");
				object.put("msg","删除成功");
			}else{
				object.put("result", "fail");
				object.put("msg","删除失败");
			}
			setResult(object);
			return "success";
		}catch(Exception e){
			e.printStackTrace();
			object.put("result", "fail");
			object.put("msg","删除失败");
			return "success";
		}
		
	}

	/**
	 * 批量导入文件中的数据至数据库<br/>
	 * 接收数据格式：<br/>
	 * { itemName:'employee',importFileName:'xxxxxxxx'}
	 * @return
	 */
	public String importFile(){
//		log.info("itemName---"+itemName);
//		log.info("importFileName---"+importFileName);
		
		String prefix = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String cUser  = (admin==null)?"anyone":admin.getId();
		String filePath = prefix+"\\"+itemName+"\\"+cUser+"\\"+importFileName;
		
		JSONObject obj = new JSONObject();
		Template2Employee<EmployeeModel> t2e= new Template2Employee<EmployeeModel>();
		try {
			List<EmployeeModel> etLists =  t2e.parseObj4Excel(filePath, EmployeeModel.class);
			BatchResultTemplate brt = employeeServiceImpl.saveTemplate(etLists);
			obj.put("result", "success");
			obj.put("msg", "录入有效数据"+brt.getImportRecodes()+"条，重复数据"+brt.getRepeatRecodes()+"条，总数据"+brt.getTotalRecodes()+"条");
			setResult(obj);
			return "success";
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("result", "success");
			obj.put("msg", "批量导入操作失败！");
			setResult(obj);
			return "success";
		}
	}
	/**
	 * 考试成绩批量导入<br />
	 * 数据格式： {itemName:'exam',examId,'2',importFileName:'xxxxxxxx'}
	 * @return
	 */
	public String examScoreImport(){
		log.info(examId);
		log.info(itemName);
		log.info(importFileName);
		JSONObject obj = new JSONObject();
		String prefix = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String cUser  = (admin==null)?"anyone":admin.getId();
		if(StringUtils.isBlank(importFileName)){
			obj.put(FinalConstant.JSON_RESULT, "fail");
			obj.put(FinalConstant.JSON_MSG, "添加失败，请选取要解析Excel文件！");
			setResult(obj);
			return "success";
		}
		String filePath = prefix+"\\"+itemName+"\\"+cUser+"\\"+importFileName;
		
		int examId =  (Integer) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_EXAMID);

		Template2Employeeexamr<ExamScoreModel> t2ee = new Template2Employeeexamr<ExamScoreModel>();
		
		List<ExamScoreModel> templateLists = null;
		try {
			templateLists = t2ee.parse2Obj(filePath, ExamScoreModel.class);
		} catch (Exception e) {
			e.printStackTrace();
			obj.put(FinalConstant.JSON_RESULT, "fail");
			obj.put(FinalConstant.JSON_MSG, "添加失败，Excel文档解析失败！");
			setResult(obj);
			return "success";
		}
		BatchResultTemplate brt  = employeeExamServiceImpl.saveTemplate(templateLists, examId);
		obj.put(FinalConstant.JSON_RESULT, "success");
		obj.put(FinalConstant.JSON_MSG, "添加"+brt.getImportRecodes()+"条数据，重复数据:"+brt.getRepeatRecodes()+
				"条，有效数据共："+brt.getTotalRecodes());
		setResult(obj);
		return "success";
	}
	
	/**
	 * 设计评审批量导入 <br />
	 * 格式是： {itemName:'problem\\design',importFileName:'xxxxxxx.xls',phaseId:1, reviewId:2, employeeId:'2013xxxx', projectId:'pId'}
	 * @return
	 */
	public String designProblemImport(){
		log.info("itemName="+itemName);
		log.info("phaseId="+phaseId);
		log.info("employeeId="+employeeId);
		//log.info("projectId"+projectId);
		log.info("importFileName="+importFileName);
		//TODO 前台需要选取该评审问题的项目相关责任人
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(importFileName)){
			obj.put(FinalConstant.JSON_RESULT, FinalConstant.RESULT_FAIL);
			obj.put(FinalConstant.JSON_MSG, "添加失败，请选取要解析Excel文件！");
			setResult(obj);
			return "success";
		}
		
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String commentId = (String) ActionContext.getContext().getSession().get("commentId");
		String cUser  = (admin==null)?"anyone":admin.getId();
		String currentDirectory = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		currentDirectory=currentDirectory+"\\"+itemName+"\\"+cUser;
		String filePath = currentDirectory+"\\"+importFileName;
		log.info("filePath="+filePath);
		Template2Problem<ProblemModel> t2p = new Template2Problem<ProblemModel>();
		List<ProblemModel> lists = null;
		Date createDate = null;
		try {
			lists = t2p.parse2Obj(filePath, ProblemModel.class);
			createDate = t2p.getCreateDate();
		} catch (Exception e) {
			e.printStackTrace();
			obj.put(FinalConstant.JSON_RESULT, FinalConstant.RESULT_FAIL);
			obj.put(FinalConstant.JSON_MSG, "添加失败，Excel文件解析出错！");
			setResult(obj);
			return "success";
		}
		Project project = (Project) ActionContext.getContext().getSession().get(FinalConstant.SESSION_CURRENT_PROJECT);
		BatchResultTemplate brt = problemServiceImpl.saveTemplates(lists, createDate, phaseId,commentId, employeeId, project);
		
		obj.put(FinalConstant.JSON_RESULT, FinalConstant.RESULT_SUCCESS);
		obj.put(FinalConstant.JSON_MSG, "添加"+brt.getImportRecodes()+"条数据，重复数据:"+brt.getRepeatRecodes()+
				"条，有效数据共："+brt.getTotalRecodes());
		setResult(obj);
		return "success";
	}
	/**
	 * 项目评审批量导入 <br />
	 * 格式是： {itemName:'problem\\project',importFileName:'xxxxxxx.xls'，modifyDate:'xxxx-xxx-xx'}
	 * @return
	 */
	public String projectProblemImport(){
		log.info("(projectProblemImport)~~itemName--"+itemName);
		log.info("(projectProblemImport)~~modifyDate--"+modifyDate);
		log.info("(projectProblemImport)~~importFileName--"+importFileName);
		
		JSONObject obj = new JSONObject();
		if(StringUtils.isBlank(importFileName)){
			obj.put(FinalConstant.JSON_RESULT, FinalConstant.RESULT_FAIL);
			obj.put(FinalConstant.JSON_MSG, "添加失败，请选取要解析Excel文件！");
			setResult(obj);
			return "success";
		}
		
		String filePath = fetcheFilePath();
		log.info("filePath--"+filePath);
		Template2ProjectReview<ProjectReviewInfoModel> t2pr = new Template2ProjectReview<ProjectReviewInfoModel>();
		Map<String,List<ProjectReviewInfoModel>> maps = null;
		try {
			maps = t2pr.parseExcel(filePath, ProjectReviewInfoModel.class, 2);
			if(maps!=null && maps.size()>0){
				t2pr.removeNullItems(maps);
				ProjectReviewInfoModelUtil.setProjectValue(maps);
				t2pr.removeUnusefulItems(maps);
				ProjectReviewInfoModelUtil.setZero(maps);
				Date date = DateUtils.parse(modifyDate, "yyyy-MM-dd");
				BatchResultTemplate brt = projectReviewServiceImpl.batchImport(
						ProjectReviewInfoModelUtil.changeTemplateAfterSetZero(maps), date );
				if(brt!=null){
					obj.put("result", "success");
					obj.put("msg", "导入数据"+brt.getImportRecodes()+"条，重复数据"+brt.getRepeatRecodes()+"条，有效数据"+brt.getTotalRecodes()+"条！");
					setResult(obj);
				}else{
					obj.put("result", "success");
					obj.put("msg", "导入数据0条，重复数据0条，有效数据0条！");
					setResult(obj);
				}
				return "success";
				
			}else{
				obj.put("result", "fail");
				obj.put("msg", "EXCEL文件不符合模板要求");
				setResult(obj);
				return "success";
			}
		
		} catch (Exception e) {
			e.printStackTrace();
			obj.put("result", "fail");
			obj.put("msg", "数据批量导入出错");
			setResult(obj);
			return "success";
		}
	}
	/**
	 * 文件下载传输方法<br/>
	 *   格式: fileUploadAction!downloadFile.action?itemName=employee&chooseFileName=xxxxx.xls
	 * @return
	 */
	public String downloadFile(){
		String prefix = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String cUser  = (admin==null)?"anyone":admin.getId();
		log.info(chooseFileName);
		String filePath = prefix+"\\"+itemName+"\\"+cUser+"\\"+chooseFileName;
		log.info(filePath);
		File file = new File(filePath);
		log.info(file.exists());
		if(file.exists()){
			try {
				setInputStream(new FileInputStream(file));
			} catch (FileNotFoundException e) {
				e.printStackTrace();
				//TODO 失败返回的什么啊；
			}
		}
		return "download";
	}
	
	/**
	 * 用作下载时设置下载文件名称为中文，只有get方法
	 * @return
	 */
	public String getDownloadFileName() {
		String downFileName = chooseFileName;
		try {
			downFileName = new String(downFileName.getBytes(), "ISO8859-1");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return downFileName;
	}
	
	
	
	private String fetcheFilePath(){
		Employee admin =  (Employee) ActionContext.getContext().getSession().get(FinalConstant.SESSION_LOGINER);
		String cUser  = (admin==null)?"anyone":admin.getId();
		String currentDirectory = ServletActionContext.getServletContext().getRealPath(FinalConstant.UPLOAD_PATH);
		currentDirectory=currentDirectory+"\\"+itemName+"\\"+cUser;
		String filePath = currentDirectory+"\\"+importFileName;
		return filePath.replace('\\', '/');
	}
	
	/**
	 * 
	 * @param file 文件对象
	 * @return 返回File2JSON对象，用于对象强转JSONObject
	 */
	private File2JSON initFileParam(File file){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date lastModifyDate = new Date(file.lastModified());
		
		return new File2JSON(file.getName(),
				FileNameUtil.getContainerSize(file.length(), 2), 
				sdf.format(lastModifyDate),
				file.isDirectory());
	}
	
	/**
	 * 对文件进行重新链表格式化，方便前端JSP读取
	 * @param files
	 * @return
	 */
	private List<FileInfo> initeFileInfos(File[] files) {
		if(files==null|| files.length==0){
			return null;
		}
		List<FileInfo> fileInfos = new ArrayList<FileInfo>();
		for(int i=0; i<files.length;i++){
			File file = files[i];
			FileInfo item = new FileInfo(file.getName(), FileNameUtil.getContainerSize(file.length(), 2), new Date(file.lastModified()), file.isDirectory());
			fileInfos.add(item);
		}
		//对文件进行最后修改日期排序
		Collections.sort(fileInfos);
		return fileInfos;
	}
	
	
	
	public JSONObject getResult() {
		return result;
	}

	public void setResult(JSONObject result) {
		this.result = result;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}


	public List<FileInfo> getFileInfoLists() {
		return fileInfoLists;
	}

	public void setFileInfoLists(List<FileInfo> fileInfoLists) {
		this.fileInfoLists = fileInfoLists;
	}

	public String getImportFileName() {
		return importFileName;
	}

	public void setImportFileName(String importFileName) {
		this.importFileName = importFileName;
	}

	
	public String getChooseFileName() {
		return chooseFileName;
	}

	public void setChooseFileName(String chooseFileName) {
		this.chooseFileName = chooseFileName;
	}

	public FileInputStream getInputStream() {
		return inputStream;
	}

	public void setInputStream(FileInputStream inputStream) {
		this.inputStream = inputStream;
	}

	public String getExamId() {
		return examId;
	}

	public void setExamId(String examId) {
		this.examId = examId;
	}

	public int getPhaseId() {
		return phaseId;
	}

	public void setPhaseId(int phaseId) {
		this.phaseId = phaseId;
	}

	public int getReviewId() {
		return reviewId;
	}

	public void setReviewId(int reviewId) {
		this.reviewId = reviewId;
	}

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}
	
}
