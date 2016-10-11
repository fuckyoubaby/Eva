package com.changhong.support;

public class FinalConstant {
	
	/**
	 * 登陆存入session的Employee对象的key
	 */
	public final static String SESSION_LOGINER = "loginer";
	/**
	 * 系统管理员对应的权限
	 */
	public final static int SYSTEM_ADMIN = 0;
	/**
	 * 系统普通用户对应的权限
	 */
	public final static int SYSTEM_USER = 1;
	/**
	 * 超级管理员对应的权限
	 */
	public final static int SUPER_ADMIN = 2;
	
	/**
	 * 当前存入session的 考试Id
	 */
	public final static String SESSION_CURRENT_EXAMID = "examId";
	/**
	 * 当前session存入的project对象
	 */
	public final static String SESSION_CURRENT_PROJECT = "project";
	
	/**
	 * 文件上传保存路径
	 */
	public final static String UPLOAD_PATH="WEB-INF\\upload";
	/**
	 * JSON结果
	 */
	public final static String JSON_RESULT="result";
	
	/**
	 * JSON结果:success
	 */
	public final static String RESULT_SUCCESS="success";
	/**
	 * JSON结果:fail
	 */
	public final static String RESULT_FAIL="fail";
	/**
	 * JSON消息体
	 */
	public final static String JSON_MSG="msg";
	
	/**
	 * 模型添加模块 一级分类
	 */
	public final static String PROFESSIONAL_SKILL="专业技术";
	
	public final static String COMPLIANCE="合规";
	
	public final static String COMMUNICATION_MANAGEMENT="沟通管理";
	
	public final static String SELF_GROWTH="自我成长";
	
	public final static String CONTRIBUTION_TO_COMPANY="对公司的贡献";
	
	/**
	 * 模型添加模块 二级分类
	 */
	public static enum PROFESSIONAL_SKILL_enum {  
		一般设计缺陷, 低级错误 
		} 
	public static enum COMPLIANCE_enum {  
		  设计规定,流程规定
		}
	public static enum COMMUNICATION_MANAGEMENT_enum {  
		  工作积极性,沟通能力,工作计划性
		}
	public static enum SELF_GROWTH_enum {  
		  学习积极性,考试
		}
	public static enum CONTRIBUTION_TO_COMPANY_enum {  
		专利,经验库,标准化,重要信息收集,项目文档,培训,其他
		}
	
}
