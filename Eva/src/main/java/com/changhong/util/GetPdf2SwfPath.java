package com.changhong.util;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import com.changhong.test.PathTest;

public class GetPdf2SwfPath {

	public static String getPath()
	{
		Properties properties = new Properties();
		String propertiesPath = GetPdf2SwfPath.class.getClassLoader().getResource("").getPath();
		String path = "";
		
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(propertiesPath+"path.properties"));
			properties.load(in);
			path = properties.getProperty("pdf2swf");
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return path;
	}
}
