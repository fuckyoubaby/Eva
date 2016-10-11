package com.changhong.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.AssistDao;
import com.changhong.dao.impl.AssistDaoImpl;
import com.changhong.entities.Assist;
import com.changhong.service.AssistService;
import com.changhong.util.Params;

@Service("assistService")
public class AssistServiceImpl implements AssistService{

	@Autowired
	private AssistDao assistDao;
	
	
	@Override
	public List<Assist> getAssistsByEmployeeId(String employeeId,
			Date startDate, Date endDate) {
		// TODO Auto-generated method stub
		return assistDao.getAssistsByEmployeeId(employeeId, startDate, endDate);
	}

	@Override
	public void save(Assist assist) {
		assistDao.save(assist);
	}

	@Override
	public void delete(Assist assist) {
		assistDao.delete(assist);
	}

	@Override
	public void update(Assist assist) {
		assistDao.update(assist);
	}

	@Override
	public List<Assist> getAssistsByPage(Params params) {
		// TODO Auto-generated method stub
		return assistDao.getAssistsByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return assistDao.getCount(params);
	}

	@Override
	public Assist get(int id) {
		
		return assistDao.get(Assist.class, id);
	}

	
}
