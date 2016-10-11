package com.changhong.service.impl;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ReviewDao;
import com.changhong.entities.Review;
import com.changhong.service.ReviewService;

@Service("reviewService")
public class ReviewServiceImpl implements ReviewService{

	@Autowired
	private ReviewDao reviewDao;
	@Override
	public List<Review> getReviewsByPhaseId(int phaseId) {
		return reviewDao.getByPhase(phaseId);
	}

	@Override
	public void save(Review review) {
		reviewDao.save(review);
	}

	@Override
	public void delete(Review review) {
		reviewDao.delete(review);
	}

	@Override
	public void update(Review review) {
		reviewDao.update(review);
	}

	@Override
	public List<Review> getAllReview() {
		// TODO Auto-generated method stub
		return reviewDao.findAll(Review.class);
	}

	@Override
	public Review getReview(int reviewId) {
		// TODO Auto-generated method stub
		return reviewDao.get(Review.class, reviewId);
	}

	@Override
	public Review getReviewByNameAndPhase(Integer phase, String reviewName) {
		if(StringUtils.isBlank(reviewName))
			return null;
		return reviewDao.getByNameAndPhaseId(phase, reviewName);
	}
	
}
