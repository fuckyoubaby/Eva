package com.changhong.action;

import java.util.List;

import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.springframework.beans.factory.annotation.Autowired;

import com.changhong.entities.Phase;
import com.changhong.service.PhaseService;

@Action("phaseAction")
@Results({
	@Result(name="fail",location="/login.jsp")
})
public class PhaseAction {
	@Autowired
	private PhaseService phaseService;
	
	private String phaseId;
	private Phase phase;
	private List<Phase> phases;
	
	
	public String getPhaseId() {
		return phaseId;
	}


	public void setPhaseId(String phaseId) {
		this.phaseId = phaseId;
	}


	public Phase getPhase() {
		return phase;
	}


	public void setPhase(Phase phase) {
		this.phase = phase;
	}


	public List<Phase> getPhases() {
		return phases;
	}


	public void setPhases(List<Phase> phases) {
		this.phases = phases;
	}


	public String getAll()
	{
		phases = phaseService.getAll();
		return "all";
	}
	public String save()
	{
		Phase phase = new Phase();
		phaseService.save(phase);
		return "save";
	}
	public String delete()
	{
		Phase phase = new Phase();
		phaseService.delete(phase);
		return "delete";
	}
	public String getPhaseById()
	{
		phase = phaseService.getPhase(Integer.parseInt(phaseId));
		return "phase";
	}
}
