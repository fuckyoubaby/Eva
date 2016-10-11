function projectClick()
{
	
	//alert("addProject---addProject---addProject -----");
	/*var projectName = $('input[name=projectName]').val();
	var pId = $('input[name=pId]').val();
	var area = $('input[name=area]').val();
	var classify = $('select[name=classify]').val();
	var projectDescribe = $('textarea[name=projectDescribe]').val();
	var str = "projectName="+projectName+"&proId="+pId;
	
	
	$(".right-content-body").load("projectAction!savaProject.action?"+str);
	*/
	var options={
			url:'projectAction!savaProject.action',
			type:'post',
			dataType:'text',
			data:$('#addProjectForm').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/project/project_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function examClick()
{
	var options={
			url:'examAction!sava.action',
			type:'post',
			dataType:'text',
			data:$('#addExamForm').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/examing/examing_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}
function trainClick()
{
	var options={
			url:'studyAction!sava.action',
			type:'post',
			dataType:'text',
			data:$('#addTrainForm').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/training/training_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}


function fun(){
	obj = document.getElementsByName("chkName");
	chkName = [];
	for(k in obj){
		if(obj[k].checked)
			chkName.push(obj[k].value);
	}
	var options={
			url:'examAction!delete.action?chkName='+chkName,
			type:'post',
			dataType:'text',
			success:function(){
				$(".right-content-body").load("adminEnter/examing/examing_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}


function deleteExamGrade(){
	obj = document.getElementsByName("chkName");
	chkName = [];
	for(k in obj){
		if(obj[k].checked)
			chkName.push(obj[k].value);
	}
	var options={
			url:'examGradeAction!delete.action?chkName='+chkName,
			type:'post',
			dataType:'text',
			success:function(){
				$(".right-content-body").load("adminEnter/examing/examing_score_lists.jsp");
			}
	};
	 $.ajax(options);
     return false;
}
function experienceDelete(){
	obj = document.getElementsByName("chkName");
	chkName = [];
	for(k in obj){
		if(obj[k].checked)
			chkName.push(obj[k].value);
	}
	var options={
			url:'experienceAction!delete.action?chkName='+chkName,
			type:'post',
			dataType:'text',
			success:function(){
				$(".right-content-body").load("adminEnter/experienceBase/experience_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function studyDelete(){
	obj = document.getElementsByName("chkName");
	chkName = [];
	for(k in obj){
		if(obj[k].checked)
			chkName.push(obj[k].value);
	}
	var options={
			url:'studyAction!delete.action?chkName='+chkName,
			type:'post',
			dataType:'text',
			success:function(){
				$(".right-content-body").load("adminEnter/training/training_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function projectUpdate()
{
	var options={
			url:'projectAction!update.action',
			type:'post',
			dataType:'text',
			data:$('#projectUpdate').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/project/project_info.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function examUpdate()
{
	var options={
			url:'examAction!update.action',
			type:'post',
			dataType:'text',
			data:$('#examUpdate').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/examing/examing_index.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function studyUpdate()
{
	var options={
			url:'studyAction!update.action',
			type:'post',
			dataType:'text',
			data:$('#studyUpdate').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/training/training_info.jsp");
			}
	};
	 $.ajax(options);
     return false;
}

function problemClick()
{
	var options={
			url:'problemAction!save.action',
			type:'post',
			dataType:'text',
			data:$('#addproblemForm').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/project/project_info.jsp");
			}
	};
	 $.ajax(options);
     return false;
}
function examGradeAdd()
{
	var options={
			url:'examGradeAction!save.action',
			type:'post',
			dataType:'text',
			data:$('#examGradeAdd').serialize(),
			success:function(){
				$(".right-content-body").load("adminEnter/examing/examing_score_lists.jsp");
			}
	};
	 $.ajax(options);
     return false;
}