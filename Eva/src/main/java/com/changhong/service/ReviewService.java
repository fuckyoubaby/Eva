package com.changhong.service;

import java.util.List;

import com.changhong.entities.Review;

public interface ReviewService {

	List<Review> getReviewsByPhaseId(int phaseId);
	void save(Review review);
	void delete(Review review);
	void update(Review review);
	List<Review> getAllReview();
	
	Review getReview(int reviewId);
	/**
	 * 通过项目阶段和评审名称获取评审对象
	 * @param phase 项目阶段ID
	 * @param reviewName 评审名称
	 * @return
	 */
	Review getReviewByNameAndPhase(Integer phase, String reviewName);
}
