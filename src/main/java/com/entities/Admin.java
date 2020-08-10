package com.entities;

import javax.persistence.*;

@Entity
public class Admin {

	public Admin(int id, String name, String email, String password, byte[] image) {
		super();
		Id = id;
		Name = name;
		Email = email;
		Password = password;
		this.image = image;
	}
	@Id
	private int Id;
	private String Name;
	private String Email;
	private String Password;
	@Lob
	private byte[] image;
	public int getId() {
		return Id;
	}
	public void setId(int id) {
		Id = id;
	}
	public String getName() {
		return Name;
	}
	public void setName(String name) {
		Name = name;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String email) {
		Email = email;
	}
	public String getPassword() {
		return Password;
	}
	public void setPassword(String password) {
		Password = password;
	}
	
	public Admin() {
		super();
		// TODO Auto-generated constructor stub
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	
}
