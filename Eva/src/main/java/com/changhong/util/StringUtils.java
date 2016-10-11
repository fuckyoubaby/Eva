package com.changhong.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;


public class StringUtils {

	/**
	 * �ж��ַ�Ϊ��
	 * @param str
	 * @return
	 */
	public static boolean isNotEmpty(String str){
		if(str==null){
			return false;
		}else if(str.length()==0){
			return false;
		}else return true;
	}
	
	/**
	 * �ж��ַ�Ϊ��
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str){
		return !isNotEmpty(str);
	}
	
	/**
	 * �ж�Ϊ�գ��ո�ȥ����жϣ�
	 * @param str
	 * @return
	 */
	public static boolean isEmptyExcepetSpace(String str){
		if(str==null){
			return true;
		}else if(str.trim().length()==0){
			return true;
		}else return false;
	}
	
	/**
	 * �ж��ַ�Ϊ�գ��ո�ȥ����жϣ�
	 * @param str
	 * @return
	 */
	public static boolean isNotEmptyExceptSpace(String str){
		return !isEmptyExcepetSpace(str);
	}
	
	/**
	 * ��ȡָ���ļ���ĺ�׺
	 * @param fileName �ļ���
	 * @return ��׺
	 */
	public static String getFileExtend(String fileName){
		String ext = null;
		if(isNotEmpty(fileName)){
			ext = fileName.substring(fileName.lastIndexOf(".")+1, fileName.length());
			return ext;
		}else return "";
	}
	
	/**
	 * Ϊ�ϴ��ļ��Զ������ļ���ƣ������ظ�
	 * @param fileName �ϴ��ļ����ļ����
	 * @param randomNum �����
	 * @param datePattern ���ڸ�ʽ���磺yyyyMMddhhmmss
	 * @return ��ɵ��ļ���(����׺)
	 */
	public static String generateFileName(String fileName, int randomNum, String datePattern){
		
		SimpleDateFormat format = new SimpleDateFormat(datePattern);
		String formatDate = format.format(new Date());
		//���һ�������
		int random = new Random().nextInt(randomNum);
		String extension = getFileExtend(fileName);
		return formatDate + random + extension;
	}
	
	
}
