package com.changhong.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;


/**
 * DataDirt entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="data_dirt"
    ,catalog="performance"
)

public class DataDirt  implements java.io.Serializable {


    // Fields    

     private Integer nId;
     private Integer pId;
     private String name;


    // Constructors

     /** default constructor */
 	public DataDirt() {
 	}

 	/** full constructor */
 	public DataDirt(Integer pId, String name) {
 		this.pId = pId;
 		this.name = name;
 	}

 	// Property accessors
 	@Id
 	@GeneratedValue
 	@Column(name = "nID", unique = true, nullable = false)
 	public Integer getnId() {
 		return this.nId;
 	}

 	public void setnId(Integer nid) {
 		this.nId = nid;
 	}

 	@Column(name = "pID")
 	public Integer getpId() {
 		return this.pId;
 	}

 	public void setpId(Integer pid) {
 		this.pId = pid;
 	}

 	@Column(name = "name", length = 20)
 	public String getName() {
 		return this.name;
 	}

 	public void setName(String name) {
 		this.name = name;
 	}

}