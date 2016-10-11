package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.ModeProblemModeRDao;
import com.changhong.entities.Modeproblemmoder;
import com.changhong.service.ModeProblemModeRService;

@Service("modeProblemModeRService")
public class ModeProblemModeRServiceRImpl implements ModeProblemModeRService{

	@Autowired 
	private ModeProblemModeRDao modeProblemModeRDao;
	@Override
	public boolean isExist(int modeId, int problemModeId) {
		// TODO Auto-generated method stub
		return modeProblemModeRDao.isExist(modeId, problemModeId);
	}

	@Override
	public void save(Modeproblemmoder modeproblemmoder) {
		modeProblemModeRDao.save(modeproblemmoder);
	}

	@Override
	public void delete(Modeproblemmoder modeproblemmoder) {
		modeProblemModeRDao.delete(modeproblemmoder);
	}

	@Override
	public void update(Modeproblemmoder modeproblemmoder) {
		modeProblemModeRDao.update(modeproblemmoder);
	}

	@Override
	public List<Modeproblemmoder> getModeproblemmoders() {
		// TODO Auto-generated method stub
		return modeProblemModeRDao.findAll(Modeproblemmoder.class);
	}

	@Override
	public List<Modeproblemmoder> getModeproblemmodersByModeId(int modeId) {
		// TODO Auto-generated method stub
		return modeProblemModeRDao.getModeproblemmodersByModeId(modeId);
	}

	@Override
	public void delete(int modeId, int problemModeId) {
		modeProblemModeRDao.delete(modeId, problemModeId);
	}

}
