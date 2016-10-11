package com.changhong.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Experience;
import com.changhong.service.ExperienceService;
import com.opensymphony.xwork2.ActionSupport;

@Namespace("/download")  
@Action("download") 
@Results({
	     @Result(name="SUCCESS",type="stream",
         params={
		"contentType","application/octet-stream",
		"inputName", "inputStream", 
		"contentDisposition", "attachment;filename=\"${fileName}\"",
		"bufferSize","4096"})
		})
public class FileDownloadAction  extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private int experienceId;    
	private String fileName;
	
	@Autowired
	private ExperienceService experienceService;
	
    @Action(results= {@Result(name="SUCCESS", type = "stream", 
    		params = {"contentType", "application/octet-stream;charset=utf-8", 
            "inputName","inputStream", 
            "contentDisposition","attachment;filename=\"${fileName}\"",   
            "bufferSize", "4096"}) 
         })  
	public String execute(){
		Experience experience = experienceService.getExperience(experienceId);
		String url = experience.getExUrl();	
		File file = new File(url);
		setFileName(file.getName());
		return "SUCCESS";
	}

	public InputStream getInputStream(){
		Experience experience = experienceService.getExperience(experienceId);
		String url = experience.getExUrl();	
		File file = new File(url);
		fileName = file.getName();
		//System.out.println("下载文件名"+fileName);
		InputStream inStream = null;
		try {
			inStream = new FileInputStream(file);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return inStream;
	}
	
	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
	public int getExperienceId() {
		return experienceId;
	}

	public void setExperienceId(int experienceId) {
		this.experienceId = experienceId;
	}
	
}
