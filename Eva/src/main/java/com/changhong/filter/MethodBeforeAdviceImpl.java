package com.changhong.filter;

import java.lang.reflect.Method;

import org.springframework.aop.MethodBeforeAdvice;

import com.changhong.entities.Employee;
import com.opensymphony.xwork2.ActionContext;

public class MethodBeforeAdviceImpl implements MethodBeforeAdvice{

	@Override
	public void before(Method arg0, Object[] arg1, Object arg2)
			throws Throwable {
		Employee employee = (Employee) ActionContext.getContext().getSession().get("employee");
		if (employee==null||employee.equals("")) {
		}
	}

}
