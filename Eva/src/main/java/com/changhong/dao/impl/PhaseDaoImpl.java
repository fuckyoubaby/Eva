package com.changhong.dao.impl;

import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.PhaseDao;
import com.changhong.entities.Phase;

@Repository("phaseDao")
public class PhaseDaoImpl extends BaseDaoImpl<Phase> implements PhaseDao{

}
