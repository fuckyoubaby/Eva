package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.PatentDao;
import com.changhong.entities.Patent;
import com.changhong.service.PatentService;
import com.changhong.util.Params;

@Service("patentService")
public class PatentServiceImpl implements PatentService{

	@Autowired
	private PatentDao patentDao;
	
	@Override
	public List<Patent> getPatentsByEmployeeId(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return patentDao.getPatentsByEmployeeId(employeeId, startDate, endDate);
	}

	@Override
	public void save(Patent patent) {
		patentDao.save(patent);
	}

	@Override
	public void update(Patent patent) {
		patentDao.update(patent);
	}

	@Override
	public void delete(Patent patent) {
		patentDao.delete(patent);
	}

	@Override
	public boolean isExit(String patentId) {
		Patent patent = new Patent();
		patent = patentDao.get(Patent.class, patentId);
		if (patent==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public List<Patent> getPatentsByPage(Params params) {
		// TODO Auto-generated method stub
		return patentDao.getPatentsByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return patentDao.getCount(params);
	}

	@Override
	public Patent get(String patentId) {
		return patentDao.get(Patent.class, patentId);
	}

}
