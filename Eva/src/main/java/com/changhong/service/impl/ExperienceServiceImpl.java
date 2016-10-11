package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.DataDirtDao;
import com.changhong.dao.ExperienceDao;
import com.changhong.entities.Experience;
import com.changhong.service.ExperienceService;
import com.changhong.util.ExpParams;
import com.changhong.util.Params;

@Service("experienceService")
public class ExperienceServiceImpl implements ExperienceService{

	@Autowired
	private ExperienceDao experienceDao;
	
	@Autowired
	private DataDirtDao dataDirtDao;
	
	
	@Override
	public List<Experience> getExperiencesByPage(int offset, int length,
			String keyword) {
		// TODO Auto-generated method stub
		return experienceDao.getExperiencesByPage(offset, length, keyword);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return experienceDao.getCount(keyword);
	}

	@Override
	public Experience getExperience(int experienceId) {
		// TODO Auto-generated method stub
		return experienceDao.get(Experience.class, experienceId);
	}

	@Override
	public void delete(Experience experience) {
		experienceDao.delete(experience);
	}

	@Override
	public void update(Experience experience) {
		experienceDao.update(experience);
	}

	@Override
	public void save(Experience experience) {
		experienceDao.save(experience);
	}

	@Override
	public List<Integer> getAllNum() {
		// TODO Auto-generated method stub
		return experienceDao.getAllNum();
	}

	@Override
	public List<Experience> getExperiencesByEmployeeIdAndDate(
			String employeeId, Date startTime, Date endTime) {
		// TODO Auto-generated method stub
		return experienceDao.getExperiencesByEmployeeIdAndDate(employeeId, startTime, endTime);
	}

	@Override
	public List<Experience> getExperiencesByPage(Params params) {
		
		if(params instanceof ExpParams){
			ExpParams p = (ExpParams)params;
			int nodeId = p.getDirctId();
			if(nodeId!=-1){
				p.setHasChild(dataDirtDao.hasChildNode(nodeId));
			}
		}
		return experienceDao.getExperiencesByPage(params);
	}

	@Override
	public int getCount(Params params) {
		if(params instanceof ExpParams){
			ExpParams p = (ExpParams)params;
			int nodeId = p.getDirctId();
			if(nodeId!=-1){
				p.setHasChild(dataDirtDao.hasChildNode(nodeId));
			}
		}
		return experienceDao.getCount(params);
	}

}
