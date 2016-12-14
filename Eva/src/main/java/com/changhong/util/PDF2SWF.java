package com.changhong.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;

public class PDF2SWF {
	public static int pdf2swf(String sourceFile,String destFile) throws IOException, InterruptedException
	{
		//Ŀ��·������������Ŀ��·��
		File dest = new File(destFile);
		if (!dest.getParentFile().exists()) {
			dest.getParentFile().mkdirs();
		}
		
		//Դ�ļ�·���������򷵻�-1
		File source = new File(sourceFile);
		if (!source.exists()) {
			return -1;
		}
		
		//String sWFTools_Home = "D:/Program Files (x86)/SWFTools";
		String sWFTools_Home = GetPdf2SwfPath.getPath();
		String xpdf = GetPdf2SwfPath.getXPDFPath();
		
		//String command = sWFTools_Home+"\\pdf2swf.exe "+sourceFile+" -o "+destFile+" -T 9";
	
		
		String command2 = sWFTools_Home+"\\pdf2swf.exe "+sourceFile+" -o "+destFile+" -T 9" + " -s languagedir="+xpdf;
		Process process = Runtime.getRuntime().exec(command2);
		process.waitFor();
		dest.createNewFile();
		/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		
		while (bufferedReader.readLine()!=null) {
			
		}*/
		return 0;
	}
	
	public static void main(String[] args) throws IOException, InterruptedException {
		String sourcePath = "C:/Users/shijinxiang/Desktop/[经验分享]（HI3796真待机重启问题（针对特定电视连接HDMI情况））.pdf";
		String destPath = "C:/Users/shijinxiang/Desktop/[经验分享]（HI3796真待机重启问题（针对特定电视连接HDMI情况））.swf";
		
	
			PDF2SWF.pdf2swf(sourcePath, destPath);
		
	}
}
