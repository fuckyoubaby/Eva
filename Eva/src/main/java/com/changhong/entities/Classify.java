package com.changhong.entities;

import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


/**
 * Classify entity. @author MyEclipse Persistence Tools
 */
@Entity
@Table(name="classify"
    ,catalog="performance"
)

public class Classify  implements java.io.Serializable {


    // Fields    

     private Integer classifyId;
     private String classifyName;
     private Set<Experience> experiences = new HashSet<Experience>(0);


    // Constructors

    /** default constructor */
    public Classify() {
    }

    
    /** full constructor */
    public Classify(String classifyName, Set<Experience> experiences) {
        this.classifyName = classifyName;
        this.experiences = experiences;
    }

   
    // Property accessors
    @Id @GeneratedValue
    
    @Column(name="Classify_Id", unique=true, nullable=false)

    public Integer getClassifyId() {
        return this.classifyId;
    }
    
    public void setClassifyId(Integer classifyId) {
        this.classifyId = classifyId;
    }
    
    @Column(name="Classify_Name", length=20)

    public String getClassifyName() {
        return this.classifyName;
    }
    
    public void setClassifyName(String classifyName) {
        this.classifyName = classifyName;
    }
@OneToMany(cascade=CascadeType.ALL, fetch=FetchType.LAZY, mappedBy="classify")

    public Set<Experience> getExperiences() {
        return this.experiences;
    }
    
    public void setExperiences(Set<Experience> experiences) {
        this.experiences = experiences;
    }
   








}