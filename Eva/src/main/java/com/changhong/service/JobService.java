package com.changhong.service;

import java.util.List;

import com.changhong.entities.Job;

public interface JobService {

	List<Job> getJobs();
	Job getJob(int jobId);
}
