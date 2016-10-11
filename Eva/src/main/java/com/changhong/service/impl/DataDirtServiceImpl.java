package com.changhong.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.changhong.dao.DataDirtDao;
import com.changhong.entities.DataDirt;
import com.changhong.service.DataDirtService;
@Service("dataDirtService")
@Transactional
public class DataDirtServiceImpl implements DataDirtService {
	
    @Autowired
	private DataDirtDao dataDirtDao;

	@Override
	public List<DataDirt> getAllLists() {
		// TODO Auto-generated method stub
		return dataDirtDao.findAll(DataDirt.class);
	}

	@Override
	public int getMaxNID() {
		// TODO Auto-generated method stub
		return dataDirtDao.getMaxNID();
	}

	@Override
	public int getAmount() {
		// TODO Auto-generated method stub
		return dataDirtDao.getAmount();
	}

	@Override
	public boolean updateDirt(Integer nId, String newName) {
		// TODO Auto-generated method stub
		if(dataDirtDao.updateDirt(nId, newName)){
			return true;
		}else {
			return false;
		}
	}

	/**
	 * 增加一个节点
	 */
	@Override
	public int addDirt(DataDirt dataDirt) {
		// TODO Auto-generated method stub
		int result = dataDirtDao.addDirt(dataDirt);
		return result;
	}

	@Override
	public void deleteNode(DataDirt obj) {
		// TODO Auto-generated method stub
		dataDirtDao.delete(obj);
	}

	@Override
	public DataDirt getNode(Integer nId) {
		// TODO Auto-generated method stub
	return 	dataDirtDao.get(DataDirt.class, nId);
	}

	@Override
	public List<DataDirt> getDataDirtsByPID(int pid) {
		// TODO Auto-generated method stub
		return dataDirtDao.getDataDirtsByPID(pid);
	}

}
