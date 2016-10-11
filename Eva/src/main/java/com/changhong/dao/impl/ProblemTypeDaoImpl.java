package com.changhong.dao.impl;

import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProblemTypeDao;
import com.changhong.entities.Problemtype;

@Repository("problemTypeDao")
public class ProblemTypeDaoImpl extends BaseDaoImpl<Problemtype> implements ProblemTypeDao{

}
