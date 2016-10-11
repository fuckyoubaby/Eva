package com.changhong.dao.impl;

import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ClassifyDao;
import com.changhong.entities.Classify;

@Repository("classifyDao")
public class ClassifyDaoImpl extends BaseDaoImpl<Classify> implements ClassifyDao{

}
