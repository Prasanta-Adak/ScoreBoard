package com.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class AddNews {

	@Id
	private int id;
	private String type;
	private String title;
	private String image;
	@Column(length=2000)
	private String description;
	private  Date date;
	
	public AddNews(int id, String type, String title, String image, String description, Date date) {
		super();
		this.id = id;
		this.type = type;
		this.title = title;
		this.image = image;
		this.description = description;
		this.date = date;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public AddNews() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
}
