package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.JobDao;
import com.changhong.entities.Job;
import com.changhong.service.JobService;

@Service("jobService")
public class JobServiceImpl implements JobService{

	@Autowired
	private JobDao jobDao;
	@Override
	public List<Job> getJobs() {
		// TODO Auto-generated method stub
		return jobDao.findAll(Job.class);
	}
	@Override
	public Job getJob(int jobId) {
		// TODO Auto-generated method stub
		return jobDao.get(Job.class, jobId);
	}

}
