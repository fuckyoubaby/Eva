package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.SecondWeightDao;
import com.changhong.entities.Secondweight;
import com.changhong.service.SecondWeightService;

@Service("secondWeightService")
public class SecondWeightServiceImpl implements SecondWeightService{

	@Autowired
	private SecondWeightDao secondWeightDao;
	@Override
	public List<Secondweight> getSecondweightsByModeId(int modeId) {
		// TODO Auto-generated method stub
		return secondWeightDao.getSecondweightsByModeId(modeId);
	}

	@Override
	public void save(Secondweight secondweight) {
		secondWeightDao.save(secondweight);
	}

	@Override
	public void update(Secondweight secondweight) {
		secondWeightDao.update(secondweight);
	}

	@Override
	public void delete(Secondweight secondweight) {
		secondWeightDao.delete(secondweight);
	}

	@Override
	public Secondweight getSecondweightByModeIdAndType(int modeId,
			String problemType) {
		List<Secondweight> list = secondWeightDao.getSecondweightsByModeIdAndType(modeId, problemType);
		
		if (list.size()>0) {
			return list.get(0);
		}else {
			return null;
		}
	}

}
