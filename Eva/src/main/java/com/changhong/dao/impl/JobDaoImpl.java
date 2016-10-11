package com.changhong.dao.impl;

import org.springframework.stereotype.Repository;

import com.changhong.base.impl.BaseDaoImpl;
import com.changhong.dao.JobDao;
import com.changhong.entities.Job;

@Repository("jobDao")
public class JobDaoImpl extends BaseDaoImpl<Job> implements JobDao{

}
