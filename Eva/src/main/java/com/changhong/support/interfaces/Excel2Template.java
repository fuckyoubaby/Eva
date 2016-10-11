package com.changhong.support.interfaces;

import java.lang.reflect.Field;
import java.util.List;

public abstract class Excel2Template<T> {
	
	
	public abstract List<T> parse2Obj(String filePath, Class<T> clazz) throws Exception;
	
	
	public String[] getField4Class(Class<T> clazz){
		Field [] fields = clazz.getDeclaredFields();
		String [] fieldNames = new String[fields.length];
		for(int i=0;i<fields.length;i++){
			fieldNames[i] = fields[i].getName();
		}
		return fieldNames;
	}
}
