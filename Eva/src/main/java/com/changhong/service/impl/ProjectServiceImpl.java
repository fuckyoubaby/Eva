package com.changhong.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.changhong.dao.PhaseDao;
import com.changhong.dao.ProjectDao;
import com.changhong.entities.Phase;
import com.changhong.entities.Project;
import com.changhong.service.ProjectService;
import com.changhong.util.Params;
import com.changhong.util.QuestionCount;

@Service("projectService")
public class ProjectServiceImpl implements ProjectService{
	@Autowired
	private ProjectDao projectDao;
	@Autowired
	private PhaseDao phaseDao;

	private static final Logger log = LoggerFactory.getLogger(ProjectServiceImpl.class);
	@Override
	public List<Project> getProjectByPage(int pno, int length, String keyword) {
		// TODO Auto-generated method stub
		return projectDao.getProjectsByPage(pno, length, keyword);
	}

	@Override
	public Project getProjectById(String projectId) {
		// TODO Auto-generated method stub
		return projectDao.get(Project.class, projectId);
	}

	@Override
	public int getCount(String keyword) {
		// TODO Auto-generated method stub
		return projectDao.getCount(keyword);
	}

	@Override
	public void save(Project project) {
		projectDao.save(project);
	}

	@Override
	public void delete(Project project) {
		projectDao.delete(project);
	}

	@Override
	public void update(Project project) {
		projectDao.update(project);
	}

	@Override
	public List<Project> getProjectByPageForUser(int pno, int length,
			String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return projectDao.getPorjectsByPageForUser(pno, length, keyword, employeeId);
	}

	@Override
	public int getCountForUser(String keyword, String employeeId) {
		// TODO Auto-generated method stub
		return projectDao.getCountForUser(keyword, employeeId);
	}

	@Override
	public List<Project> getProjectByPage(Params params) {
		// TODO Auto-generated method stub
		log.info("params = "+params.getOrderType());
		return projectDao.getProjectsByPage(params);
	}

	@Override
	public int getCount(Params params) {
		// TODO Auto-generated method stub
		return projectDao.getCount(params);
	}

	@Override
	public List<Project> getProjectByPageForUser(Params params,
			String employeeId) {
		// TODO Auto-generated method stub
		return projectDao.getPorjectsByPageForUser(params, employeeId);
	}

	@Override
	public int getCountForUser(Params params, String employeeId) {
		// TODO Auto-generated method stub
		return projectDao.getCountForUser(params, employeeId);
	}
	@Override
	public int getCountForProjectName(String projectName) {
		
		return projectDao.getAmountForProjectName(projectName);
	}

	@Override
	public String getReviewIdByProjectId(String projectId) {
		// TODO Auto-generated method stub
		return projectDao.getReviewIdByProjectId(projectId);
	}

	@Override
	public Map<Integer, QuestionCount> getProjectProblemsCount(String projectId) {
		Map<Integer, QuestionCount> qcMaps = new HashMap<Integer, QuestionCount>();
		List phases = phaseDao.findAll(Phase.class);
		for(int i=0; i<phases.size();i++){
			Phase phaseTemp = (Phase) phases.get(i);
			List lists = projectDao.getAllReviewCount(projectId, phaseTemp.getPhaseId());
			Object[] objects = (Object[]) lists.get(0);
			QuestionCount qc = new QuestionCount((Integer)objects[0], (Integer)objects[1], (Integer)objects[2]);
			qcMaps.put(phaseTemp.getPhaseId(), qc);
		}
		return qcMaps;
	}

}
