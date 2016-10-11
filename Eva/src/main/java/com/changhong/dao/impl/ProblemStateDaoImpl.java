package com.changhong.dao.impl;

import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.ProblemStateDao;
import com.changhong.entities.Problemstate;

@Repository("problemStateDao")
public class ProblemStateDaoImpl extends BaseDaoImpl<Problemstate> implements ProblemStateDao{

}
