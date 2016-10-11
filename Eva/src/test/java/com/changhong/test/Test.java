package com.changhong.test;

import java.io.File;

public class Test {

	public static void main(String[] args) {
		String filePath ="D:\\apache-tomcat-6.0.43-windows-x64\\apache-tomcat-6.0.43\\webapps\\Eva\\WEB-INF\\upload\\employee\\admin\\考试成绩模板.xls";
		File file = new File(filePath);
		System.out.println(file.getName()+"--"+file.exists());
	}
}
