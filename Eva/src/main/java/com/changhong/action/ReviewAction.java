package com.changhong.action;

import org.apache.struts2.convention.annotation.Action;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.service.ReviewService;

@Action("reviewAction")
public class ReviewAction {
	
	@Autowired
	private ReviewService reviewService;
	
	
}
