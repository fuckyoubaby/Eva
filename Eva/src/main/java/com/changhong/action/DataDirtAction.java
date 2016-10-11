package com.changhong.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONArray;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.convention.annotation.Action;
import org.apache.struts2.convention.annotation.InterceptorRef;
import org.apache.struts2.convention.annotation.Namespace;
import org.apache.struts2.convention.annotation.ParentPackage;
import org.apache.struts2.convention.annotation.Result;
import org.apache.struts2.convention.annotation.Results;
import org.apache.struts2.json.annotations.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.changhong.entities.DataDirt;
import com.changhong.service.DataDirtService;


@ParentPackage("jsonPackage")
@Controller("dataDirtAction")
@Namespace(value="/dataDirt")
@Scope("prototype")
@Results({@Result(name="init_tree",location="/adminEnter/dataDirectory/data_directory_info.jsp"),
          @Result(name="add_dirt",type="json",params={"excludeNullProperties","false"}),
          @Result(name="update_dirt",type="json",params={"excludeNullProperties","false"}),
          @Result(name="delete_node",type="json",params={"excludeNullProperties","false"})
})

public class DataDirtAction {
	
	@Autowired
	private DataDirtService dataDirtService;
	
    private String jsonInit;
    
    private String result;
    
    private Integer pId;
    private Integer nId;
    private String name;
    //rename
    private String newName;
    //private String resultUpdate;
    //delete
    private String []nIdArray;
    //private String resultDelete;

	@JSON(serialize = false)
	@Action(value="allLists",results={
			@Result(name="init_tree",location="/adminEnter/dataDirectory/data_directory_info.jsp")
	})
	public String getAllLists(){
		List<DataDirt> list = dataDirtService.getAllLists();
		JSONArray jsonArray = new JSONArray().fromObject(list);
		setJsonInit(jsonArray.toString());
		return "init_tree";
	}
	
	@Action(value="addOne",results={@Result(name="add_dirt",type="json")}, interceptorRefs={@InterceptorRef(value="mydefault")})
	public String addDirt(){
		//dataDirtService.addDirt(3);
		//System.out.println(pId);
		HttpServletRequest request = ServletActionContext.getRequest();
		pId = Integer.parseInt(request.getParameter("pId"));
		//System.out.println("pId="+pId);
		DataDirt dataDirt = new DataDirt();
		if(pId!=null&&pId!=0){
			dataDirt.setpId(pId);	
			dataDirt.setName("新的节点");
			int maxId = dataDirtService.getMaxNID();
			//System.out.println("maxId="+maxId);
			//dataDirt.setnId(maxId+1);
			dataDirt.setnId(maxId+1);
			int i = dataDirtService.addDirt(dataDirt);
			//System.out.println("i="+i);
			result = i>0?"success":"fail";
		}else{
			result = "fail";
		}
		if(result.equals("success")){
			/*setnId(dataDirt.getnId());
			setpId(dataDirt.getpId());*/
			setnId(dataDirt.getnId());
			setpId(dataDirt.getpId());
			setName(dataDirt.getName());
		}
		return "add_dirt";        
	}

	@Action(value="dataDirtUpdate",results={@Result(name="update_dirt",type="json")}, interceptorRefs={@InterceptorRef(value="mydefault")})
	public String updateDirt(){
		HttpServletRequest request = ServletActionContext.getRequest();
		nId = Integer.parseInt(request.getParameter("nId"));
		//System.out.println("update nId="+nId);
		
		newName = request.getParameter("newName");
		//System.out.println("update newName="+newName);
		
		if(nId != null && newName != null && newName.length()!=0){
			boolean b = dataDirtService.updateDirt(nId, newName);
			//System.out.println("update b="+b);
			result= b?"success":"fail";
		}else {
			result = "fail";
		}
		return "update_dirt";
	}
	
	@Action(value="dataNodeDelete",results={@Result(name="delete_node",type="json")}, interceptorRefs={@InterceptorRef(value="mydefault")})
	public String deleteNode(){
		HttpServletRequest request = ServletActionContext.getRequest();
		nIdArray =  request.getParameterValues("nodeArray[]");
		int len = nIdArray.length;
		if(len==0){
			result="fail";
		}else {
		int i = 0;
		for(;i<len;i++){
			DataDirt dataDirt = dataDirtService.getNode(Integer.parseInt(nIdArray[i]));
		
			dataDirtService.deleteNode(dataDirt);
			//System.out.println("11111111---1111111");	
		   }
		if(i==len){
			result = "success";
		  }
		}
		return "delete_node";
	}
	
	@JSON(serialize = false)  
	public String getJsonInit() {
		return jsonInit;
	}

	public void setJsonInit(String jsonInit) {
		this.jsonInit = jsonInit;
	}
	
    @JSON
	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}
	
	@JSON
	public Integer getpId() {
		return pId;
	}

	public void setpId(Integer pId) {
		this.pId = pId;
	}
	
	@JSON
	public Integer getnId() {
		return nId;
	}
	public void setnId(Integer nId) {
		this.nId = nId;
	}
	
    @JSON
    public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	@JSON
	public String getNewName() {
		return newName;
	}

	public void setNewName(String newName) {
		this.newName = newName;
	}
	
	/*@JSON
	public String getResultUpdate() {
		return resultUpdate;
	}

	public void setResultUpdate(String resultUpdate) {
		this.resultUpdate = resultUpdate;
	}*/
	
	@JSON
	public String[] getnIdArray() {
		return nIdArray;
	}

	public void setnIdArray(String[] nIdArray) {
		this.nIdArray = nIdArray;
	}
	
	/*@JSON
	public String getResultDelete() {
		return resultDelete;
	}

	public void setResultDelete(String resultDelete) {
		this.resultDelete = resultDelete;
	}*/
	
}
