package com.entities;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="team_Name")
public class AddTeam {
	
	@Id
	private int id;
	private String teamName;
	private String teamLogo;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamLogo() {
		return teamLogo;
	}
	public void setTeamLogo(String teamLogo) {
		this.teamLogo = teamLogo;
	}
	public AddTeam(int id, String teamName,String teamLogo) {
		super();
		this.id = id;
		this.teamName = teamName;
		this.teamLogo = teamLogo;
	}
	public AddTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	

}
