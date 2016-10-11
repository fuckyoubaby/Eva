package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.Comprehensive;

public interface ComprehensiveDao extends BaseDao<Comprehensive>{
	
	List<Comprehensive> getComprehensivesByPage(int offset,int length,String keyword);
	int getCount(String keyword);

}
