package com.changhong.service;

import java.util.List;

import com.changhong.entities.DataDirt;

public interface DataDirtService {
	public int getMaxNID();
	public int getAmount();
	public List<DataDirt> getAllLists();
	
	public boolean updateDirt(Integer nId, String newName);
	public int addDirt(DataDirt dataDirt);
    public void deleteNode(DataDirt obj);
    public DataDirt getNode(Integer nId);
    
    List<DataDirt> getDataDirtsByPID(int pid);
}
