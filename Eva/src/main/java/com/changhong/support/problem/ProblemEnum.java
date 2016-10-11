package com.changhong.support.problem;

public enum ProblemEnum {

	A("A"),B("B"),C("C");
	private String value;
	public String getValue(){
		return this.value;
	}
	private ProblemEnum(String value){
		this.value = value;
	}
	
	public static boolean isContainer(String value){
		ProblemEnum [] pes = ProblemEnum.values();
		for(int i=0;i<pes.length;i++){
			if(pes[i].getValue().equals(value)){
				return true;
			}
		}
		return false;
	}
}
