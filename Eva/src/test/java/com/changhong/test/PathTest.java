package com.changhong.test;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class PathTest {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Properties properties = new Properties();
		String path = PathTest.class.getClassLoader().getResource("").getPath();
		System.out.println("path = "+path);
		try {
			InputStream in = new BufferedInputStream(new FileInputStream(path+"path.properties"));
			properties.load(in);
			String value = properties.getProperty("pdf2swf");
			System.out.println("value="+value);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
