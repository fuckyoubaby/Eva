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
		
		String command = sWFTools_Home+"\\pdf2swf.exe "+sourceFile+" -o "+destFile+" -T 9";
		Process process = Runtime.getRuntime().exec(command);
		process.waitFor();
		dest.createNewFile();
		/*BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(process.getInputStream()));
		
		while (bufferedReader.readLine()!=null) {
			
		}*/
		return 0;
	}
	public static void main(String[] args) throws IOException, InterruptedException {
		PDF2SWF.pdf2swf("", "");
	}
	/*public static void main(String[] args) {
		String sourcePath = "C:/Users/shijinxiang/Desktop/[�������]��ƵbufferӰ��EMC�������.pdf";
		String destPath = "C:/Users/shijinxiang/Desktop/[�������]��ƵbufferӰ��EMC�������.swf";
		
		try {
			PDF2SWF.pdf2swf(sourcePath, destPath);
		} catch (IOException | InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}*/
}
