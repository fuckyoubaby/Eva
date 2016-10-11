package com.changhong.dao;

import java.util.List;

import com.changhong.base.BaseDao;
import com.changhong.entities.DataDirt;

public interface DataDirtDao extends BaseDao<DataDirt> {
	
	public int getMaxNID();
	public int getAmount();
	public List<DataDirt> getAllLists();
	public boolean updateDirt(Integer nId, String newName);
	public int addDirt(DataDirt obj);
    
	List<DataDirt> getDataDirtsByPID(int pid);
	
	boolean hasChildNode(int nodeId);
}
