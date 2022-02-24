package com.codingdojo.languages.entity;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Entity
@Table(name = "languages")
@Data
public class Language {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@NotNull
	@Size(min = 2, max = 20, message = "Language name must be at least 2 characters long")
	private String name;
	
	@NotNull
	@Size(min = 2, max = 20, message = "Creator name must be at least 2 characters long")
	private String creator;
	
	@NotNull
	@Size(min = 1, max = 200, message = "Current version must be at least 1 character long")
	private String currentVersion;
	
    @Column(updatable = false)
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date createdAt;
    
    @DateTimeFormat(pattern="yyyy-MM-dd")
    private Date updatedAt;
    
    public Language() {}
    
    public Language(String name, String creator, String currentVersion) {
    	this.name = name;
    	this.creator = creator;
    	this.currentVersion = currentVersion;
    }
    
    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
        this.updatedAt = new Date();
    }
}
