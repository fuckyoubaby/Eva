package com.changhong.util;

import java.util.HashMap;
import java.util.regex.Pattern;

/**
 * 正则表达式验证工具类
 * @author 郭潇阳
 * @version 1.0
 * @since 2015-8-21
 */
public class RegUtil {
	
	public static HashMap<String, String> regexp = new HashMap<String, String>(18);
	public static final String REG_DATE="date";
	public static final String REG_NUMBER="number";
	public static final String REG_TELPHONE="telphone";
	public static final String REG_SHORT_NUMBER="shortNumber";
	public static final String REG_IDCARD="IdCard";
	public static final String REG_EMAIL="email";
	static{
		regexp.put("date", "^((\\d{2}(([02468][048])|([13579][26]))[\\.]?((((0?[13578])|(1[02]))[\\.]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\.]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\.]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\.]?((((0?[13578])|(1[02]))[\\.]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\.]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\.]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\-(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
		regexp.put("number", "(^[0]$)|((^[1-9](\\d)*)$)");
		regexp.put("telphone", "^((13[0-9])|(15[^4\\D])|(18[0,5-9]))\\d{8}$");
		regexp.put("IdCard", "(^\\d{15}$)|(^\\d{17}([0-9]|X)$)");
		regexp.put("email","^([a-z0-9A-Z]+[-|_|\\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\\.)+[a-zA-Z]{2,}$");
		regexp.put("shortNumber", "\\d{3,6}");
	}
	/**
	 * 检测特定格式的日期字符串: yyyy.MM.dd-hh:mm:ss
	 * @param date 测试的字符串
	 * @return true-符合要求；false-不符合要求
	 */
	public static boolean isTrueDate(String date){
		Pattern p = Pattern.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\.]?((((0?[13578])|(1[02]))[\\.]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\.]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\.]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\.]?((((0?[13578])|(1[02]))[\\.]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\.]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\.]?((0?[1-9])|(1[0-9])|(2[0-8]))))))(\\-(((0?[0-9])|([1-2][0-3]))\\:([0-5]?[0-9])((\\s)|(\\:([0-5]?[0-9])))))?$");
		return p.matcher(date).matches();
	}
	
	/**
	 * 检测特定格式的日期字符串: yyyy-MM-dd
	 * @param date 测试的字符串
	 * @return true-符合要求；false-不符合要求
	 */
	public static boolean isTrueShortDate(String date){
		Pattern p = Pattern.compile("^((\\d{2}(([02468][048])|([13579][26]))[\\-]?((((0?[13578])|(1[02]))[\\-]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-]?((0?[1-9])|([1-2][0-9])))))|(\\d{2}(([02468][1235679])|([13579][01345789]))[\\-]?((((0?[13578])|(1[02]))[\\-]?((0?[1-9])|([1-2][0-9])|(3[01])))|(((0?[469])|(11))[\\-]?((0?[1-9])|([1-2][0-9])|(30)))|(0?2[\\-]?((0?[1-9])|(1[0-9])|(2[0-8]))))))$");
		return p.matcher(date).matches();
	}
	
	/**
	 * 校验数字个是字符串, 不能0开头除非为0
	 * @param num 测试的字符串
	 * @return true-符合要求；false-不符合要求
	 */
	public static boolean isNumber(String num){
		Pattern pattern = Pattern.compile("(^[0]$)|((^[1-9](\\d)*)$)");
		//boolean result = pattern.matcher(num).matches();
		return pattern.matcher(num).matches();
	}
	
	/**
	 * 手机号码验证
	 * @param number 手机号码
	 * @return true-符合要求；false-不符合要求
	 */
	public static boolean isTelPhone(String number){
		Pattern pattern = Pattern.compile("^((13[0-9])|(15[^4\\D])|(18[0,5-9]))\\d{8}$");
	//	boolean result = pattern.matcher(number).matches();
		return pattern.matcher(number).matches();
	}
	/**
	 * 简单的身份证验证
	 * @param cardNumber 身份证
	 * @return true-符合格式；false-不符合格式
	 */
	public static boolean isIdCard(String cardNumber){
		Pattern pattern = Pattern.compile("(^\\d{15}$)|(^\\d{17}([0-9]|X)$)");
	//	boolean result = pattern.matcher(cardNumber).matches();
		return pattern.matcher(cardNumber).matches();
	}
	
	/**
	 * 通用检测方法
	 * @param data 要检测的内容
	 * @param type 检测的类型
	 * @return true-符合要求，false-不符合要求
	 */
	public static boolean checkRegexp(String data, String type){
		if(regexp.containsKey(type)){
			Pattern pattern = Pattern.compile(regexp.get(type));
			return pattern.matcher(data).matches();
			
		}else return false;
		
	}
	
	
	
	
	
}
